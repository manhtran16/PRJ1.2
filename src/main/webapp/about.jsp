<%-- 
    Document   : about
    Created on : Jul 22, 2025, 2:45:29 AM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                                <li><a href="./products">Shop</a>
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
                                            <img src="${pageContext.request.contextPath}/img/bg-img/bg-6.jpg" alt="">
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <a href="#">Pages</a>
                                    <ul class="dropdown">
                                        <li><a href="${pageContext.request.contextPath}/index">Home</a></li>
                                        <li><a href="${pageContext.request.contextPath}/products">Shop</a></li>
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
                        <a href="#"><img src="${pageContext.request.contextPath}/img/core-img/user.svg" alt=""></a>
                        <div class="user-content">
                         
                            <c:choose>
                                <c:when test="${not empty sessionScope.user}">
                                    <a href="${pageContext.request.contextPath}/user/userProfile.jsp">Tài khoản</a>
                                    <a href="${pageContext.request.contextPath}/userOrders">Đơn hàng</a>
                                    <a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="./login.jsp">Đăng nhập</a>
                                    <a href="./register.jsp">Đăng ký</a>
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
        <!-- ##### Blog Wrapper Area Start ##### -->
        <div class="single-blog-wrapper">

            <!-- Single Blog Post Thumb -->
            <div class="single-blog-post-thumb">
                <img src="img/bg-img/bg-7.jpg" alt="">
            </div>

            <!-- Single Blog Content Wrap -->
            <div class="single-blog-content-wrapper d-flex">

                <!-- Blog Content -->
                <div class="single-blog--text">
                    <h2>Chào mừng bạn đến với <strong>Essence-Clothing shop</strong>! Chúng tôi không chỉ là một cửa hàng quần áo, mà còn là nơi bạn có thể tìm thấy nguồn cảm hứng cho phong cách cá nhân, thể hiện cá tính và sự tự tin của riêng mình qua từng bộ trang phục.</h2>
                    <p>Câu Chuyện Của Chúng Tôi</p>

                    <blockquote>
                        <h6><i class="fa fa-quote-left" aria-hidden="true"></i> Essence-Clothing shop được thành lập bởi những người có chung niềm đam mê mãnh liệt với thời trang. Chúng tôi bắt đầu từ một ý tưởng đơn giản: tạo ra một không gian mua sắm nơi mọi khách hàng đều có thể tìm thấy những sản phẩm chất lượng, hợp xu hướng với mức giá phải chăng. Từ những ngày đầu khởi nghiệp đầy thử thách, chúng tôi đã không ngừng nỗ lực để mang đến những bộ sưu tập độc đáo và dịch vụ khách hàng tận tâm nhất.</h6>
                    </blockquote>
            
                </div>
                

                <!-- Related Blog Post -->
                <div class="related-blog-post">
                    <!-- Single Related Blog Post -->
                    <div class="single-related-blog-post">
                        <img src="img/bg-img/rp1.jpg" alt="">
                        <a href="#">

                        </a>
                    </div>
                    <!-- Single Related Blog Post -->
                    <div class="single-related-blog-post">
                        <img src="img/bg-img/rp2.jpg" alt="">
                        <a href="#">

                        </a>
                    </div>
                    <!-- Single Related Blog Post -->
                    <div class="single-related-blog-post">
                        <img src="img/bg-img/rp3.jpg" alt="">
                        <a href="#">

                        </a>
                    </div>
                    <!-- Single Related Blog Post -->
                    <div class="single-related-blog-post">
                        <img src="img/bg-img/rp4.jpg" alt="">
                        <a href="#">

                        </a>
                    </div>
                </div>

            </div>
        </div>
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
    <!-- MDB JavaScript -->
    <script src="${pageContext.request.contextPath}/admin/js/mdb.umd.min.js"></script>
        
    </body>
</html>
