<%-- 
    Document   : products
    Created on : Jun 1, 2025, 11:00:14 PM
    Author     : manht
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<<<<<<< HEAD
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Products - Clothes Store</title>
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Local CSS with context path -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .product-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: 1px solid #dee2e6;
            border-radius: 8px;
            overflow: hidden;
        }
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }
        .product-image {
            height: 250px;
            object-fit: cover;
            width: 100%;
        }
        .product-title {
            font-size: 1.1rem;
            font-weight: 600;
            color: #333;
            text-decoration: none;
        }
        .product-title:hover {
            color: #cc66ff;
            text-decoration: none;
        }
        .product-description {
            color: #6c757d;
            font-size: 0.9rem;
            height: 40px;
            overflow: hidden;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            line-clamp: 2;
            -webkit-box-orient: vertical;
        }
        .brand-badge {
            background-color: #cc66ff;
            color: white;
            font-size: 0.75rem;
            padding: 0.25rem 0.5rem;
            border-radius: 15px;
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #cc66ff;">
        <div class="container">
            <a class="navbar-brand text-white" href="index">
                <i class="fas fa-tshirt me-2"></i>Clothes Store
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link text-white" href="index">
                    <i class="fas fa-home me-1"></i>Home
                </a>
                <a class="nav-link text-white active" href="products">
                    <i class="fas fa-shopping-bag me-1"></i>Products
                </a>
                <a class="nav-link text-white" href="cart">
                    <i class="fas fa-shopping-cart me-1"></i>Cart
                </a>
                <a class="nav-link text-white" href="userOrders">
                    <i class="fas fa-receipt me-1"></i>My Orders
                </a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="row">
            <div class="col-12">
                <h2 class="mb-4">
                    <i class="fas fa-shopping-bag me-2"></i>Our Products
                </h2>

                <!-- Error Message -->
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="fas fa-exclamation-triangle me-2"></i>${errorMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>

                <!-- Search and Filter Section -->
                <div class="card mb-4">
                    <div class="card-body">
                        <form method="GET" action="products">
                            <div class="row g-3">
                                <!-- Search Box -->
                                <div class="col-md-4">
=======
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!-- Title  -->
        <title>Essence - Fashion Ecommerce Template</title>

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
                            <li><a href="about.jsp">Contact</a></li>
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
                                    <a href="userProfile">Tài khoản</a>
                                    <a href="userOrders">Đơn hàng</a>
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
        
        <div class="right-side-cart-area">

            <div class="cart-button">
                <a href="#" id="rightSideCart"><img src="img/core-img/bag.svg" alt=""></a>
            </div>
        </div>

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
                        <div class="shop_sidebar_area">
                            <h6>Filter</h6>
                            <form method="GET" action="products">

                                <!-- Search Box -->
                                <div class="widget search mb-50">
>>>>>>> 59620543d8394f5b3d0f000d6b73fceff0075f13
                                    <label for="searchQuery" class="form-label">Search Products</label>
                                    <input type="text" class="form-control" id="searchQuery" name="q" 
                                           value="${searchQuery}" placeholder="Enter product name...">
                                </div>
<<<<<<< HEAD
                                
                                <!-- Brand Filter -->
                                <div class="col-md-2">
=======

                                <!-- Brand Filter -->
                                <div class="widget brand mb-50">
>>>>>>> 59620543d8394f5b3d0f000d6b73fceff0075f13
                                    <label for="brandSelect" class="form-label">Brand</label>
                                    <select class="form-select" id="brandSelect" name="brandId">
                                        <option value="">All Brands</option>
                                        <c:forEach var="brand" items="${brands}">
                                            <option value="${brand.brandID}" 
                                                    ${selectedBrandId == brand.brandID ? 'selected' : ''}>
                                                ${brand.brandName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
<<<<<<< HEAD
                                
                                <!-- Type Filter -->
                                <div class="col-md-2">
=======

                                <!-- Type Filter -->
                                <div class="widget catagory mb-50">
>>>>>>> 59620543d8394f5b3d0f000d6b73fceff0075f13
                                    <label for="typeSelect" class="form-label">Category</label>
                                    <select class="form-select" id="typeSelect" name="typeId">
                                        <option value="">All Categories</option>
                                        <c:forEach var="type" items="${types}">
                                            <option value="${type.typeID}" 
                                                    ${selectedTypeId == type.typeID ? 'selected' : ''}>
                                                ${type.typeName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
<<<<<<< HEAD
                                
                                <!-- Price Range -->
                                <div class="col-md-2">
                                    <label for="minPrice" class="form-label">Min Price (VNĐ)</label>
                                    <input type="number" class="form-control" id="minPrice" name="minPrice" 
                                           value="${minPrice}" placeholder="0" min="0" step="1000">
                                </div>
                                
                                <div class="col-md-2">
                                    <label for="maxPrice" class="form-label">Max Price (VNĐ)</label>
                                    <input type="number" class="form-control" id="maxPrice" name="maxPrice" 
                                           value="${maxPrice}" placeholder="1000000" min="0" step="1000">
                                </div>
                            </div>
                            
                            <div class="row mt-3">
                                <div class="col-12">
                                    <button type="submit" class="btn btn-primary me-2">
                                        <i class="fas fa-search me-1"></i>Search & Filter
                                    </button>
                                    <a href="products" class="btn btn-outline-secondary">
                                        <i class="fas fa-times me-1"></i>Clear Filters
                                    </a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Products Grid -->
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
                        <div class="row">
                            <c:forEach var="product" items="${products}">
                                <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                                    <div class="card product-card h-100">
                                        <!-- Product Image -->
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
                                        
                                        <!-- Product Details -->
                                        <div class="card-body d-flex flex-column">
                                            <!-- Brand Badge -->
                                            <c:if test="${not empty product.brand}">
                                                <div class="mb-2">
                                                    <span class="brand-badge">${product.brand.brandName}</span>
                                                </div>
                                            </c:if>
                                              <!-- Product Name -->
                                            <h5 class="product-title mb-2">
                                                <a href="products?action=detail&id=${product.productID}" class="product-title">
                                                    ${product.productName}
                                                </a>
                                            </h5>
                                            
                                            <!-- Product Description -->
                                            <p class="product-description mb-3">
                                                ${product.description}
                                            </p>
                                            
                                            <!-- Action Button -->
                                            <div class="mt-auto">
                                                <a href="products?action=detail&id=${product.productID}" 
                                                   class="btn btn-primary w-100">
                                                    <i class="fas fa-eye me-1"></i>View Details
                                                </a>
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

    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-3 mt-5">
        <div class="container">
            <p class="mb-0">&copy; 2025 Clothes Store. All rights reserved.</p>
        </div>
    </footer>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
=======

                                <!-- Price Range -->
                                <div class="widget price mb-50">
                                    <div>
                                        <label for="minPrice" class="form-label">Min Price (VNĐ)</label>
                                        <input type="number" class="form-control" id="minPrice" name="minPrice" 
                                               value="${minPrice}" placeholder="0" min="0" step="1000">
                                    </div>

                                    <div>
                                        <label for="maxPrice" class="form-label">Max Price (VNĐ)</label>
                                        <input type="number" class="form-control" id="maxPrice" name="maxPrice" 
                                               value="${maxPrice}" placeholder="1000000" min="0" step="1000">
                                    </div>
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
                            <div class="footer_heading mb-30">
                                <h6>Đăng ký nhận tin</h6>
                            </div>
                            <div class="subscribtion_form">
                                <form action="#" method="post">
                                    <input type="email" name="mail" class="mail" placeholder="Email của bạn">
                                    <button type="submit" class="submit"><i class="fa fa-long-arrow-right"
                                                                            aria-hidden="true"></i></button>
                                </form>
                            </div>
                        </div>
                    </div>
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
>>>>>>> 59620543d8394f5b3d0f000d6b73fceff0075f13
