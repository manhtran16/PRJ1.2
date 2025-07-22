<%-- 
    Document   : products
    Created on : Jun 1, 2025, 11:00:14 PM
    Author     : manht
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!-- Title  -->
        <title>Essence - Clothing shop</title>

        <!-- Favicon  -->
        <link rel="icon" href="img/core-img/favicon.ico">

        <!-- Core Style CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/core-style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/shop.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userhome.css">
        

        <style>
            .single-product-wrapper .product-img img {
                height: 250px;
                width: 100%;
                object-fit: cover;
            }


            .single-product-wrapper .product-img {
                height: 250px;
                overflow: hidden;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .filter-product{
                display: flex;
                flex-direction: column;
                margin-bottom: 20px;
            }
            
        </style>
    </head>
    <body>
        <!-- Navigation -->
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
                        <a href="cart" id="essenceCartBtn"><img src="img/core-img/bag.svg" alt=""> </a>
                    </div>
                </div>


            </div>
        </header>
        <!-- ##### Breadcumb Area Start ##### -->
    
    <!-- ##### Breadcumb Area End ##### -->
        <section class="shop_grid_area section-padding-80">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <!--                 Error Message -->
                        <c:if test="${not empty errorMessage}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <i class="fas fa-exclamation-triangle me-2"></i>${errorMessage}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        </c:if>
                    </div>

                    <!-- Search and Filter Section -->
                    <div class="col-12 col-md-4 col-lg-3">
                        <div>
                            <h6>Filter</h6>
                            <form method="GET" action="products">

                                <!-- Search Box -->
                                <div class="filter-product" style="margin-bottom: 20px;">
                                    <label for="searchQuery" class="form-label">Search Products</label>
                                    <input type="text" class="form-control" id="searchQuery" name="q" 
                                           value="${searchQuery}" placeholder="Enter product name...">
                                </div>

                               
                                    <div class="filter-product">
                                    <select class="form-control" id="brandFilter" >
                                       
                                        <option value="">All Brands</option>
                                        <c:forEach var="brand" items="${brands}">
                                            
                                                <option value="${brand.brandID}"
                                                    ${selectedBrandId == brand.brandID ? 'selected' : ''}>
                                                ${brand.brandName}
                                            </option>
                                           
                                        </c:forEach>
                                           
                                    </select>
                                </div>

                                <div class="filter-product">
                                    <select class="form-control" id="typeFilter" >
                                        <option value="">All Categories</option>
                                        <c:forEach var="type" items="${types}">
                                            <option value="${type.typeID}"
                                                    ${selectedTypeId == type.typeID ? 'selected' : ''}>
                                                ${type.typeName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                
                                <!-- Price Range -->
                                <div class="filter-product" >
                                    <div>
                                        <label for="minPrice" class="form-label" >Min Price (VNĐ)</label>
                                        <input type="number" class="form-control" id="minPrice" name="minPrice" 
                                               value="${minPrice}" placeholder="0" min="0" step="1">
                                        <span id="minPriceError" class="text-danger"></span>
                                    </div>

                                    <div>
                                        <label for="maxPrice" class="form-label">Max Price (VNĐ)</label>
                                        <input type="number" class="form-control" id="maxPrice" name="maxPrice" 
                                               value="${maxPrice}" placeholder="1000000" min="0" step="1">
                                        <span id="maxPriceError" class="text-danger"></span>
                                    </div>
                                    <span id="priceRangeError" class="text-danger"></span>
                                </div>


                                <div class="widget button mb-50">
                                    <div style="margin-bottom:20px">
                                        <button type="submit" class="btn btn-primary me-2">
                                            Search & Filter
                                        </button>
                                    </div>
                                    <div>
                                        <a href="products" class="btn btn-outline-secondary">
                                            Clear Filters
                                        </a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>


                    <!-- Products Grid -->
                    <div class="col-12 col-md-8 col-lg-9">
                        <c:choose>
                            <c:when test="${empty products}">
                                <div class="text-center py-5">
                                    <i class="fas fa-box-open fa-3x text-muted mb-3"></i>
                                    <h4>No Products Available</h4>
                                    <p class="text-muted">We're working on adding new products. Check back soon!</p>
                                    <a href="index" class="btn btn-primary">
                                        <i class="fas fa-home me-1"></i>Back to Home
                                    </a>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="shop_grid_product_area">
                                    <div class="row">
                                        <c:forEach var="product" items="${products}">
                                            <div class="col-12 col-sm-6 col-lg-4">
                                                <div class="single-product-wrapper">
                                                    <!-- Product Image -->
                                                    <div class="product-img">
                                                        <c:choose>
                                                            <c:when test="${not empty product.variants and not empty product.variants[0].images and not empty product.variants[0].images[0].url}">
                                                                <img src="${product.variants[0].images[0].url}" 
                                                                     class="product-image" 
                                                                     alt="${product.productName}"
                                                                     onerror="this.src='https://via.placeholder.com/300x250?text=No+Image';">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <img src="https://via.placeholder.com/300x250?text=No+Image" 
                                                                     class="product-image" 
                                                                     alt="${product.productName}">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>

                                                    <!-- Product Details -->
                                                    <div class="product-description">
                                                        <!-- Brand Badge -->
                                                        <c:if test="${not empty product.brand}">
                                                            <div class="mb-2">
                                                                <h6 class="brand-badge">${product.brand.brandName}</h6>
                                                            </div>
                                                        </c:if>
                                                        <!-- Product Name -->
                                                        <h5 class="product-title mb-2">
                                                            <a href="products?action=detail&id=${product.productID}" class="product-title">
                                                                ${product.productName}
                                                            </a>
                                                        </h5>

                                                        <!-- Product Description -->
                                                        <!--                                            <p class="product-description mb-3">
                                                        ${product.description}
                                                    </p>-->

                                                        <!-- Action Button -->
                                                        <div class="hover-content">
                                                            <div class="add-to-cart-btn">
                                                                <a href="products?action=detail&id=${product.productID}" 
                                                                   class="btn btn-primary w-100">
                                                                    View Details
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </section>

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
                                    <li><a href="about.jsp">About</a></li>
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
    
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <!-- jQuery (Necessary for All JavaScript Plugins) -->
        <script src="${pageContext.request.contextPath}/js/jquery/jquery-2.2.4.min.js"></script>
        <!-- Popper js -->
        <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
        <!-- Bootstrap js -->
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <!-- Plugins js -->
        <!--<script src="${pageContext.request.contextPath}/js/plugins.js"></script>-->
        <!-- Classy Nav js -->
        <script src="${pageContext.request.contextPath}/js/classy-nav.min.js"></script>
        <!-- Active js -->
        <script src="${pageContext.request.contextPath}/js/active.js"></script>
        <script src="${pageContext.request.contextPath}/js/shopPro.js"></script>
     
</script>
</html>