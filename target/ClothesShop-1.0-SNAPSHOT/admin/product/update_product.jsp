<%-- 
    Document   : update_product
    Created on : Jun 2, 2025, 10:40:22 PM
    Author     : manht
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Cập nhật sản phẩm</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mdb.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>
        <style>
            body {
                background: linear-gradient(120deg, #f6d365 0%, #a770ef 100%);
                font-family: 'Roboto', Arial, sans-serif;
                min-height: 100vh;
            }
            .update-product-container {
                max-width: 900px;         /* Tăng chiều rộng tối đa */
                margin: 60px auto;
                background: #fff;
                border-radius: 16px;
                box-shadow: 0 6px 24px rgba(167,112,239,0.10);
                padding: 48px 40px;       /* Tăng padding cho rộng */
            }
            .update-product-container h2 {
                color: #6c2eb7;
                font-weight: 700;
                margin-bottom: 32px;
                text-align: center;
                letter-spacing: 1px;
            }
            .form-label {
                font-weight: 500;
                color: #6c2eb7;
            }
            .form-control {
                border-radius: 8px;
                border: 1.5px solid #d1c4e9;
                font-size: 1.2rem;      /* Tăng cỡ chữ */
                margin-bottom: 18px;
                padding: 16px 18px;     /* Tăng padding */
                transition: border 0.2s;
            }
            .form-control:focus {
                border: 1.5px solid #a770ef;
                outline: none;
                box-shadow: 0 0 0 2px #e1bee7;
            }
            .btn-primary {
                background: linear-gradient(90deg, #a770ef 0%, #f6d365 100%);
                border: none;
                font-weight: 600;
                border-radius: 8px;
                padding: 10px 0;
                font-size: 1.1rem;
                transition: background 0.2s;
            }
            .btn-primary:hover {
                background: linear-gradient(90deg, #f6d365 0%, #a770ef 100%);
            }
            .alert {
                max-width: 500px;
                margin: 18px auto 0 auto;
                border-radius: 8px;
                font-size: 1.1rem;
                font-weight: 500;
                letter-spacing: 0.5px;
                box-shadow: 0 2px 12px rgba(0,0,0,0.07);
            }
            .custom-alert {
                animation: fadeIn 0.7s;
                border-radius: 12px;
                box-shadow: 0 2px 12px rgba(0,0,0,0.10);
                font-size: 1.13rem;
                font-weight: 600;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 8px;
                padding: 14px 0;
            }
            .alert-danger.custom-alert {
                background: #ffeaea;
                color: #d32f2f;
                border: 1.5px solid #f8bbbc;
            }
            .alert-success.custom-alert {
                background: #eaffea;
                color: #388e3c;
                border: 1.5px solid #b6eab7;
            }
            .custom-alert i {
                font-size: 1.4em;
            }
            @keyframes fadeIn {
                from { opacity: 0; transform: translateY(-10px); }
                to { opacity: 1; transform: translateY(0); }
            }
        </style>
    </head>
    <body>
        <div class="update-product-container">
            <h2><i class="fas fa-edit"></i> Cập nhật sản phẩm</h2>
            <form action="${pageContext.request.contextPath}/updateproduct" method="post">
                <input type="hidden" name="productId" value="${product.productID}" />
                <div class="mb-3">
                    <label class="form-label">Tên sản phẩm</label>
                    <input type="text" class="form-control" name="productName" value="${product.productName}" required />
                </div>
                <div class="mb-3">
                    <label class="form-label">Mô tả</label>
                    <textarea class="form-control" name="description" required>${product.description}</textarea>
                </div>
                <div class="mb-3">
                    <label class="form-label">Loại sản phẩm</label>
                    <div class="form-control" style="background:#f8f8ff;" readonly>
                        ${product.type.typeName}
                    </div>
                </div>
                <div class="mb-3">
                    <label class="form-label">Thương hiệu</label>
                    <div class="form-control" style="background:#f8f8ff;" readonly>
                        ${product.brand.brandName}
                    </div>
                </div>
                <h4 style="color:#a770ef;margin-top:2rem;margin-bottom:1rem;font-size:1.15em;">Biến thể sản phẩm</h4>
                <c:forEach var="variant" items="${variants}" varStatus="vs">
                    <div style="border:1.5px solid #e1bee7; border-radius:10px; padding:16px; margin-bottom:18px; background:#faf7ff;">
                        <input type="hidden" name="variantIds" value="${variant.variantID}" />
                        <div class="mb-2">
                            <label class="form-label">Giá biến thể</label>
                            <input type="number" step="0.01" min="0" class="form-control" name="variantPrices" value="${variant.price}" required />
                        </div>
                        <div class="mb-2">
                            <label class="form-label">Số lượng</label>
                            <input type="number" min="0" class="form-control" name="variantQuantities" value="${variant.quantity}" required />
                        </div>
                        <div class="mb-2">
                            <label class="form-label">Thuộc tính biến thể</label>
                            <ul style="padding-left:0;list-style:none;">
                                <c:forEach var="vav" items="${variant.attributeValues}" varStatus="attrStatus">
                                    <li style="margin-bottom:6px;">
                                        <b>${vav.attribute.attributeName}:</b>
                                        <input 
                                            type="text" 
                                            class="form-control" 
                                            style="display:inline-block;width:auto;min-width:120px;background:#f3f0fa;" 
                                            name="variantAttrValues_${vs.index}" 
                                            value="${vav.value}" 
                                            required
                                        />
                                        <input type="hidden" name="variantAttrIds_${vs.index}" value="${vav.attribute.attributeID}" />
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <c:if test="${not empty variant.images}">
                            <div class="mb-2">
                                <label class="form-label">Ảnh biến thể</label>
                                <div>
                                    <c:forEach var="img" items="${variant.images}">
                                        <c:if test="${img ne null}">
                                            <c:if test="${not empty img.url}">
                                                <img src="${img.url}" alt="Ảnh biến thể" style="height:100%; width:180px; object-fit:cover; border-radius:8px; margin-right:16px; border:1px solid #eee;">
                                            </c:if>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </c:forEach>
                <button type="submit" class="btn btn-primary w-100">Cập nhật</button>
            </form>
            <c:if test="${not empty error}">
                <div class="alert alert-danger custom-alert mt-3 text-center">
                    <i class="fas fa-times-circle"></i> ${error}
                </div>
            </c:if>
            <c:if test="${not empty success}">
                <div class="alert alert-success custom-alert mt-3 text-center">
                    <i class="fas fa-check-circle"></i> ${success}
                </div>
            </c:if>
            <div style="text-align:center; margin-top:1.5rem;">
                <a href="${pageContext.request.contextPath}/admindashboard" class="btn btn-secondary" style="background:linear-gradient(90deg,#a770ef 0%,#f6d365 100%);color:#fff;border:none;border-radius:8px;padding:10px 32px;font-weight:500;text-decoration:none;">
                    <i class="fas fa-arrow-left"></i> Quay lại trang quản trị
                </a>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/js/mdb.min.js"></script>
    </body>
</html>
