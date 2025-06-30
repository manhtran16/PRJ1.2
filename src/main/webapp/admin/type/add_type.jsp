<%-- 
    Document   : add_brand
    Created on : Jun 30, 2025, 9:23:25 AM
    Author     : manht
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Thêm Type mới</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mdb.min.css"/>
        <style>
            body {
                background: #f8f9fa;
                font-family: 'Roboto', sans-serif;
            }
            .add-brand-container {
                max-width: 400px;
                margin: 60px auto;
                background: #fff;
                border-radius: 12px;
                box-shadow: 0 4px 16px rgba(0,0,0,0.08);
                padding: 32px 28px;
            }
            .add-brand-container h2 {
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
            .admin-greeting {
                background: linear-gradient(90deg, #a770ef 0%, #f6d365 100%);
                color: #fff;
                font-size: 1.3rem;
                font-weight: 600;
                padding: 18px 0;
                text-align: center;
                border-radius: 0 0 16px 16px;
                box-shadow: 0 4px 16px rgba(167,112,239,0.08);
                letter-spacing: 1px;
                margin-bottom: 32px;
                position: relative;
            }
            .admin-greeting .admin-icon {
                margin-right: 10px;
                font-size: 1.5rem;
                vertical-align: middle;
            }
            @media (max-width: 600px) {
                .admin-greeting {
                    font-size: 1rem;
                    padding: 12px 0;
                }
                .admin-greeting .admin-icon {
                    font-size: 1.2rem;
                }
            }
            .alert-custom {
                padding: 16px 24px;
                border-radius: 8px;
                font-size: 1.1rem;
                font-weight: 500;
                margin: 18px auto 0 auto;
                max-width: 400px;
                text-align: center;
                box-shadow: 0 2px 12px rgba(0,0,0,0.07);
                letter-spacing: 0.5px;
                transition: all 0.3s;
            }
            .alert-success-custom {
                background: linear-gradient(90deg, #a8ff78 0%, #78ffd6 100%);
                color: #1b5e20;
                border: 1.5px solid #b2ff59;
            }
            .alert-error-custom {
                background: linear-gradient(90deg, #ff758c 0%, #ff7eb3 100%);
                color: #b71c1c;
                border: 1.5px solid #ff8a80;
            }
        </style>
    </head>
    <body>
        <c:if test="${not empty sessionScope.user}">
            <div class="admin-greeting">
                <i class="fas fa-user-shield admin-icon"></i>
                Xin chào, <span style="text-transform:uppercase">${sessionScope.user.userName}</span>!
            </div>
        </c:if>
        <div class="add-brand-container">
            <h2>Thêm Type mới</h2>
            <form action="addtype" method="post">
                <div class="mb-3">
                    <label for="typeName" class="form-label">Type</label>
                    <input type="text" class="form-control" id="typeName" name="typeName" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">Thêm loại quần áo</button>
            </form>
            <c:if test="${not empty error}">
                <div class="alert-custom alert-error-custom">
                    ${error}
                </div>
            </c:if>
            <c:if test="${not empty success}">
                <div class="alert-custom alert-success-custom">
                    ${success}
                </div>
            </c:if>
        </div>
        <script src="${pageContext.request.contextPath}/js/mdb.min.js"></script>
    </body>
</html>
