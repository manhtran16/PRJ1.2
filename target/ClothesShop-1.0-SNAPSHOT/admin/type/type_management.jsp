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
            <i class="fas fa-tags"></i> TYPE MANAGEMENT
        </div>
        <div class="brand-content">
            <a href="${pageContext.request.contextPath}/addtype" class="btn-add"><i class="fas fa-plus"></i> Add Type</a>
            <table class="brand-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Type</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="type" items="${typeList}">
                        <tr>
                            <td>${type.typeID}</td>
                            <td>${type.typeName}</td>
                            <td>
                                <form action="${pageContext.request.contextPath}/edittype" method="get" style="display:inline;">
                                    <input type="hidden" name="typeID" value="${type.typeID}" />
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
            <p>Số lượng type: ${fn:length(typeList)}</p>
        </div>
    </main>
</div>
