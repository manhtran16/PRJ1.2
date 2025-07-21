<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>My Orders - Clothes Shop</title>
    <link href="${pageContext.request.contextPath}/admin/css/mdb.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/core-style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userhome.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/script.css">
  </head>
  <body>
     <header class="header_area">
        <div class="classy-nav-container breakpoint-off d-flex align-items-center justify-content-between">
            <!-- Classy Menu -->
            <nav class="classy-navbar" id="essenceNav">
                <!-- Logo -->
                <a class="nav-brand" href="${pageContext.request.contextPath}/index"><img src="../img/core-img/logo.png" alt=""></a>
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
                    <a href="#"><img src="../img/core-img/user.svg" alt=""></a>
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
                    <a href="${pageContext.request.contextPath}/cart" id="essenceCartBtn"><img src="../img/core-img/bag.svg" alt=""> <span>0</span></a>
                </div>
            </div>

        </div>
    </header>

    <div class="container mt-4">
      <div class="row">
        <div class="col-12">
          <div class="d-flex justify-content-between align-items-center mb-4">
            <h2><i class="fas fa-receipt me-2"></i>Đơn hàng của tôi</h2>
            <a href="${pageContext.request.contextPath}/products" class="btn btn-outline-primary">
              <i class="fas fa-arrow-left me-1"></i>Tiếp tục mua sắm
            </a>
          </div>

          <!-- Error Message -->
          <c:if test="${not empty errorMessage}">
            <div
              class="alert alert-danger alert-dismissible fade show"
              role="alert"
            >
              <i class="fas fa-exclamation-triangle me-2"></i>${errorMessage}
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="alert"
              ></button>
            </div>
          </c:if>

          <!-- Orders List -->
          <c:choose>
            <c:when test="${empty orders}">
              <div class="empty-orders">
                <i class="fas fa-shopping-cart"></i>
                <h4>No Orders Found</h4>
                <p class="mb-4">You haven't placed any orders yet.</p>
                <a href="${pageContext.request.contextPath}/products" class="btn btn-primary">
                  <i class="fas fa-shopping-bag me-1"></i>Start Shopping
                </a>
              </div>
            </c:when>
            <c:otherwise>
              <c:forEach var="order" items="${orders}">
                <div class="order-card">
                  <div class="order-header">
                    <div class="row align-items-center">
                      <div class="col-md-3">
                        <strong>Order #${order.orderID}</strong>
                      </div>
                      <div class="col-md-3">
                        <i class="fas fa-calendar me-1"></i>
                        <fmt:formatDate
                          value="${order.orderDate}"
                          pattern="MMM dd, yyyy"
                        />
                      </div>
                      <div class="col-md-3">
                        <c:choose>
                          <c:when test="${order.status == 0}">
                            <span class="status-badge status-pending">
                              <i class="fas fa-shopping-cart me-1"></i>Giỏ hàng
                            </span>
                          </c:when>
                          <c:when test="${order.status == 1}">
                            <span class="status-badge status-completed">
                              <i class="fas fa-check me-1"></i>Đã thanh toán
                            </span>
                          </c:when>
                          <c:otherwise>
                            <span class="status-badge">Status ${order.status}</span>
                          </c:otherwise>
                        </c:choose>
                      </div>
                      <div class="col-md-3 text-end">
                        <strong class="text-primary">
                          <fmt:formatNumber
                            value="${requestScope['orderTotal_'.concat(order.orderID)]}"
                            pattern="#,###"
                          /> VNĐ
                        </strong>
                      </div>
                    </div>
                  </div>
                  <div class="order-body">
                    <div class="row align-items-center">
                      <div class="col-md-8">
                        <p class="mb-1 text-muted">
                          <i class="fas fa-user me-1"></i>
                          ${order.user.firstName} ${order.user.lastName}
                        </p>
                        <p class="mb-0 text-muted">
                          <i class="fas fa-envelope me-1"></i>
                          ${order.user.email}
                        </p>
                      </div>
                      <div class="col-md-4 text-end">
                        <a
                          href="${pageContext.request.contextPath}/userOrders?action=viewDetails&orderId=${order.orderID}"
                          class="btn btn-outline-primary btn-sm"
                        >
                          <i class="fas fa-eye me-1"></i>View Details
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
              </c:forEach>
            </c:otherwise>
          </c:choose>
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
    <script>
      // Initialize tooltips
      document.addEventListener("DOMContentLoaded", function () {
        var tooltipTriggerList = [].slice.call(
          document.querySelectorAll('[data-bs-toggle="tooltip"]')
        );
        var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
          return new bootstrap.Tooltip(tooltipTriggerEl);
        });
      });
    </script>
  </body>
</html>