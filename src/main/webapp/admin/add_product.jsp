<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
                <label for="typeID" class="form-label">Loại sản phẩm (typeID)</label>
                <input type="text" class="form-control" id="typeID" name="typeID" required>
            </div>
            <div class="mb-3">
                <label for="brandID" class="form-label">Thương hiệu (brandID)</label>
                <input type="text" class="form-control" id="brandID" name="brandID" required>
            </div>
            <div class="mb-3">
                <label for="description" class="form-label">Mô tả</label>
                <textarea class="form-control" id="description" name="description" rows="3"></textarea>
            </div>
            <div class="mb-3">
                <label class="form-label">Kích cỡ</label><br>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="sizeS" name="size" value="S">
                    <label class="form-check-label" for="sizeS">S</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="sizeM" name="size" value="M">
                    <label class="form-check-label" for="sizeM">M</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="sizeL" name="size" value="L">
                    <label class="form-check-label" for="sizeL">L</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="sizeXL" name="size" value="XL">
                    <label class="form-check-label" for="sizeXL">XL</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="sizeXXL" name="size" value="XXL">
                    <label class="form-check-label" for="sizeXXL">XXL</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="sizeOther" name="size" value="" onchange="toggleOtherSizeInput(this)">
                    <label class="form-check-label" for="sizeOther">Khác</label>
                </div>
                <input type="text" class="form-control mt-2" id="otherSizeInput" name="sizeOther" placeholder="Nhập kích cỡ khác..." style="display:none; max-width:250px;">
            </div>
            <div class="mb-3">
                <label class="form-label">Màu sắc</label><br>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="colorRed" name="color" value="Đỏ">
                    <label class="form-check-label" for="colorRed">Đỏ</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="colorBlue" name="color" value="Xanh dương">
                    <label class="form-check-label" for="colorBlue">Xanh dương</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="colorBlack" name="color" value="Đen">
                    <label class="form-check-label" for="colorBlack">Đen</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="colorWhite" name="color" value="Trắng">
                    <label class="form-check-label" for="colorWhite">Trắng</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="colorYellow" name="color" value="Vàng">
                    <label class="form-check-label" for="colorYellow">Vàng</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="colorOther" name="color" value="" onchange="toggleOtherColorInput(this)">
                    <label class="form-check-label" for="colorOther">Khác</label>
                </div>
                <input type="text" class="form-control mt-2" id="otherColorInput" name="colorOther" placeholder="Nhập màu khác..." style="display:none; max-width:250px;">
            </div>
            <button type="submit" class="btn btn-primary w-100">Thêm sản phẩm</button>
        </form>
    </div>

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
}
	</script>
</body>
</html>
