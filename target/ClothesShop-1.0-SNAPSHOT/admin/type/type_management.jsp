<%-- 
    Document   : brand_management
    Created on : Jun 29, 2025, 9:50:46 AM
    Author     : manht
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Type Management</title>
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
            .brand-header {
                background: linear-gradient(90deg, #a770ef 0%, #f6d365 100%);
                color: #fff;
                text-align: center;
                padding: 32px 0 18px 0;
                margin: 0;
                font-size: 2.1rem;
                font-weight: 700;
                letter-spacing: 2px;
                border-radius: 0 0 24px 24px;
                box-shadow: 0 4px 24px rgba(167,112,239,0.10);
                position: relative;
            }
            .brand-header .fa-tags {
                margin-right: 12px;
                font-size: 2.1rem;
                vertical-align: middle;
            }
            .brand-content {
                display: flex;
                flex-direction: column;
                align-items: stretch;
                margin: 48px auto 0 auto;
                gap: 22px;
                max-width: 600px;
                background: #fff;
                border-radius: 18px;
                box-shadow: 0 6px 32px rgba(167,112,239,0.13);
                padding: 36px 32px 32px 32px;
            }
            .brand-content a {
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
            .brand-content a i {
                margin-right: 14px;
                font-size: 1.2rem;
            }
            .brand-content a:hover {
                background: linear-gradient(90deg, #f6d365 0%, #a770ef 100%);
                transform: translateY(-2px) scale(1.03);
                box-shadow: 0 4px 16px rgba(167,112,239,0.18);
            }
            .brand-table {
                margin-top: 32px;
                width: 100%;
                border-radius: 12px;
                overflow: hidden;
                box-shadow: 0 2px 12px rgba(167,112,239,0.08);
                background: #fafaff;
            }
            .brand-table th, .brand-table td {
                padding: 12px 16px;
                text-align: left;
            }
            .brand-table th {
                background: #a770ef;
                color: #fff;
                font-weight: 600;
            }
            .brand-table tr:nth-child(even) {
                background: #f3eaff;
            }
            .brand-table tr:hover {
                background: #f6d36533;
            }
            .action-btn {
                border: none;
                background: none;
                color: #a770ef;
                font-size: 1.1rem;
                cursor: pointer;
                margin-right: 8px;
                transition: color 0.2s;
            }
            .action-btn:hover {
                color: #f6d365;
            }
            @media (max-width: 600px) {
                .brand-header {
                    font-size: 1.3rem;
                    padding: 18px 0 10px 0;
                }
                .brand-content {
                    max-width: 98vw;
                    padding: 18px 8px 18px 8px;
                }
                .brand-content a {
                    font-size: 1rem;
                    padding: 10px 10px;
                }
                .brand-table th, .brand-table td {
                    padding: 8px 6px;
                }
            }
        </style>
    </head>
    <body>
        <div class="brand-header">
            <i class="fas fa-tags"></i> TYPE MANAGEMENT
        </div>
        <div class="brand-content">
            <a href="${pageContext.request.contextPath}/addtype"><i class="fas fa-plus"></i> Add Type</a>
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
                                <button class="action-btn" title="Sửa"><i class="fas fa-edit"></i></button>
                                <button class="action-btn" title="Xóa"><i class="fas fa-trash"></i></button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <p>Số lượng type: ${fn:length(typeList)}</p>
        </div>
    </body>
</html>
