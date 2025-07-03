<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8" />
        <title>Product Management</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mdb.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>
        <style>
            body {
                font-family: 'Roboto', Arial, sans-serif;
                background: linear-gradient(120deg, #f6d365 0%, #a770ef 100%);
                margin: 0;
                padding: 0;
                min-height: 100vh;
            }
            .product-header {
                background: linear-gradient(90deg, #a770ef 0%, #f6d365 100%);
                color: #fff;
                text-align: center;
                padding: 44px 0 28px 0;
                margin: 0;
                font-size: 2.5rem;
                font-weight: 700;
                letter-spacing: 2px;
                border-radius: 0 0 24px 24px;
                box-shadow: 0 4px 24px rgba(167,112,239,0.10);
                position: relative;
            }
            .product-header .fa-boxes-stacked {
                margin-right: 12px;
                font-size: 2.1rem;
                vertical-align: middle;
            }
            .product-content {
                display: flex;
                flex-direction: column;
                align-items: stretch;
                margin: 48px auto 0 auto;
                gap: 22px;
                max-width: 1300px;
                background: #fff;
                border-radius: 18px;
                box-shadow: 0 6px 32px rgba(167,112,239,0.13);
                padding: 48px 48px 44px 48px;
                font-size: 1.25rem;
            }
            .product-content a {
                display: flex;
                align-items: center;
                text-decoration: none;
                font-size: 1.22rem;
                color: #fff;
                background: linear-gradient(90deg, #a770ef 0%, #f6d365 100%);
                padding: 18px 36px;
                border-radius: 8px;
                font-weight: 500;
                box-shadow: 0 2px 8px rgba(167,112,239,0.08);
                transition: background 0.3s, transform 0.2s;
                margin-bottom: 0;
            }
            .product-content a i {
                margin-right: 14px;
                font-size: 1.2rem;
            }
            .product-content a:hover {
                background: linear-gradient(90deg, #f6d365 0%, #a770ef 100%);
                transform: translateY(-2px) scale(1.03);
                box-shadow: 0 4px 16px rgba(167,112,239,0.18);
            }
            .search-result-box {
                margin-top: 24px;
                background: #f9f9f9;
                border-radius: 10px;
                box-shadow: 0 2px 8px rgba(167,112,239,0.07);
                padding: 40px 36px;
                max-width: 1200px;
                font-size: 1.02em;
                margin-left: auto;
                margin-right: auto;
            }
            .search-result-box h4 {
                margin-bottom: 12px;
                color: #a770ef;
                font-size: 1.1rem;
                font-weight: 600;
            }
            .table {
                background: #fff;
                border-radius: 8px;
                overflow: hidden;
                font-size: 1.22em;
            }
            .table th, .table td {
                padding: 22px 22px;
                font-size: 1.13em;
            }
            .action-btn {
                background: #a770ef;
                color: #fff;
                border: none;
                border-radius: 6px;
                padding: 10px 22px;
                text-decoration: none;
                display: inline-flex;
                align-items: center;
                font-size: 1.08rem;
                margin-right: 6px;
                transition: background 0.2s;
            }
            .action-btn:hover {
                background: #f6d365;
                color: #fff;
            }
            @media (max-width: 600px) {
                .product-header {
                    font-size: 1.3rem;
                    padding: 18px 0 10px 0;
                }
                .product-content {
                    max-width: 98vw;
                    padding: 18px 8px 18px 8px;
                }
                .product-content a {
                    font-size: 1rem;
                    padding: 10px 10px;
                }
                .search-result-box {
                    padding: 10px 2px;
                }
            }
            @media (max-width: 1200px) {
                .search-result-box {
                    max-width: 98vw;
                    padding: 10px 2vw;
                }
            }
            tr[style*='cursor:pointer']{transition:background 0.2s;}
            tr[style*='cursor:pointer']:hover{background:#f3eaff;}
        </style>
    </head>
    <body>
        <div class="product-header">
            <i class="fas fa-boxes-stacked"></i> PRODUCT MANAGEMENT
        </div>
        <div class="product-content">
            <a href="${pageContext.request.contextPath}/addproduct"><i class="fas fa-plus"></i> Add Product</a>
            <!-- Xóa nút Update Product cũ -->
            <form action="${pageContext.request.contextPath}/productmanagement" method="post" style="width:100%;display:flex;gap:10px;">
                <input type="text" name="productName" class="form-control" placeholder="Nhập tên sản phẩm cần sửa..." required style="flex:1;">
                <button type="submit" class="action-btn" style="background: linear-gradient(90deg, #a770ef 0%, #f6d365 100%); color:#fff; border:none; border-radius:8px; padding: 0 18px;">
                    <i class="fas fa-search"></i> Tìm kiếm & Sửa
                </button>
            </form>

            <c:if test="${not empty searchResults}">
                <div class="search-result-box">
                    <h4>Kết quả tìm kiếm:</h4>
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên sản phẩm</th>
                                <th>Giá (các biến thể)</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="product" items="${searchResults}">
                                <tr style="cursor:pointer;" onclick="window.location='${pageContext.request.contextPath}/updateproduct?productID=${product.productID}'">
                                    <td>${product.productID}</td>
                                    <td>${product.productName}</td>
                                    <td>
                                        <ul style="padding-left: 0; margin: 0; list-style: none;">
                                            <c:forEach var="variant" items="${product.variants}">
                                                <c:set var="sizeValue" value="" />
                                                <c:set var="colorValue" value="" />
                                                <c:forEach var="vav" items="${variant.attributeValues}">
                                                    <c:if test="${vav.attribute.attributeName == 'Size'}">
                                                        <c:set var="sizeValue" value="${vav.value}" />
                                                    </c:if>
                                                    <c:if test="${vav.attribute.attributeName == 'Color'}">
                                                        <c:set var="colorValue" value="${vav.value}" />
                                                    </c:if>
                                                </c:forEach>
                                                <li style="margin-bottom: 14px; padding: 10px 14px; background: #f8f8ff; border-radius: 7px; border: 1px solid #ececec; box-shadow: 0 1px 3px rgba(167,112,239,0.04);">
                                                    <span style="font-weight: bold; color: #a770ef; font-size: 1.08em;">Giá:
                                                        <fmt:formatNumber value="${variant.price}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                                    </span>
                                                    <div style="margin-top: 4px; color: #444; font-size: 0.98em;">
                                                        <c:if test="${not empty sizeValue}">
                                                            <span style="display: inline-block; margin-right: 12px;"><b>Size:</b> ${sizeValue}</span>
                                                        </c:if>
                                                        <c:if test="${not empty colorValue}">
                                                            <span style="display: inline-block;"><b>Màu:</b> ${colorValue}</span>
                                                        </c:if>
                                                    </div>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </td>
                                    <td>
                                        <form action="${pageContext.request.contextPath}/updateproduct" method="get" style="display:inline;">
                                            <input type="hidden" name="productID" value="${product.productID}" />
                                            <button type="submit" class="action-btn">
                                                <i class="fas fa-edit"></i> Sửa
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>

            <!-- Hiển thị tất cả sản phẩm nếu không tìm kiếm -->
            <c:if test="${not empty productList}">
                <div class="search-result-box">
                    <h4>Danh sách tất cả sản phẩm:</h4>
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên sản phẩm</th>
                                <th>Giá (các biến thể)</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="product" items="${productList}">
                                <tr style="cursor:pointer;" onclick="window.location='${pageContext.request.contextPath}/productmanagement?productID=${product.productID}'">
                                    <td>${product.productID}</td>
                                    <td>${product.productName}</td>
                                    <td>
                                        <ul style="padding-left: 0; margin: 0; list-style: none;">
                                            <c:forEach var="variant" items="${product.variants}">
                                                <c:set var="sizeValue" value="" />
                                                <c:set var="colorValue" value="" />
                                                <c:forEach var="vav" items="${variant.attributeValues}">
                                                    <c:if test="${vav.attribute.attributeName == 'Size'}">
                                                        <c:set var="sizeValue" value="${vav.value}" />
                                                    </c:if>
                                                    <c:if test="${vav.attribute.attributeName == 'Color'}">
                                                        <c:set var="colorValue" value="${vav.value}" />
                                                    </c:if>
                                                </c:forEach>
                                                <li style="margin-bottom: 14px; padding: 10px 14px; background: #f8f8ff; border-radius: 7px; border: 1px solid #ececec; box-shadow: 0 1px 3px rgba(167,112,239,0.04);">
                                                    <span style="font-weight: bold; color: #a770ef; font-size: 1.08em;">Giá:
                                                        <fmt:formatNumber value="${variant.price}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                                    </span>
                                                    <div style="margin-top: 4px; color: #444; font-size: 0.98em;">
                                                        <c:if test="${not empty sizeValue}">
                                                            <span style="display: inline-block; margin-right: 12px;"><b>Size:</b> ${sizeValue}</span>
                                                        </c:if>
                                                        <c:if test="${not empty colorValue}">
                                                            <span style="display: inline-block;"><b>Màu:</b> ${colorValue}</span>
                                                        </c:if>
                                                    </div>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </td>
                                    <td>
                                        <form action="${pageContext.request.contextPath}/updateproduct" method="get" style="display:inline;">
                                            <input type="hidden" name="productID" value="${product.productID}" />
                                            <button type="submit" class="action-btn">
                                                <i class="fas fa-edit"></i> Sửa
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
        </div>
        <div style="text-align:center; margin-top:2rem;">
            <a href="${pageContext.request.contextPath}/admindashboard" class="btn btn-secondary" style="background:linear-gradient(90deg,#a770ef 0%,#f6d365 100%);color:#fff;border:none;border-radius:8px;padding:10px 32px;font-weight:500;text-decoration:none;">
                <i class="fas fa-arrow-left"></i> Quay lại trang quản trị
            </a>
        </div>
    </body>
</html>
