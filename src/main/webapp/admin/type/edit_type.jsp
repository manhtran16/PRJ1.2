<%-- 
    Document   : edit_type
    Created on : Jun 30, 2025, 11:44:13 PM
    Author     : manht
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa loại sản phẩm</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mdb.min.css"/>
    <style>
        body {
            background: #f8f9fa;
            font-family: 'Roboto', Arial, sans-serif;
        }
        .edit-type-container {
            max-width: 400px;
            margin: 60px auto;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 16px rgba(0,0,0,0.08);
            padding: 32px 28px;
        }
        .edit-type-container h2 {
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
    </style>
</head>
<body>
    <div class="edit-type-container">
        <h2>Chỉnh sửa loại sản phẩm</h2>
        <form action="${pageContext.request.contextPath}/editType" method="post">
            <input type="hidden" name="typeID" value="${type.typeID}" />
            <div class="mb-3">
                <label for="typeName" class="form-label">Tên loại sản phẩm</label>
                <input type="text" class="form-control" id="typeName" name="typeName" value="${type.typeName}" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Cập nhật</button>
        </form>
        <div style="text-align:center; margin-top:1.5rem;">
            <a href="${pageContext.request.contextPath}/typemanagement" style="color:#6c2eb7;text-decoration:underline;">Quay lại danh sách loại</a>
        </div>
    </div>
</body>
</html>
