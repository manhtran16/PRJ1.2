<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Thêm sản phẩm mới</title>
        <link rel="stylesheet" href="css/mdb.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>
        <style>
            body {
                background: #f8f9fa;
                font-family: 'Roboto', sans-serif;
            }
            .add-product-container {
                max-width: 600px;
                margin: 40px auto;
                background: #fff;
                border-radius: 12px;
                box-shadow: 0 4px 16px rgba(0,0,0,0.08);
                padding: 32px 28px;
            }
            .add-product-container h2 {
                color: #6c2eb7;
                font-weight: 700;
                margin-bottom: 28px;
                text-align: center;
            }
            .form-label {
                font-weight: 500;
            }
            .btn-primary {
                background: linear-gradient(90deg, #a770ef 0%, #f6d365 100%);
                border: none;
                font-weight: 600;
            }
            .btn-primary:hover {
                background: linear-gradient(90deg, #f6d365 0%, #a770ef 100%);
            }
            .form-check-inline {
                margin-right: 15px;
            }
        </style>
    </head>
    <body>
        <div class="add-product-container">
            <h2><i class="fas fa-plus-circle"></i> Thêm sản phẩm mới</h2>
            <form action="addproduct" method="post">
                <div class="mb-3">
                    <label for="productName" class="form-label">Tên sản phẩm</label>
                    <input type="text" class="form-control" id="productName" name="productName" required>
                </div>
                <div class="mb-3">
                    <label for="typeID" class="form-label">Loại sản phẩm</label>
                    <select class="form-select" id="typeID" name="typeName" required>
                        <option value="">-- Chọn loại sản phẩm --</option>
                        <c:forEach var="type" items="${typeList}">
                            <option value="${type.typeID}">${type.typeName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="brandID" class="form-label">Thương hiệu</label>
                    <select class="form-select" id="brandID" name="brandName" required>
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
        </div>

        <c:if test="${not empty requestScope.error}">
            <div class="alert alert-danger mt-3 text-center">
                ${requestScope.error}
            </div>
        </c:if>

        <!-- MDB JS -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/mdb.min.js"></script>

        <!-- Custom JS for dynamic fields -->
        <script>
                            function addDynamicField(containerId, template) {
                                const container = document.getElementById(containerId);
                                const newField = document.createElement('div');
                                newField.className = 'dynamic-field mt-3';
                                newField.innerHTML = template + '<button type="button" class="btn-close remove-field" onclick="this.parentElement.remove()"></button>';
                                container.appendChild(newField);
                            }

                            function addTypeField() {
                                const template = document.querySelector('#typeFields .dynamic-field').innerHTML;
                                addDynamicField('typeFields', template);
                            }

                            function addSpecField() {
                                const template = document.querySelector('#specificationFields .dynamic-field').innerHTML;
                                addDynamicField('specificationFields', template);
                            }

                            function addImageField() {
                                const template = document.querySelector('#imageFields .dynamic-field').innerHTML;
                                addDynamicField('imageFields', template);
                            }

                            function toggleOtherSizeInput(checkbox) {
                                var input = document.getElementById('otherSizeInput');
                                if (checkbox.checked) {
                                    input.style.display = 'inline-block';
                                    input.required = true;
                                } else {
                                    input.style.display = 'none';
                                    input.value = '';
                                    input.required = false;
                                }
                                updateVariantTable();
                            }
                            function toggleOtherColorInput(checkbox) {
                                var input = document.getElementById('otherColorInput');
                                if (checkbox.checked) {
                                    input.style.display = 'inline-block';
                                    input.required = true;
                                } else {
                                    input.style.display = 'none';
                                    input.value = '';
                                    input.required = false;
                                }
                                updateVariantTable();
                            }

// Lấy danh sách size và color đã chọn
                            function getSelectedSizes() {
                                let sizes = [];
                                document.querySelectorAll('.size-checkbox').forEach(cb => {
                                    if (cb.checked && cb.id !== 'sizeOther')
                                        sizes.push(cb.value);
                                });
                                const otherSizeCb = document.getElementById('sizeOther');
                                const otherSizeInput = document.getElementById('otherSizeInput');
                                if (otherSizeCb && otherSizeCb.checked && otherSizeInput.value.trim() !== '') {
                                    sizes.push(otherSizeInput.value.trim());
                                }
                                return sizes;
                            }
                            function getSelectedColors() {
                                let colors = [];
                                document.querySelectorAll('.color-checkbox').forEach(cb => {
                                    if (cb.checked && cb.id !== 'colorOther')
                                        colors.push(cb.value);
                                });
                                const otherColorCb = document.getElementById('colorOther');
                                const otherColorInput = document.getElementById('otherColorInput');
                                if (otherColorCb && otherColorCb.checked && otherColorInput.value.trim() !== '') {
                                    colors.push(otherColorInput.value.trim());
                                }
                                return colors;
                            }

// Tạo bảng biến thể
                            function updateVariantTable() {
                                const sizes = getSelectedSizes();
                                const colors = getSelectedColors();
                                const container = document.getElementById('variantTableContainer');
                                container.innerHTML = '';
                                if (sizes.length === 0 || colors.length === 0)
                                    return;

                                let html = '<table class="table table-bordered"><thead><tr><th>Size</th><th>Màu</th><th>Số lượng</th><th>Image URL</th></tr></thead><tbody>';
                                sizes.forEach(size => {
                                    colors.forEach(color => {
                                        html += `<tr>
                <td><input type="hidden" name="variantSize[]" value="` + size + `">` + size + `</td>
                <td><input type="hidden" name="variantColor[]" value="` + color + `">` + color + `</td>
                <td><input type="number" name="variantQuantity[]" class="form-control" min="0" required></td>
                <td><input type="text" name="variantImage[]" class="form-control" placeholder="Nhập URL ảnh"></td>
            </tr>`;
                                    });
                                });
                                html += '</tbody></table>';
                                container.innerHTML = html;
                            }


// Lắng nghe sự kiện thay đổi checkbox và input
                            function attachVariantEvents() {
                                document.querySelectorAll('.size-checkbox, .color-checkbox').forEach(cb => {
                                    cb.addEventListener('change', updateVariantTable);
                                });
                                document.getElementById('otherSizeInput').addEventListener('input', updateVariantTable);
                                document.getElementById('otherColorInput').addEventListener('input', updateVariantTable);
                            }

                            // Gọi khi trang vừa load
                            window.onload = function () {
                                attachVariantEvents();
                                updateVariantTable();
                            };
        </script>
    </body>

</html></html>
