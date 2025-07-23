<%-- 
    Document   : update_product
    Created on : Jun 2, 2025, 10:40:22 PM
    Author     : manht
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css"/>
<style>
    .variant-image-left {
        width: 30%;
        height: 500px;
        object-fit: cover;
        border-radius: 10px;
        border: 1.5px solid #eee;
        display: block;
        margin: 0 0 16px 0;
        background: #faf7ff;
    }
    .update-product-container .form-control,
    .update-product-container textarea {
        width: 100%;
        max-width: 100%;
        box-sizing: border-box;
    }
    input[name="productName"], textarea[name="description"] {
        width: 100%;
        max-width: 100%;
        box-sizing: border-box;
    }
</style>
<div class="dashboard-container">
    <%@ include file="../sidebar.jspf" %>
    <main class="main-content">
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
                                                <img src="${img.url}" alt="Ảnh biến thể" class="variant-image-left">
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
    </main>
</div>
        <script src="${pageContext.request.contextPath}/js/mdb.min.js"></script>
    </body>
</html>
