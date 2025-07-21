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
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <!-- Google Fonts Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap">
    <!-- Local CSS with context path -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <style>
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
        
        /* Rating Styles */
        .rating-summary {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-top: 10px;
        }
        
        .average-rating {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .rating-score {
            font-size: 2em;
            font-weight: bold;
            color: #ffc107;
        }
        
        .rating-stars {
            display: flex;
            gap: 2px;
        }
        
        .star {
            font-size: 1.2em;
            color: #ddd;
        }
        
        .star.filled {
            color: #ffc107;
        }
        
        .rating-count {
            color: #6c757d;
            font-size: 0.9em;
        }
        
        .rating-input {
            display: flex;
            gap: 5px;
            align-items: center;
        }
        
        .rating-input input[type="radio"] {
            display: none;
        }
        
        .star-label {
            font-size: 1.5em;
            color: #ddd;
            cursor: pointer;
            transition: color 0.2s;
        }
        
        .rating-input input[type="radio"]:checked + .star-label {
            color: #ffc107;
        }
        
        .rating-input input[type="radio"]:hover + .star-label {
            color: #ffc107;
        }
        
        /* Highlight stars from left to right when hovering */
        .rating-input:hover .star-label {
            color: #ddd;
        }
        
        .rating-input input[type="radio"]:hover + .star-label,
        .rating-input input[type="radio"]:hover ~ input[type="radio"] + .star-label {
            color: #ffc107;
        }
        
        .rating-item {
            border-bottom: 1px solid #eee;
            padding: 15px 0;
        }
        
        .rating-item:last-child {
            border-bottom: none;
        }
        
        .rating-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 5px;
        }
        
        .rating-comment {
            margin-top: 8px;
            color: #555;
        }
        
        .rating-item.hidden {
            display: none;
        }
    </style>
  </head>
  <body>
    <header>
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #cc66ff;">
    <div class="container">
      <a class="navbar-brand text-white" href="index">
        <i class="fas fa-tshirt me-2"></i>Clothes Store
      </a>
      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarNav"
        aria-controls="navbarNav"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item">
            <a class="nav-link text-white" href="index">
              <i class="fas fa-home me-1"></i>Home
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-white" href="products">
              <i class="fas fa-shopping-bag me-1"></i>Products
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-white" href="cart">
              <i class="fas fa-shopping-cart me-1"></i>Cart
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-white" href="userOrders">
              <i class="fas fa-receipt me-1"></i>My Orders
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- Navbar -->

  
</header>
<main>
<!--Main layout-->    <main class="mt-5 pt-4">
        <div class="container mt-5">

            <!-- Display success/error messages -->
            <c:if test="${not empty sessionScope.successMessage}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    ${sessionScope.successMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
                <c:remove var="successMessage" scope="session" />
            </c:if>

            <c:if test="${not empty sessionScope.errorMessage}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    ${sessionScope.errorMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
                <c:remove var="errorMessage" scope="session" />
            </c:if>

            <!--Grid row-->
        <div class="row">
            <!--Grid column-->
            <div class="col-md-6 mb-4">
                <c:choose>
                    <c:when test="${not empty product.variants and not empty product.variants[0].images and not empty product.variants[0].images[0].url}">
                        <img src="${product.variants[0].images[0].url}" 
                             class="img-fluid" 
                             alt="${product.productName}" 
                             onerror="this.src='https://via.placeholder.com/500x400?text=Product+Image';" />
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
        
                                    <c:forEach var="variant" items="${product.variants}">
                                        <c:set var="variantColor" value="Mặc định" />
                                        <c:set var="variantSize" value="" />
                                        
                                
                                        <c:forEach var="attrValue" items="${variant.attributeValues}">
                                         
                                            <c:set var="attrNameLower" value="${fn:toLowerCase(attrValue.attribute.attributeName)}" />
                                            <c:if test="${attrNameLower == 'color' || attrNameLower == 'màu sắc' || attrNameLower == 'mau sac' || fn:contains(attrNameLower, 'color') || fn:contains(attrNameLower, 'màu')}">
                                                <c:set var="variantColor" value="${attrValue.value}" />
                                            </c:if>
                                           
                                            <c:if test="${attrNameLower == 'size' || attrNameLower == 'kích thước' || attrNameLower == 'kich thuoc' || fn:contains(attrNameLower, 'size') || fn:contains(attrNameLower, 'kích')}">
                                                <c:set var="variantSize" value="${attrValue.value}" />
                                            </c:if>
                                        </c:forEach>
                                        
                                      
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
                                                            ✅ Còn: <strong>${variant.quantity}</strong> sản phẩm
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
                                                            <a href="cart?action=add&variantId=${variant.variantID}&quantity=1" 
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
        
        <!-- Ratings Section -->
        <div class="row mt-5">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h4>Đánh giá sản phẩm</h4>
                        <div class="rating-summary">
                            <c:if test="${totalRatings > 0}">
                                <div class="average-rating">
                                    <span class="rating-score">${String.format("%.1f", averageRating)}</span>
                                    <div class="rating-stars">
                                        <c:forEach var="i" begin="1" end="5">
                                            <c:choose>
                                                <c:when test="${i <= averageRating}">
                                                    <span class="star filled">★</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="star">☆</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </div>
                                    <span class="rating-count">(${totalRatings} đánh giá)</span>
                                </div>
                            </c:if>
                            <c:if test="${totalRatings == 0}">
                                <p>Chưa có đánh giá nào cho sản phẩm này.</p>
                            </c:if>
                        </div>
                    </div>
                    
                    <div class="card-body">
                        <!-- Rating Form -->
                        <c:if test="${not empty sessionScope.user}">
                            <div class="rating-form mb-4">
                                <h5>
                                    <c:choose>
                                        <c:when test="${not empty userRating}">
                                            Cập nhật đánh giá của bạn
                                        </c:when>
                                        <c:otherwise>
                                            Đánh giá sản phẩm này
                                        </c:otherwise>
                                    </c:choose>
                                </h5>
                                
                                <form action="user/rating" method="post">
                                    <input type="hidden" name="productId" value="${product.productID}">
                                    <input type="hidden" name="action" value="${not empty userRating ? 'update' : 'add'}">
                                    
                                    <div class="mb-3">
                                        <label class="form-label">Đánh giá (1-5 sao):</label>
                                        <div class="rating-input">
                                            <c:forEach var="i" begin="1" end="5">
                                                <input type="radio" name="rate" value="${i}" id="star${i}" 
                                                       ${(not empty userRating && userRating.rate == i) ? 'checked' : ''}>
                                                <label for="star${i}" class="star-label">★</label>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label for="comment" class="form-label">Nhận xét:</label>
                                        <textarea class="form-control" id="comment" name="comment" rows="3" 
                                                  placeholder="Chia sẻ nhận xét của bạn về sản phẩm...">${not empty userRating ? userRating.comment : ''}</textarea>
                                    </div>
                                    
                                    <button type="submit" class="btn btn-primary">
                                        <c:choose>
                                            <c:when test="${not empty userRating}">
                                                Cập nhật đánh giá
                                            </c:when>
                                            <c:otherwise>
                                                Gửi đánh giá
                                            </c:otherwise>
                                        </c:choose>
                                    </button>
                                </form>
                            </div>
                        </c:if>
                        
                        <c:if test="${empty sessionScope.user}">
                            <div class="alert alert-info">
                                <a href="login.jsp">Đăng nhập</a> để có thể đánh giá sản phẩm này.
                            </div>
                        </c:if>
                        
                        <!-- Display Ratings -->
                        <div class="ratings-list">
                            <h5>Tất cả đánh giá</h5>
                            <c:if test="${not empty ratings}">
                                <c:forEach var="rating" items="${ratings}" varStatus="status">
                                    <div class="rating-item ${status.index >= 5 ? 'hidden' : ''}">
                                        <div class="rating-header">
                                            <strong>${rating.user.firstName} ${rating.user.lastName}</strong>
                                            <div class="rating-stars">
                                                <c:forEach var="i" begin="1" end="5">
                                                    <c:choose>
                                                        <c:when test="${i <= rating.rate}">
                                                            <span class="star filled">★</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="star">☆</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <c:if test="${not empty rating.comment}">
                                            <p class="rating-comment">${rating.comment}</p>
                                        </c:if>
                                    </div>
                                </c:forEach>
                                
                                <c:if test="${fn:length(ratings) > 5}">
                                    <button type="button" class="btn btn-outline-primary" id="showMoreRatings">
                                        Xem thêm đánh giá
                                    </button>
                                </c:if>
                            </c:if>
                            
                            <c:if test="${empty ratings}">
                                <p>Chưa có đánh giá nào.</p>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
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

<script>
// Auto-hide alerts after 5 seconds
document.addEventListener('DOMContentLoaded', function() {
    const alerts = document.querySelectorAll('.alert');
    alerts.forEach(function(alert) {
        setTimeout(function() {
            if (alert.classList.contains('show')) {
                alert.classList.remove('show');
                alert.classList.add('fade');
                setTimeout(function() {
                    alert.remove();
                }, 500);
            }
        }, 5000);
    });
});

// Rating star interaction
document.addEventListener('DOMContentLoaded', function() {
    const ratingInputs = document.querySelectorAll('.rating-input input[type="radio"]');
    const starLabels = document.querySelectorAll('.star-label');
    
    // Handle rating star clicks
    ratingInputs.forEach((input, index) => {
        input.addEventListener('change', function() {
            const selectedValue = parseInt(this.value);
            // Update visual stars - fill from left to right up to selected value
            starLabels.forEach((label, labelIndex) => {
                const starValue = labelIndex + 1;
                if (starValue <= selectedValue) {
                    label.style.color = '#ffc107';
                } else {
                    label.style.color = '#ddd';
                }
            });
        });
        
        // Handle hover effects
        input.addEventListener('mouseenter', function() {
            const hoverValue = parseInt(this.value);
            starLabels.forEach((label, labelIndex) => {
                const starValue = labelIndex + 1;
                if (starValue <= hoverValue) {
                    label.style.color = '#ffc107';
                } else {
                    label.style.color = '#ddd';
                }
            });
        });
    });
    
    // Handle mouse leave to restore original state
    const ratingContainer = document.querySelector('.rating-input');
    if (ratingContainer) {
        ratingContainer.addEventListener('mouseleave', function() {
            const checkedInput = document.querySelector('.rating-input input[type="radio"]:checked');
            if (checkedInput) {
                const checkedValue = parseInt(checkedInput.value);
                starLabels.forEach((label, labelIndex) => {
                    const starValue = labelIndex + 1;
                    if (starValue <= checkedValue) {
                        label.style.color = '#ffc107';
                    } else {
                        label.style.color = '#ddd';
                    }
                });
            } else {
                // No selection, reset all stars
                starLabels.forEach(label => {
                    label.style.color = '#ddd';
                });
            }
        });
    }
    
    // Handle show more ratings
    const showMoreBtn = document.getElementById('showMoreRatings');
    if (showMoreBtn) {
        showMoreBtn.addEventListener('click', function() {
            const hiddenRatings = document.querySelectorAll('.rating-item.hidden');
            hiddenRatings.forEach(item => {
                item.classList.remove('hidden');
            });
            showMoreBtn.style.display = 'none';
        });
    }
    
    // Initialize existing rating stars
    const checkedInput = document.querySelector('.rating-input input[type="radio"]:checked');
    if (checkedInput) {
        const checkedValue = parseInt(checkedInput.value);
        starLabels.forEach((label, labelIndex) => {
            const starValue = labelIndex + 1;
            if (starValue <= checkedValue) {
                label.style.color = '#ffc107';
            } else {
                label.style.color = '#ddd';
            }
        });
    }
});
</script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

