<%-- 
    Document   : brand_management
    Created on : Jun 29, 2025, 9:50:46 AM
    Author     : manht
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css"/>
<div class="dashboard-container">
    <%@ include file="../sidebar.jspf" %>
    <main class="main-content">
        <div class="brand-header">
            <i class="fas fa-tags"></i> BRAND MANAGEMENT
        </div>
        <div class="brand-content">
            <a href="${pageContext.request.contextPath}/addbrand" class="btn-add"><i class="fas fa-plus"></i> Add Brand</a>
            <!-- Bảng danh sách brand -->
            <table class="brand-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tên thương hiệu</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <c:forEach var="brand" items="${brandList}">
                        <tr>
                            <td>${brand.brandID}</td>
                            <td>${brand.brandName}</td>
                            <td>
                                <form action="${pageContext.request.contextPath}/editbrand" method="get" style="display:inline;">
                                    <input type="hidden" name="brandId" value="${brand.brandID}" />
                                    <button type="submit" class="action-btn" title="Sửa">
                                        <i class="fas fa-edit"></i> Sửa
                                    </button>
                                </form>
                                <button class="action-btn" title="Xóa">
                                    <i class="fas fa-trash"></i> Xóa
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <p>Số lượng brand: ${fn:length(brandList)}</p>
        </div>
    </main>
</div>
