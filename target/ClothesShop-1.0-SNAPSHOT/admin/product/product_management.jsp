<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css"/>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8" />
        <title>Product Management</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mdb.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>
    </head>
    <body>
        <div class="dashboard-container">
            <%@ include file="../sidebar.jspf" %>
            <main class="main-content">
                <div class="product-header">
                    <i class="fas fa-boxes-stacked"></i> PRODUCT MANAGEMENT
                </div>
                <div class="product-content">
                    <a href="${pageContext.request.contextPath}/addproduct" class="btn-add"><i class="fas fa-plus"></i> Add Product</a>

                    <form action="${pageContext.request.contextPath}/productmanagement" method="post" class="mb-3 d-flex gap-2">
                        <input type="text" name="productName" class="form-control flex-1" placeholder="Nhập tên sản phẩm cần sửa..." required>
                        <button type="submit" class="action-btn">
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
                                        <tr class="table-row-clickable" onclick="window.location='${pageContext.request.contextPath}/updateproduct?productID=${product.productID}'">
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
                                                        <li class="variant-list-item">
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
                                        <tr class="table-row-clickable" onclick="window.location='${pageContext.request.contextPath}/productmanagement?productID=${product.productID}'">
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
                                                        <li class="variant-list-item">
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
            </main>
        </div>
    </body>
</html>
