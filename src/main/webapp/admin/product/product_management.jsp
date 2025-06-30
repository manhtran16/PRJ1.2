<%@page import="model.Product"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8" />
        <title>Product Management</title>
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
            .product-header {
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
            .product-header .fa-boxes-stacked {
                margin-right: 12px;
                font-size: 2.1rem;
                vertical-align: middle;
            }
            .product-content {
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
            .product-content a {
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
            .product-content a i {
                margin-right: 14px;
                font-size: 1.2rem;
            }
            .product-content a:hover {
                background: linear-gradient(90deg, #f6d365 0%, #a770ef 100%);
                transform: translateY(-2px) scale(1.03);
                box-shadow: 0 4px 16px rgba(167,112,239,0.18);
            }
            @media (max-width: 600px) {
                .product-header {
                    font-size: 1.3rem;
                    padding: 18px 0 10px 0;
                }
                .product-content {
                    max-width: 98vw;
                    padding: 18px 8px 18px 8px;
                }
                .product-content a {
                    font-size: 1rem;
                    padding: 10px 10px;
                }
            }
        </style>
    </head>
    <body>
        <div class="product-header">
            <i class="fas fa-boxes-stacked"></i> PRODUCT MANAGEMENT
        </div>
        <div class="product-content">
            <a href="${pageContext.request.contextPath}/addproduct"><i class="fas fa-plus"></i> Add Product</a>
            <a href="update_product.jsp"><i class="fas fa-edit"></i> Update Product</a>
        </div>
    </body>
</html>
