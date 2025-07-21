<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<%-- Check if user is logged in --%>
<c:if test="${empty sessionScope.user}">
    <c:redirect url="../login.jsp" />
</c:if>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Thông tin cá nhân</title>
    <link href="${pageContext.request.contextPath}/admin/css/mdb.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/core-style.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/userhome.css" rel="stylesheet" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
    />
    <style>
      .profile-container {
        max-width: 600px;
        margin: 50px auto;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        background-color: #ffffff;
      }
      .profile-info {
        margin-bottom: 20px;
      }
      .profile-info label {
        font-weight: bold;
        color: #555;
      }
      .profile-info p {
        margin-bottom: 15px;
        padding: 10px;
        background-color: #f8f9fa;
        border-radius: 5px;
        border-left: 4px solid #cc66ff;
      }
      .action-buttons {
        text-align: center;
        margin-top: 30px;
      }
      .action-buttons .btn {
        margin: 10px;
        min-width: 150px;
      }
      .alert {
        border-radius: 5px;
        padding: 10px;
        margin-bottom: 20px;
      }
      .alert-danger {
        background-color: #f8d7da;
        border: 1px solid #f5c6cb;
        color: #721c24;
      }
      .alert-success {
        background-color: #d4edda;
        border: 1px solid #c3e6cb;
        color: #155724;
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
                                        <img src="${pageContext.request.contextPath}/img/bg-img/bg-6.jpg" alt="">
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
                                <a href="${pageContext.request.contextPath}/userProfile">Tài khoản</a>
                                <a href="${pageContext.request.contextPath}/userOrders">Đơn hàng</a>
                                <a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
                            </c:when>
                            <c:otherwise>
                                <a href="../login.jsp">Đăng nhập</a>
                                <a href="../register.jsp">Đăng ký</a>
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

    <div class="container">
      <div class="profile-container">
        <h2 class="text-center mb-4">
          <i class="fas fa-user me-2"></i>Thông tin cá nhân
        </h2>

        <!-- Display error message -->
        <c:if test="${not empty errorMessage}">
          <div class="alert alert-danger">${errorMessage}</div>
        </c:if>

        <!-- Display success message -->
        <c:if test="${not empty successMessage}">
          <div class="alert alert-success">${successMessage}</div>
        </c:if>

        <!-- User Information -->
        <c:choose>
          <c:when test="${not empty sessionScope.user}">
            <div class="profile-info">
              <div class="row">
                <div class="col-md-6">
                  <label><i class="fas fa-user me-2"></i>Họ:</label>
                  <p>${sessionScope.user.firstName}</p>
                </div>
                <div class="col-md-6">
                  <label><i class="fas fa-user me-2"></i>Tên:</label>
                  <p>${sessionScope.user.lastName}</p>
                </div>
              </div>
              
              <div class="row">
                <div class="col-md-12">
                  <label><i class="fas fa-envelope me-2"></i>Email:</label>
                  <p>${sessionScope.user.email}</p>
                </div>
              </div>
              
              <div class="row">
                <div class="col-md-6">
                  <label><i class="fas fa-phone me-2"></i>Số điện thoại:</label>
                  <p>${not empty sessionScope.user.phoneNumber ? sessionScope.user.phoneNumber : 'Chưa cập nhật'}</p>
                </div>
                <div class="col-md-6">
                  <label><i class="fas fa-id-card me-2"></i>Tên đăng nhập:</label>
                  <p>${not empty sessionScope.user.userName ? sessionScope.user.userName : 'Chưa cập nhật'}</p>
                </div>
              </div>
              
              <div class="row">
                <div class="col-md-12">
                  <label><i class="fas fa-map-marker-alt me-2"></i>Địa chỉ:</label>
                  <p>${not empty sessionScope.user.address ? sessionScope.user.address : 'Chưa cập nhật'}</p>
                </div>
              </div>
            </div>
          </c:when>
          <c:otherwise>
            <div class="alert alert-warning">
              <i class="fas fa-exclamation-triangle me-2"></i>
              Không thể tải thông tin người dùng. Vui lòng <a href="../login.jsp">đăng nhập lại</a>.
            </div>
          </c:otherwise>
        </c:choose>

        <!-- Action Buttons -->
        <div class="action-buttons">
          <a href="${pageContext.request.contextPath}/changepassword" class="btn btn-warning">
            <i class="fas fa-key me-1"></i>Đổi mật khẩu
          </a>
          <a href="${pageContext.request.contextPath}/products" class="btn btn-outline-secondary">
            <i class="fas fa-arrow-left me-1"></i>Quay về trang chủ
          </a>
        </div>
      </div>
    </div>
    <!-- ##### New Arrivals Area End ##### -->

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
    <!-- MDB JavaScript -->
    <script src="${pageContext.request.contextPath}/admin/js/mdb.umd.min.js"></script>
  </body>
</html>