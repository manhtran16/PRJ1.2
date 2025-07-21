<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>My Orders - Clothes Shop</title>
<<<<<<< HEAD
    <link href="${pageContext.request.contextPath}/css/mdb.min.css" rel="stylesheet" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
    />
    <style>
      .order-card {
        border: 1px solid #dee2e6;
        border-radius: 8px;
        margin-bottom: 20px;
        transition: box-shadow 0.3s ease;
      }
      .order-card:hover {
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      }
      .order-header {
        background-color: #f8f9fa;
        padding: 15px;
        border-bottom: 1px solid #dee2e6;
        border-radius: 8px 8px 0 0;
      }
      .order-body {
        padding: 15px;
      }
      .status-badge {
        font-size: 0.875rem;
        padding: 0.375rem 0.75rem;
        border-radius: 50rem;
      }
      .status-pending {
        background-color: #fff3cd;
        color: #856404;
        border: 1px solid #ffeaa7;
      }
      .status-completed {
        background-color: #d4edda;
        color: #155724;
        border: 1px solid #c3e6cb;
      }
      .status-shipped {
        background-color: #cce5ff;
        color: #004085;
        border: 1px solid #b3d9ff;
      }
      .status-delivered {
        background-color: #e2e3e5;
        color: #495057;
        border: 1px solid #ced4da;
      }
      .empty-orders {
        text-align: center;
        padding: 60px 20px;
        color: #6c757d;
      }
      .empty-orders i {
        font-size: 4rem;
        margin-bottom: 20px;
        color: #dee2e6;
      }
    </style>
  </head>
  <body>
    <!-- Navigation Bar -->
    <nav
      class="navbar navbar-expand-lg navbar-light"
      style="background-color: #cc66ff"
    >
      <div class="container">
        <a class="navbar-brand text-white" href="${pageContext.request.contextPath}/index">
          <i class="fas fa-tshirt me-2"></i>Clothes Shop
        </a>
        <div class="navbar-nav ms-auto">
          <a class="nav-link text-white" href="${pageContext.request.contextPath}/products">
            <i class="fas fa-shopping-bag me-1"></i>Sản phẩm
          </a>
          <a class="nav-link text-white active" href="${pageContext.request.contextPath}/userOrders">
            <i class="fas fa-receipt me-1"></i>Đơn hàng của tôi
          </a>
          <a class="nav-link text-white" href="${pageContext.request.contextPath}/cart">
            <i class="fas fa-shopping-cart me-1"></i>Giỏ hàng
          </a>
          <a class="nav-link text-white" href="${pageContext.request.contextPath}/userProfile">
            <i class="fas fa-user me-1"></i>Tài khoản
          </a>
        </div>
      </div>
    </nav>
=======
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
>>>>>>> 59620543d8394f5b3d0f000d6b73fceff0075f13

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

<<<<<<< HEAD
    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-3 mt-5">
      <div class="container">
        <p class="mb-0">&copy; 2025 Clothes Shop. All rights reserved.</p>
      </div>
    </footer>

    <!-- Scripts -->
    <script src="js/mdb.umd.min.js"></script>
=======
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
>>>>>>> 59620543d8394f5b3d0f000d6b73fceff0075f13
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