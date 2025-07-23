<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css"/>
<div class="dashboard-container">
    <%@ include file="../sidebar.jspf" %>
    <main class="main-content">
        <div class="edit-brand-container">
            <h2><i class="fas fa-edit"></i> Chỉnh sửa loại sản phẩm</h2>
            <form action="${pageContext.request.contextPath}/edittype" method="post">
                <input type="hidden" name="typeID" value="${type.typeID}" />
                <div class="mb-3">
                    <label for="typeName" class="form-label">Tên loại sản phẩm</label>
                    <input type="text" class="form-control" id="typeName" name="typeName" value="${type.typeName}" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">Cập nhật</button>
            </form>
            <div class="text-center mt-3">
                <a href="${pageContext.request.contextPath}/typemanagement" class="back-link" style="color:white">
                    <i class="fas fa-list"></i> Quay lại danh sách loại
                </a>
            </div>
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
    </main>
</div>
<script src="${pageContext.request.contextPath}/js/mdb.min.js"></script>
