<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="icon" href="${pageContext.request.contextPath}/img/core-img/favicon.ico">

    <!-- Core Style CSS -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/core-style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userhome.css">
</head>
<body>
    <header class="header_area">
        <div class="classy-nav-container breakpoint-off d-flex align-items-center justify-content-between">
            <!-- Classy Menu -->
            <nav class="classy-navbar" id="essenceNav">
                <!-- Logo -->
                <a class="nav-brand" href="../index"><img src="../img/core-img/logo.png" alt=""></a>
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
                                <a href="../login.jsp">Đăng nhập</a>
                                <a href="../register.jsp">Đăng ký</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <!-- Cart Area -->
                <div class="cart-area">
                    <a href="${pageContext.request.contextPath}/cart" id="essenceCartBtn"><img src="${pageContext.request.contextPath}/img/core-img/bag.svg" alt=""> <span>0</span></a>
                </div>
            </div>

        </div>
    </header>

<main>
<div class="container py-5">
  <c:choose>
    <c:when test="${not empty order}">
      <!-- Order Confirmation -->
      <h2 class="text-center mb-5 text-success">
        <i class="fas fa-check-circle"></i> Đặt hàng thành công!
      </h2>
      
      <div class="row justify-content-center">
        <div class="col-lg-8">
          <div class="card">
            <div class="card-header bg-success text-white">
              <h5 class="mb-0">Thông tin đơn hàng #${order.orderID}</h5>
            </div>
            <div class="card-body">
              <p><strong>Ngày đặt:</strong> <fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy"/></p>
              <p><strong>Trạng thái:</strong> 
                <span class="badge bg-warning">Chờ xử lý</span>
              </p>
              
              <h6 class="mt-4">Chi tiết đơn hàng:</h6>
              <div class="table-responsive">
                <table class="table">
                  <thead>
                    <tr>
                      <th>Sản phẩm</th>
                      <th>Phiên bản</th>
                      <th>Số lượng</th>
                      <th>Đơn giá</th>
                      <th>Thành tiền</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:set var="total" value="0"/>
                    <c:forEach var="detail" items="${order.orderDetails}">
                      <tr>
                        <td>${detail.variant.product.productName}</td>
                        <td>
                          <c:forEach var="attr" items="${detail.variant.attributeValues}">
                            <small>${attr.attribute.attributeName}: ${attr.value}</small><br/>
                          </c:forEach>
                        </td>
                        <td>${detail.orderQuantity}</td>
                        <td><fmt:formatNumber value="${detail.variant.price}" pattern="#,###"/> VNĐ</td>
                        <td><fmt:formatNumber value="${detail.orderQuantity * detail.variant.price}" pattern="#,###"/> VNĐ</td>
                        <c:set var="total" value="${total + (detail.orderQuantity * detail.variant.price)}"/>
                      </tr>
                    </c:forEach>
                  </tbody>
                  <tfoot>
                    <tr class="table-success">
                      <td colspan="4" class="text-end"><strong>Tổng cộng:</strong></td>
                      <td><strong><fmt:formatNumber value="${total}" pattern="#,###"/> VNĐ</strong></td>
                    </tr>
                  </tfoot>
                </table>
              </div>
              
              <div class="text-center mt-4">
                <a href="products" class="btn btn-primary me-2">
                  <i class="fas fa-shopping-bag"></i> Tiếp tục mua sắm
                </a>
                <a href="userOrders" class="btn btn-outline-secondary">
                  <i class="fas fa-list"></i> Xem đơn hàng của tôi
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
      
    </c:when>
    <c:otherwise>
      <!-- Checkout Form -->
      <h2 class="text-center mb-5">Thanh toán đơn hàng</h2>
      
      <c:set var="cart" value="${sessionScope.cart}"/>
      <c:if test="${empty cart}">
        <div class="alert alert-warning text-center">
          <h5>Giỏ hàng trống!</h5>
          <a href="products" class="btn btn-primary">Tiếp tục mua sắm</a>
        </div>
      </c:if>
      
      <c:if test="${not empty cart}">
        <div class="row">
          <div class="col-lg-8">
            <div class="card">
              <div class="card-header">
                <h5>Thông tin giao hàng</h5>
              </div>
              <div class="card-body">
                <form action="userOrders" method="post">
                    <input type="hidden" name="action" value="processCheckout">
                  <div class="row">
                    <div class="col-md-6 mb-3">
                      <label for="fullName" class="form-label">Họ tên *</label>
                      <input type="text" class="form-control" id="fullName" name="fullName" required>
                    </div>
                    <div class="col-md-6 mb-3">
                      <label for="phone" class="form-label">Số điện thoại *</label>
                      <input type="tel" class="form-control" id="phone" name="phone" required>
                    </div>
                  </div>
                  <div class="mb-3">
                    <label for="address" class="form-label">Địa chỉ giao hàng *</label>
                    <textarea class="form-control" id="address" name="address" rows="3" required></textarea>
                  </div>
                  <div class="mb-3">
                    <label for="notes" class="form-label">Ghi chú</label>
                    <textarea class="form-control" id="notes" name="notes" rows="2"></textarea>
                  </div>
                  <button type="submit" class="btn btn-success">
                    <i class="fas fa-credit-card"></i> Đặt hàng
                  </button>
                </form>
              </div>
            </div>
          </div>
          
          <div class="col-lg-4">
            <div class="card">
              <div class="card-header">
                <h5>Đơn hàng của bạn</h5>
              </div>
              <div class="card-body">
                <c:set var="total" value="0"/>
                <c:forEach var="item" items="${cart}">
                  <div class="d-flex justify-content-between mb-2">
                    <div>
                      <small>${item.variant.product.productName}</small><br/>
                      <small class="text-muted">SL: ${item.quantity}</small>
                    </div>
                    <div>
                      <fmt:formatNumber value="${item.subtotal}" pattern="#,###"/> VNĐ
                    </div>
                  </div>
                  <c:set var="total" value="${total + item.subtotal}"/>
                </c:forEach>
                <hr>
                <div class="d-flex justify-content-between">
                  <strong>Tổng cộng:</strong>
                  <strong><fmt:formatNumber value="${total}" pattern="#,###"/> VNĐ</strong>
                </div>
              </div>
            </div>
          </div>
        </div>
      </c:if>
      
    </c:otherwise>
  </c:choose>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>

