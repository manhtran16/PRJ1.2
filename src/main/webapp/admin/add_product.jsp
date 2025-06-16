<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Add Product - Admin Dashboard</title>
	<!-- MDB and Admin styles -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/index.css">
</head>
<body class="admin-container">
	<div class="admin-header">
		<h1 class="text-center mb-0">Add New Product</h1>
	</div>

	<div class="container">
		<c:if test="${not empty error}">
			<div class="alert alert-danger">${error}</div>
		</c:if>

		<form action="AddProduct" method="post" class="product-form">
			<div class="form-group">
				<label for="productName">Product Name</label>
				<input type="text" class="form-control" id="productName" name="productName" 
					   placeholder="Enter product name" required>
			</div>

			<div class="form-group">
				<label for="productQuantity">Quantity</label>
				<input type="number" class="form-control" id="productQuantity" name="productQuantity"
					   placeholder="Enter product quantity" min="1" required>
			</div>

			<div class="form-group">
				<label for="productDescription">Description</label>
				<textarea class="form-control" id="productDescription" name="productDescription"
						  placeholder="Enter product description" required></textarea>
			</div>

			<div class="form-group">
				<label for="productPrice">Price</label>
				<input type="number" class="form-control" id="productPrice" name="productPrice"
					   placeholder="Enter product price" step="0.01" min="0" required>
			</div>

			<div class="form-group">
				<label for="productBrand">Brand</label>
				<select class="form-control" id="productBrand" name="productBrand" required>
					<c:forEach var="brand" items="${brandList}">
						<option value="${brand.brandID}">${brand.brandName}</option>
					</c:forEach>
				</select>
				<a href="BrandManagement" class="btn btn-admin-primary mt-2">Add new brand</a>
			</div>

			<div class="form-group">
				<label>Product Types</label>
				<div id="typeFields">
					<div class="dynamic-field">
						<select class="form-control" name="productType" required>
							<c:forEach var="type" items="${typeList}">
								<option value="${type.typeID}">${type.typeName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<button type="button" class="btn btn-admin-primary mt-2" onclick="addTypeField()">Add More Types</button>
				<a href="TypeManagement" class="btn btn-admin-primary mt-2 ml-2">Add New Type</a>
			</div>

			<div class="form-group">
				<label>Specifications</label>
				<div id="specificationFields">
					<div class="dynamic-field">
						<select class="form-control mb-2" name="productSpecification" required>
							<c:forEach var="spec" items="${specificationList}">
								<option value="${spec.specID}">${spec.specName}</option>
							</c:forEach>
						</select>
						<input type="text" class="form-control mb-2" name="specProduct" placeholder="Specification Product">
						<input type="number" class="form-control" name="specValue" placeholder="Specification Value" step="0.01">
					</div>
				</div>
				<button type="button" class="btn btn-admin-primary mt-2" onclick="addSpecField()">Add More Specifications</button>
				<a href="SpecificationManagement" class="btn btn-admin-primary mt-2 ml-2">Add New Specification</a>
			</div>

			<div class="form-group">
				<label>Product Images</label>
				<div id="imageFields">
					<div class="dynamic-field">
						<input type="text" class="form-control" name="productImage" placeholder="Image URL" required>
					</div>
				</div>
				<button type="button" class="btn btn-admin-primary mt-2" onclick="addImageField()">Add More Images</button>
			</div>

			<button type="submit" class="btn btn-admin-primary btn-block mt-4">Add Product</button>
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
	</script>
</body>
</html>
