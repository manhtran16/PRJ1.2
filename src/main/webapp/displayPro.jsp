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
   <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>Clothes Store - Fashion Ecommerce</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/core-style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userhome.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/displayProduct.css">
  </head>
  <body>
   <header class="header_area">
        <div class="classy-nav-container breakpoint-off d-flex align-items-center justify-content-between">
            <!-- Classy Menu -->
            <nav class="classy-navbar" id="essenceNav">
                <!-- Logo -->
                <a class="nav-brand" href="index"><img src="img/core-img/logo.png" alt=""></a>
                <!-- Navbar Toggler -->
                <div class="classy-navbar-toggler">
                    <span class="navbarToggler"><span></span><span></span><span></span></span>
                </div>
                <!-- Menu -->
                <div class="classy-menu">
                    <!-- close btn -->
                    <div class="classycloseIcon">
                        <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                    </div>
                    <!-- Nav Start -->
                    <div class="classynav">
                        <ul>
                            <li><a href="products">Shop</a>
                                <div class="megamenu">
                                    <ul class="single-mega cn-col-4">
                                        <li class="title">Trang phục nữ</li>
                                        <li><a href="products?typeId=1">Váy</a></li>
                                        <li><a href="products?typeId=2">Áo blouse</a></li>
                                        <li><a href="products?typeId=3">Áo thun</a></li>
                                        <li><a href="products?typeId=4">Jumpsuit</a></li>
                                    </ul>
                                    <ul class="single-mega cn-col-4">
                                        <li class="title">Trang phục nam</li>
                                        <li><a href="products?typeId=5">Áo thun</a></li>
                                        <li><a href="products?typeId=6">Áo polo</a></li>
                                        <li><a href="products?typeId=7">Áo sơ mi</a></li>
                                        <li><a href="products?typeId=8">Áo khoác</a></li>
                                    </ul>
                                    <ul class="single-mega cn-col-4">
                                        <li class="title">Trang phục trẻ em</li>
                                        <li><a href="products?typeId=9">Váy</a></li>
                                        <li><a href="products?typeId=10">Áo sơ mi</a></li>
                                        <li><a href="products?typeId=11">Áo thun</a></li>
                                        <li><a href="products?typeId=12">Áo khoác</a></li>
                                    </ul>
                                    <div class="single-mega cn-col-4">
                                        <img src="img/bg-img/bg-6.jpg" alt="">
                                    </div>
                                </div>
                            </li>
                            <li><a href="#">Pages</a>
                                <ul class="dropdown">
                                    <li><a href="index">Home</a></li>
                                    <li><a href="products">Shop</a></li>
                                     <li><a href="about.jsp">About</a></li>
                                </ul>
                            </li>
                             <li><a href="about.jsp">About</a></li>
                        </ul>
                    </div>
                    <!-- Nav End -->
                </div>
            </nav>

            <!-- Header Meta Data -->
            <div class="header-meta d-flex clearfix justify-content-end">
                
                <!-- User Login Info -->
                <div class="user-login-info">
                    <a href="#"><img src="img/core-img/user.svg" alt=""></a>
                    <div class="user-content">
                        <c:choose>
                            <c:when test="${not empty sessionScope.user}">
                                <a href="${pageContext.request.contextPath}/user/userProfile.jsp">Tài khoản</a>
                                <a href="${pageContext.request.contextPath}/userOrders">Đơn hàng</a>
                                <a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
                            </c:when>
                            <c:otherwise>
                                <a href="login.jsp">Đăng nhập</a>
                                <a href="register.jsp">Đăng ký</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <!-- Cart Area -->
                <div class="cart-area">
                    <a href="cart" id="essenceCartBtn"><img src="img/core-img/bag.svg" alt=""></a>
                </div>
            </div>

        </div>
    </header>
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
                <div style="margin-top: 15px;overflow: scroll;height: 300px;width: 263px;">
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


  <!-- ##### Brands Area Start ##### -->
    <div class="brands-area d-flex align-items-center justify-content-between">
        <!-- Brand Logo -->
        <div class="single-brands-logo">
            <img src="img/core-img/brand1.png" alt="">
        </div>
        <!-- Brand Logo -->
        <div class="single-brands-logo">
            <img src="img/core-img/brand2.png" alt="">
        </div>
        <!-- Brand Logo -->
        <div class="single-brands-logo">
            <img src="img/core-img/brand3.png" alt="">
        </div>
        <!-- Brand Logo -->
        <div class="single-brands-logo">
            <img src="img/core-img/brand4.png" alt="">
        </div>
        <!-- Brand Logo -->
        <div class="single-brands-logo">
            <img src="img/core-img/brand5.png" alt="">
        </div>
        <!-- Brand Logo -->
        <div class="single-brands-logo">
            <img src="img/core-img/brand6.png" alt="">
        </div>
    </div>
    <!-- ##### Brands Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <footer class="footer_area clearfix">
        <div class="container">
            <div class="row">
                <!-- Single Widget Area -->
                <div class="col-12 col-md-6">
                    <div class="single_widget_area d-flex mb-30">
                        <!-- Logo -->
                        <div class="footer-logo mr-50">
                            <a href="index"><img src="img/core-img/logo2.png" alt=""></a>
                        </div>
                        <!-- Footer Menu -->
                        <div class="footer_menu">
                            <ul>
                                <li><a href="products">Shop</a></li>
                                <li><a href="about.jsp">About</a></li>
                                <li><a href="about.jsp">Contact</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- Single Widget Area -->
                <div class="col-12 col-md-6">
                    <div class="single_widget_area mb-30">
                        <ul class="footer_widget_menu">
                            <li><a href="userOrders.jsp">Trạng thái đơn hàng</a></li>
                            <li><a href="#">Tùy chọn thanh toán</a></li>
                            <li><a href="#">Hướng dẫn</a></li>
                            <li><a href="#">Chính sách bảo mật</a></li>
                            <li><a href="#">Điều khoản sử dụng</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="row align-items-end">
               
                <!-- Single Widget Area -->
                <div class="col-12 col-md-6">
                    <div class="single_widget_area">
                        <div class="footer_social_area">
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Facebook"><i
                                    class="fa fa-facebook" aria-hidden="true"></i></a>
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Instagram"><i
                                    class="fa fa-instagram" aria-hidden="true"></i></a>
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Twitter"><i
                                    class="fa fa-twitter" aria-hidden="true"></i></a>
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Pinterest"><i
                                    class="fa fa-pinterest" aria-hidden="true"></i></a>
                            <a href="#" data-toggle="tooltip" data-placement="top" title="Youtube"><i
                                    class="fa fa-youtube-play" aria-hidden="true"></i></a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mt-5">
                <div class="col-md-12 text-center">
                    <p>
                        Copyright &copy;
                        <script>document.write(new Date().getFullYear());</script> All rights reserved | Clothes Store
                    </p>
                </div>
            </div>

        </div>
    </footer>
    <!-- ##### Footer Area End ##### -->


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
<!-- jQuery (Necessary for All JavaScript Plugins) -->
    <script src="${pageContext.request.contextPath}/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
    <!-- Classy Nav js -->
    <script src="${pageContext.request.contextPath}/js/classy-nav.min.js"></script>
    <!-- Active js -->
    <script src="${pageContext.request.contextPath}/js/active.js"></script>

</body>
</html>
