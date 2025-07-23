<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css"/>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Thêm sản phẩm mới</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mdb.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>
    </head>

    <body>
        <c:if test="${not empty sessionScope.user}">
            <div class="admin-greeting">
                <i class="fas fa-user-shield admin-icon"></i>
                Xin chào, <span style="text-transform:uppercase">${sessionScope.user.userName}</span>!
            </div>
        </c:if>
        <div class="dashboard-container">
            <%@ include file="../sidebar.jspf" %>
            <main class="main-content">
                <div class="add-product-container">
                    <h2><i class="fas fa-plus-circle"></i> Thêm sản phẩm mới</h2>
                    <form action="addproduct" method="post">
                        <div class="mb-3">
                            <label for="productName" class="form-label">Tên sản phẩm</label>
                            <input type="text" class="form-control" id="productName" name="productName" required>
                        </div>
                        <div class="mb-3">
                            <label for="typeID" class="form-label">Loại sản phẩm</label>
                            <select class="form-select" id="typeID" name="typeID" required>
                                <option value="">-- Chọn loại sản phẩm --</option>
                                <c:forEach var="type" items="${typeList}">
                                    <option value="${type.typeID}">${type.typeName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="brandID" class="form-label">Thương hiệu</label>
                            <select class="form-select" id="brandID" name="brandID" required>
                                <option value="">-- Chọn thương hiệu --</option>
                                <c:forEach var="brand" items="${brandList}">
                                    <option value="${brand.brandID}">${brand.brandName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="description" class="form-label">Mô tả</label>
                            <textarea class="form-control" id="description" name="description" rows="3"></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="price" class="form-label">Giá sản phẩm (VNĐ)</label>
                            <input type="number" class="form-control" id="price" name="price" min="0" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Kích cỡ</label><br>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input size-checkbox" type="checkbox" id="sizeS" name="size" value="S">
                                <label class="form-check-label" for="sizeS">S</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input size-checkbox" type="checkbox" id="sizeM" name="size" value="M">
                                <label class="form-check-label" for="sizeM">M</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input size-checkbox" type="checkbox" id="sizeL" name="size" value="L">
                                <label class="form-check-label" for="sizeL">L</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input size-checkbox" type="checkbox" id="sizeXL" name="size" value="XL">
                                <label class="form-check-label" for="sizeXL">XL</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input size-checkbox" type="checkbox" id="sizeXXL" name="size" value="XXL">
                                <label class="form-check-label" for="sizeXXL">XXL</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input size-checkbox" type="checkbox" id="sizeOther" value="Khác" onchange="toggleOtherSizeInput(this)">
                                <label class="form-check-label" for="sizeOther">Khác</label>
                            </div>
                            <input type="text" class="form-control mt-2" id="otherSizeInput" name="size" placeholder="Nhập kích cỡ khác..." style="display:none; max-width:250px;">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Màu sắc</label><br>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input color-checkbox" type="checkbox" id="colorRed" name="color" value="Đỏ">
                                <label class="form-check-label" for="colorRed">Đỏ</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input color-checkbox" type="checkbox" id="colorBlue" name="color" value="Xanh dương">
                                <label class="form-check-label" for="colorBlue">Xanh dương</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input color-checkbox" type="checkbox" id="colorBlack" name="color" value="Đen">
                                <label class="form-check-label" for="colorBlack">Đen</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input color-checkbox" type="checkbox" id="colorWhite" name="color" value="Trắng">
                                <label class="form-check-label" for="colorWhite">Trắng</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input color-checkbox" type="checkbox" id="colorYellow" name="color" value="Vàng">
                                <label class="form-check-label" for="colorYellow">Vàng</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input color-checkbox" type="checkbox" id="colorOther" value="Khác" onchange="toggleOtherColorInput(this)">
                                <label class="form-check-label" for="colorOther">Khác</label>
                            </div>
                            <input type="text" class="form-control mt-2" id="otherColorInput" name="color" placeholder="Nhập màu khác..." style="display:none; max-width:250px;">
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Biến thể sản phẩm (Size + Màu + Số lượng)</label>
                            <div id="variantTableContainer"></div>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Thêm sản phẩm</button>
                    </form>
                    <div class="text-center mt-3">
                        <a href="${pageContext.request.contextPath}/admindashboard" class="btn btn-secondary back-link">
                            <i class="fas fa-arrow-left"></i> Quay lại trang quản trị
                        </a>
                    </div>
                </div>
                <c:if test="${not empty requestScope.error}">
                    <div class="alert alert-danger mt-3 text-center">
                        ${requestScope.msg}
                    </div>
                </c:if>
                <c:if test="${not empty requestScope.success}">
                    <div class="alert alert-success mt-3 text-center">
                        ${requestScope.success}
                    </div>
                </c:if>
                <c:if test="${not empty sessionScope.success}">
                    <div class="alert alert-success mt-3 text-center">
                        ${sessionScope.success}
                        <c:remove var="success" scope="session"/>
                    </div>
                </c:if>
            </main>
        </div>

        <!-- MDB JS -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/mdb.min.js"></script>

        <script src="${pageContext.request.contextPath}/js/admin/add_product.js"></script>
    </body>
</html>

<style>
    .add-product-container .form-control,
    .add-product-container textarea,
    .add-product-container input[type="number"] {
        width: 100%;
        max-width: 100%;
        box-sizing: border-box;
    }
</style>