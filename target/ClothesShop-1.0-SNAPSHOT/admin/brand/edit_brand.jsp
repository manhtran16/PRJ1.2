<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Sửa thương hiệu</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mdb.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>
    <style>
        body {
            background: linear-gradient(120deg, #f6d365 0%, #a770ef 100%);
            font-family: 'Roboto', Arial, sans-serif;
            margin: 0;
            padding: 0;
            min-height: 100vh;
        }
        .edit-brand-container {
            max-width: 400px;
            margin: 60px auto;
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 6px 24px rgba(167,112,239,0.10);
            padding: 36px 32px;
        }
        .edit-brand-container h2 {
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
            font-size: 1.05rem;
            margin-bottom: 18px;
            padding: 10px 14px;
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
            max-width: 400px;
            margin: 18px auto 0 auto;
            border-radius: 8px;
            font-size: 1.1rem;
            font-weight: 500;
            letter-spacing: 0.5px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.07);
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
    <c:if test="${not empty sessionScope.user}">
        <div class="admin-greeting">
            <i class="fas fa-user-shield admin-icon"></i>
            Xin chào, <span style="text-transform:uppercase">${sessionScope.user.userName}</span>!
        </div>
    </c:if>
    <div class="edit-brand-container">
        <h2><i class="fas fa-edit"></i> Sửa thương hiệu</h2>
        <form action="${pageContext.request.contextPath}/editbrand" method="post">
            <input type="hidden" name="brandId" value="${brand.brandID}" />
            <div class="mb-3">
                <label for="brandName" class="form-label">Tên thương hiệu</label>
                <input type="text" class="form-control" id="brandName" name="brandName" value="${brand.brandName}" required>
            </div>
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
    </div>
    <script src="${pageContext.request.contextPath}/js/mdb.min.js"></script>
</body>
</html> 