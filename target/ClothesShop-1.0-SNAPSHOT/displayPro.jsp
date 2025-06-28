<%-- 
    Document   : displayPro
    Created on : Jun 3, 2025, 11:34:00 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>CLoth store</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
    />
    <!-- Google Fonts Roboto -->
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap"
    />
    <!-- MDB -->
    <link rel="stylesheet" href="css/mdb.min.css" />
    <style>
        /* Variant Cards Styling */
        .variant-container {
            margin: 20px 0;
        }
        
        .color-group {
            border: 2px solid #e9ecef;
            border-radius: 10px;
            padding: 20px;
            margin: 15px 0;
            background: #f8f9fa;
        }
        
        .color-group h4 {
            margin: 0 0 15px 0;
            color: #495057;
            font-weight: 600;
            border-bottom: 2px solid #dee2e6;
            padding-bottom: 8px;
        }
        
        .size-variants {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }
        
        .size-variant-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 12px;
            background: white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            flex: 1;
            min-width: 150px;
            max-width: 200px;
        }
        
        .size-variant-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.15);
            border-color: #007bff;
        }
        
        .variant-actions a {
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            padding: 6px 12px;
            border-radius: 4px;
            margin: 2px;
            font-weight: 500;
            font-size: 12px;
        }
        
        .variant-actions a:hover {
            transform: scale(1.05);
            text-decoration: none;
        }
        
        .btn-detail {
            background-color: #007bff;
            color: white;
        }
        
        .btn-detail:hover {
            background-color: #0056b3;
            color: white;
        }
        
        .btn-cart {
            background-color: #28a745;
            color: white;
        }
        
        .btn-cart:hover {
            background-color: #218838;
            color: white;
        }
        
        .variant-price {
            color: #28a745;
            font-weight: bold;
            font-size: 14px;
        }
        
        .variant-stock {
            font-weight: 500;
            font-size: 12px;
        }
        
        .stock-available {
            color: #28a745;
        }
        
        .stock-out {
            color: #dc3545;
        }
        
        .size-title {
            font-weight: bold;
            color: #343a40;
            margin-bottom: 5px;
        }
        
        .back-btn {
            background-color: #6c757d;
            color: white;
            padding: 8px 16px;
            text-decoration: none;
            border-radius: 5px;
            display: inline-block;
            margin-bottom: 20px;
        }
        
        .back-btn:hover {
            background-color: #5a6268;
            color: white;
            text-decoration: none;
        }
        
        @media (max-width: 768px) {
            .size-variants {
                flex-direction: column;
            }
            
            .size-variant-card {
                max-width: 100%;
            }
        }
    </style>
  </head>
  <body>
    <header>
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg bg-body">
    <div class="container-fluid">
      <button
        data-mdb-collapse-init
        class="navbar-toggler"
        type="button"
        data-mdb-target="#navbarExample01"
        aria-controls="navbarExample01"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarExample01">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item active">
            <a class="nav-link" aria-current="page" href="#">Trang chủ</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Trang phục nam</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Trang phục nữ</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Trang phục trẻ em</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Phụ kiện</a>
          </li>
        </ul>
        <ul class="navbar-nav d-flex flex-row">
      <!-- Icons -->
      <li class="nav-item me-3 me-lg-0">
        <a class="nav-link" href="#">
          <span class="badge badge-pill bg-danger">1</span>
          <span><i class="fas fa-shopping-cart"></i></span>
        </a>
      </li>
      <li class="nav-item me-3 me-lg-0">
        <a class="nav-link" href="#">
          <i class="fab fa-twitter"></i>
        </a>
      </li>
      <!-- Icon dropdown -->
      <li class="nav-item me-3 me-lg-0 dropdown">
        <a
          data-mdb-dropdown-init
          class="nav-link dropdown-toggle"
          href="#"
          id="navbarDropdown"
          role="button"
          aria-expanded="false"
        >
          <i class="fas fa-user"></i>
        </a>
        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
          <li>
            <a class="dropdown-item" href="#">Action</a>
          </li>
          <li>
            <a class="dropdown-item" href="#">Another action</a>
          </li>
          <li><hr class="dropdown-divider" /></li>
          <li>
            <a class="dropdown-item" href="#">Something else here</a>
          </li>
        </ul>
      </li>
    </ul>
      </div>
    </div>
  </nav>
  <!-- Navbar -->

  
</header>
<main>
<!--Main layout-->
<main class="mt-5 pt-4">
    <div class="container mt-5">

        <!--Grid row-->
        <div class="row">
            <!--Grid column-->
            <div class="col-md-6 mb-4">
                <c:choose>
                    <c:when test="${not empty product.variants and not empty product.variants[0].images}">
                        <img src="${product.variants[0].images[0].url}" class="img-fluid" alt="${product.productName}" />
                    </c:when>
                    <c:otherwise>
                        <img src="https://via.placeholder.com/500x400?text=Product+Image" class="img-fluid" alt="${product.productName}" />
                    </c:otherwise>
                </c:choose>
            </div>
            <!--Grid column-->

            <!--Grid column-->
            <div class="col-md-6 mb-4">
                <!--Content-->
                <div class="p-4">
                    <!-- Back button -->
                    <a href="products" class="back-btn">
                        ← Quay lại danh sách sản phẩm
                    </a>
                    
                    <div class="mb-3">
                        <c:choose>
                            <c:when test="${not empty product}">
                                <h2>${product.productName}</h2>
                                <c:if test="${not empty product.brand}">
                                    <p class="text-muted">Brand: ${product.brand.brandName}</p>
                                </c:if>
                                <c:if test="${not empty product.type}">
                                    <p class="text-muted">Category: ${product.type.typeName}</p>
                                </c:if>
                            </c:when>
                            <c:otherwise>
                                <h2>Product Not Found</h2>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <c:if test="${not empty product.variants}">
                        <p class="lead">
                            <c:choose>
                                <c:when test="${product.variants.size() > 1}">
                                    <span>Từ ${product.variants[0].price} VNĐ</span>
                                </c:when>
                                <c:otherwise>
                                    <span>${product.variants[0].price} VNĐ</span>
                                </c:otherwise>
                            </c:choose>
                        </p>
                    </c:if>

                    <strong><p style="font-size: 20px;">Description</p></strong>

                    <p>
                        <c:choose>
                            <c:when test="${not empty product.description}">
                                ${product.description}
                            </c:when>
                            <c:otherwise>
                                No description available for this product.
                            </c:otherwise>
                        </c:choose>
                    </p>
                    
        <!-- Hiển thị tất cả variants của sản phẩm grouped by color -->
        <c:if test="${not empty product.variants}">
            <div class="variant-container">
                <strong style="font-size: 18px;">🎯 Các phiên bản có sẵn:</strong>
                
                <!-- Group variants by color -->
                <div style="margin-top: 15px;">
                    <%-- Create a map to group variants by color --%>
                    <c:set var="colorGroups" value="${{}}" />
                    
                    <%-- First pass: identify all unique colors --%>
                    <c:set var="colors" value="" />
                    <c:forEach var="variant" items="${product.variants}">
                        <c:set var="variantColor" value="Mặc định" />
                        <c:forEach var="attrValue" items="${variant.attributeValues}">
                            <%-- Check for color attribute (case insensitive, multiple possible names) --%>
                            <c:set var="attrNameLower" value="${fn:toLowerCase(attrValue.attribute.attributeName)}" />
                            <c:if test="${attrNameLower == 'color' || attrNameLower == 'màu sắc' || attrNameLower == 'mau sac' || fn:contains(attrNameLower, 'color') || fn:contains(attrNameLower, 'màu')}">
                                <c:set var="variantColor" value="${attrValue.value}" />
                            </c:if>
                        </c:forEach>
                        <c:if test="${!fn:contains(colors, variantColor)}">
                            <c:set var="colors" value="${colors}|${variantColor}" />
                        </c:if>
                    </c:forEach>
                    
                    <%-- Split colors and create groups --%>
                    <c:forTokens var="color" items="${colors}" delims="|">
                        <c:if test="${not empty color}">
                            <div class="color-group">
                                <h4>🎨 ${color}</h4>
                                
                                <div class="size-variants">
                                    <%-- Find all variants with this color --%>
                                    <c:forEach var="variant" items="${product.variants}">
                                        <c:set var="variantColor" value="Mặc định" />
                                        <c:set var="variantSize" value="" />
                                        
                                        <%-- Get color and size from attributes --%>
                                        <c:forEach var="attrValue" items="${variant.attributeValues}">
                                            <%-- Check for color attribute (flexible matching) --%>
                                            <c:set var="attrNameLower" value="${fn:toLowerCase(attrValue.attribute.attributeName)}" />
                                            <c:if test="${attrNameLower == 'color' || attrNameLower == 'màu sắc' || attrNameLower == 'mau sac' || fn:contains(attrNameLower, 'color') || fn:contains(attrNameLower, 'màu')}">
                                                <c:set var="variantColor" value="${attrValue.value}" />
                                            </c:if>
                                            <%-- Check for size attribute (flexible matching) --%>
                                            <c:if test="${attrNameLower == 'size' || attrNameLower == 'kích thước' || attrNameLower == 'kich thuoc' || fn:contains(attrNameLower, 'size') || fn:contains(attrNameLower, 'kích')}">
                                                <c:set var="variantSize" value="${attrValue.value}" />
                                            </c:if>
                                        </c:forEach>
                                        
                                        <%-- If this variant matches current color, display it --%>
                                        <c:if test="${variantColor == color}">
                                            <div class="size-variant-card">
                                                <div class="size-title">
                                                    📏 Size: <c:choose>
                                                        <c:when test="${not empty variantSize}">${variantSize}</c:when>
                                                        <c:otherwise>Standard</c:otherwise>
                                                    </c:choose>
                                                </div>
                                                
                                                <p class="variant-price" style="margin: 5px 0;">
                                                    💰 ${variant.price} VNĐ
                                                </p>
                                                
                                                <c:choose>
                                                    <c:when test="${variant.quantity > 0}">
                                                        <p class="variant-stock stock-available" style="margin: 5px 0;">
                                                            ✅ Còn: ${variant.quantity}
                                                        </p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <p class="variant-stock stock-out" style="margin: 5px 0;">
                                                            ❌ Hết hàng
                                                        </p>
                                                    </c:otherwise>
                                                </c:choose>
                                                
                                                <div class="variant-actions" style="text-align: center; margin-top: 10px;">
                                                    <c:choose>
                                                        <c:when test="${variant.quantity > 0}">
                                                            <a href="products?action=variant&variantId=${variant.variantID}" 
                                                               class="btn-detail">
                                                                📋 Chi tiết
                                                            </a>
                                                            <br/>
                                                            <a href="addToCart?variantId=${variant.variantID}&quantity=1" 
                                                               class="btn-cart"
                                                               onclick="return confirm('Thêm sản phẩm này vào giỏ hàng?');">
                                                                🛒 Thêm giỏ
                                                            </a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <button style="background-color: #6c757d; color: white; padding: 6px 12px; border: none; border-radius: 4px; cursor: not-allowed; font-size: 12px;" disabled>
                                                                ❌ Hết hàng
                                                            </button>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:if>
                    </c:forTokens>
                </div>
            </div>
        </c:if>
        
        <!-- Fallback if no variants -->
        <c:if test="${empty product.variants}">
            <div class="alert alert-warning">
                <strong>Sản phẩm này hiện không có biến thể nào.</strong>
            </div>
        </c:if>

    </div>
                </div>
        
            </div>
           
        </div>
        <!--Grid row-->   
<!--Main layout-->
    <hr class="text-dark" />

    <div class="container">
        <!-- Section: Social media -->
        <section class="mb-3">
            <!-- Facebook -->
            <a class="btn-link btn-floating btn-lg text-white" href="#!" role="button" data-mdb-ripple-color="dark"><i class="fab fa-facebook-f"></i></a>

            <!-- Twitter -->
            <a class="btn-link btn-floating btn-lg text-white" href="#!" role="button" data-mdb-ripple-color="dark"><i class="fab fa-twitter"></i></a>

            <!-- Google -->
            <a class="btn-link btn-floating btn-lg text-white" href="#!" role="button" data-mdb-ripple-color="dark"><i class="fab fa-google"></i></a>

            <!-- Instagram -->
            <a class="btn-link btn-floating btn-lg text-white" href="#!" role="button" data-mdb-ripple-color="dark"><i class="fab fa-instagram"></i></a>

            <!-- YouTube -->
            <a class="btn-link btn-floating btn-lg text-white" href="#!" role="button" data-mdb-ripple-color="dark"><i class="fab fa-youtube"></i></a>
            <!-- Github -->
            <a class="btn-link btn-floating btn-lg text-white" href="#!" role="button" data-mdb-ripple-color="dark"><i class="fab fa-github"></i></a>
        </section>
        <!-- Section: Social media -->
    </div>
    <!-- Grid container -->
</main>


 <!-- Copyright -->
  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.05);">
    © 2020 Copyright:
    <a class="text-body" href="https://mdbootstrap.com/">MDBootstrap.com</a>
  </div>
  <!-- Copyright -->
</footer>
</body>
</html>

