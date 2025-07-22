<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />
        <title>Chi tiết variant - ${product.productName}</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/mdb.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/core-style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userhome.css">
        <style>
            .variant-card {
                border: 2px solid #007bff;
                border-radius: 10px;
                padding: 20px;
                margin: 20px 0;
                background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            }
            .attribute-badge {
                background-color: #007bff;
                color: white;
                padding: 5px 10px;
                border-radius: 15px;
                margin: 5px;
                display: inline-block;
                font-size: 14px;
            }
            .back-btn {
                background-color: #6c757d;
                color: white;
                padding: 10px 20px;
                text-decoration: none;
                border-radius: 5px;
                display: inline-block;
                margin-bottom: 20px;
            }
            .add-to-cart-btn {
                background-color: #28a745;
                color: white;
                padding: 15px 30px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 18px;
                font-weight: bold;
                width: 100%;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <!-- ##### Header Area Start ##### -->
        <header class="header_area">
            <div class="classy-nav-container breakpoint-off d-flex align-items-center justify-content-between">
                <!-- Classy Menu -->
                <nav class="classy-navbar" id="essenceNav">
                    <!-- Logo -->
                    <a class="nav-brand" href="${pageContext.request.contextPath}/index"><img src="${pageContext.request.contextPath}/img/core-img/logo.png" alt=""></a>
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
                                <li>
                                    <a href="#">Pages</a>
                                    <ul class="dropdown">
                                        <li><a href="${pageContext.request.contextPath}/index">Home</a></li>
                                        <li><a href="${pageContext.request.contextPath}/products">Shop</a></li>
                                        
                                    </ul>

                                </li>
                                
                            </ul>
                        </div>
                        <!-- Nav End -->
                    </div>
                </nav>

                <!-- Header Meta Data -->
                <div class="header-meta d-flex clearfix justify-content-end">
                   
                    <!-- User Login Info -->
                    <div class="user-login-info">
                        <a href="#"><img src="${pageContext.request.contextPath}/img/core-img/user.svg" alt=""></a>
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
                        <a href="${pageContext.request.contextPath}/cart" id="essenceCartBtn"><img src="${pageContext.request.contextPath}/img/core-img/bag.svg" alt=""></a>
                    </div>
                </div>

            </div>
        </header>
        <!-- ##### Header Area End ##### -->
        <main class="mt-5 pt-4">
            <div class="container mt-5">

                <!-- Back button -->
                <a href="products?action=detail&id=${product.productID}" class="back-btn">
                    <i class="fas fa-arrow-left"></i> Quay lại sản phẩm
                </a>

                <div class="row">
                    <!-- Product Image -->
                    <div class="col-md-6 mb-4">
                        <c:choose>
                            <c:when test="${not empty selectedVariant.images}">
                                <img src="${selectedVariant.images[0].url}" class="img-fluid" alt="${product.productName}" />
                            </c:when>
                            <c:when test="${not empty product.variants and not empty product.variants[0].images}">
                                <img src="${product.variants[0].images[0].url}" class="img-fluid" alt="${product.productName}" />
                            </c:when>
                            <c:otherwise>
                                <img src="https://via.placeholder.com/500x400?text=Product+Image" class="img-fluid" alt="${product.productName}" />
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <!-- Variant Details -->
                    <div class="col-md-6 mb-4">
                        <div class="p-4">

                            <!-- Product Title -->
                            <h2>${product.productName}</h2>
                            <c:if test="${not empty product.brand}">
                                <p class="text-muted">Brand: ${product.brand.brandName}</p>
                            </c:if>
                            <c:if test="${not empty product.type}">
                                <p class="text-muted">Category: ${product.type.typeName}</p>
                            </c:if>

                            <!-- Variant Specific Card -->
                            <div class="variant-card">
                                <h4 style="color: #007bff; margin-bottom: 15px;">
                                    <i class="fas fa-tag"></i> Chi tiết phiên bản này
                                </h4>

                                <!-- Variant Attributes -->
                                <div style="margin-bottom: 15px;">
                                    <c:forEach var="attrValue" items="${selectedVariant.attributeValues}">
                                        <span class="attribute-badge">
                                            ${attrValue.attribute.attributeName}: ${attrValue.value}
                                        </span>
                                    </c:forEach>
                                </div>

                                <!-- Price -->
                                <h3 style="color: #28a745; margin: 15px 0;">
                                    Giá: ${selectedVariant.price} VNĐ
                                </h3>

                                <!-- Stock Status -->
                                <div style="margin: 15px 0;">
                                    <c:choose>
                                        <c:when test="${selectedVariant.quantity > 0}">
                                            <p style="color: #28a745; font-size: 16px;">
                                                <i class="fas fa-check-circle"></i> 
                                                Còn hàng: <strong>${selectedVariant.quantity}</strong> sản phẩm
                                            </p>
                                        </c:when>
                                        <c:otherwise>
                                            <p style="color: #dc3545; font-size: 16px;">
                                                <i class="fas fa-times-circle"></i> 
                                                <strong>Hết hàng</strong>
                                            </p>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>

                            <!-- Product Description -->
                            <div style="margin: 20px 0;">
                                <h5>Mô tả sản phẩm:</h5>
                                <p>
                                    <c:choose>
                                        <c:when test="${not empty product.description}">
                                            ${product.description}
                                        </c:when>
                                        <c:otherwise>
                                            Không có mô tả cho sản phẩm này.
                                        </c:otherwise>
                                    </c:choose>
                                </p>
                            </div>

                            <!-- Add to Cart Form -->
                            <c:if test="${selectedVariant.quantity > 0}">
                                <form action="cart" method="post">
                                    <input type="hidden" name="action" value="add">
                                    <input type="hidden" name="variantId" value="${selectedVariant.variantID}">

                                    <div style="margin: 20px 0;">
                                        <label for="quantity" style="font-weight: bold;">Số lượng:</label>
                                        <input type="number" id="quantity" name="quantity" value="1" 
                                               min="1" max="${selectedVariant.quantity}" 
                                               style="width: 80px; margin-left: 10px; padding: 5px; border: 1px solid #ddd; border-radius: 5px;">
                                    </div>

                                    <button type="submit" class="add-to-cart-btn">
                                        <i class="fas fa-shopping-cart"></i> THÊM VÀO GIỎ HÀNG
                                    </button>
                                </form>
                            </c:if>

                            <!-- Other Variants Link -->
                            <div style="margin-top: 30px; text-align: center;">
                                <a href="products?action=detail&id=${product.productID}" 
                                   style="color: #007bff; text-decoration: none; font-weight: bold;">
                                    <i class="fas fa-list"></i> Xem tất cả phiên bản khác
                                </a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
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
