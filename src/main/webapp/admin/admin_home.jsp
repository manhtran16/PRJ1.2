<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8" />
<title>Admin Home</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mdb.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"/>
<style>
    body {
        font-family: 'Roboto', Arial, sans-serif;
        background: linear-gradient(120deg, #f6d365 0%, #a770ef 100%);
        margin: 0;
        padding: 0;
        min-height: 100vh;
    }
    .admin-header {
        background: linear-gradient(90deg, #a770ef 0%, #f6d365 100%);
        color: #fff;
        text-align: center;
        padding: 32px 0 18px 0;
        margin: 0;
        font-size: 2.2rem;
        font-weight: 700;
        letter-spacing: 2px;
        border-radius: 0 0 24px 24px;
        box-shadow: 0 4px 24px rgba(167,112,239,0.10);
        position: relative;
    }
    .admin-header .fa-user-shield {
        margin-right: 12px;
        font-size: 2.2rem;
        vertical-align: middle;
    }
    .admin-content {
        display: flex;
        flex-direction: column;
        align-items: stretch;
        margin: 48px auto 0 auto;
        gap: 22px;
        max-width: 420px;
        background: #fff;
        border-radius: 18px;
        box-shadow: 0 6px 32px rgba(167,112,239,0.13);
        padding: 36px 32px 32px 32px;
    }
    .admin-content a {
        display: flex;
        align-items: center;
        text-decoration: none;
        font-size: 1.15rem;
        color: #fff;
        background: linear-gradient(90deg, #a770ef 0%, #f6d365 100%);
        padding: 14px 28px;
        border-radius: 8px;
        font-weight: 500;
        box-shadow: 0 2px 8px rgba(167,112,239,0.08);
        transition: background 0.3s, transform 0.2s;
        margin-bottom: 0;
    }
    .admin-content a i {
        margin-right: 14px;
        font-size: 1.2rem;
    }
    .admin-content a:hover {
        background: linear-gradient(90deg, #f6d365 0%, #a770ef 100%);
        transform: translateY(-2px) scale(1.03);
        box-shadow: 0 4px 16px rgba(167,112,239,0.18);
    }
    @media (max-width: 600px) {
        .admin-header {
            font-size: 1.3rem;
            padding: 18px 0 10px 0;
        }
        .admin-content {
            max-width: 98vw;
            padding: 18px 8px 18px 8px;
        }
        .admin-content a {
            font-size: 1rem;
            padding: 10px 10px;
        }
    }
</style>
</head>
<body>
    <div class="admin-header">
        <i class="fas fa-user-shield"></i> ADMIN DASHBOARD
    </div>
    <div class="admin-content">
        <a href="../index.jsp"><i class="fas fa-home"></i> User Home</a>
        <a href="${pageContext.request.contextPath}/productmanagement"><i class="fas fa-box"></i> Product Management</a>
        <a href="${pageContext.request.contextPath}/brandmanagement"><i class="fas fa-tags"></i> Brand Management</a>
        <a href="${pageContext.request.contextPath}/typemanagement"><i class="fas fa-list"></i> Type Management</a>
        <a href="#"><i class="fas fa-chart-bar"></i> Statistics</a>
    </div>
</body>
</html>
