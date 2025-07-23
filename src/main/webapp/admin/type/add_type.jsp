<%-- 
    Document   : add_brand
    Created on : Jun 30, 2025, 9:23:25 AM
    Author     : manht
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css"/>
<div class="dashboard-container">
    <%@ include file="../sidebar.jspf" %>
    <main class="main-content">
        <div class="add-brand-container">
            <h2>Thêm Type mới</h2>
            <form action="addtype" method="post">
                <div class="mb-3">
                    <label for="typeName" class="form-label">Type</label>
                    <input type="text" class="form-control" id="typeName" name="typeName" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">Thêm loại quần áo</button>
            </form>
            <div class="text-center mt-3">
                <a href="${pageContext.request.contextPath}/admindashboard" class="btn btn-secondary back-link">
                    <i class="fas fa-arrow-left"></i> Quay lại trang quản trị
                </a>
            </div>
            <c:if test="${not empty error}">
                <div class="alert-custom alert-error-custom mt-3">
                    ${error}
                </div>
            </c:if>
            <c:if test="${not empty success}">
                <div class="alert-custom alert-success-custom mt-3">
                    ${success}
                </div>
            </c:if>
        </div>
    </main>
</div>
        <script src="${pageContext.request.contextPath}/js/mdb.min.js"></script>
    </body>
</html>
