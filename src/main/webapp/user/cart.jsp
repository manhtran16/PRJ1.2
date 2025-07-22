<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


        <!-- Favicon  -->
        <link rel="icon" href="${pageContext.request.contextPath}/img/core-img/favicon.ico">
        <title>Giỏ hàng</title>
        <link href="${pageContext.request.contextPath}/admin/css/mdb.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/core-style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userhome.css">
        <style>
            .cart-table {
                width: 100%;
                margin-top: 20px;
            }
            .cart-table th, .cart-table td {
                padding: 12px;
                text-align: left;
            }
            .cart-actions button {
                margin: 0 5px;
            }

            /* Improve button styling */
            .btn-remove {
                transition: all 0.3s ease;
            }

            .btn-remove:hover {
                transform: scale(1.05);
            }

            /* Quantity input styling */
            .quantity-input {
                width: 70px;
                text-align: center;
                border: 1px solid #ddd;
                border-radius: 4px;
                padding: 5px;
            }

            /* Better responsive table */
            @media (max-width: 768px) {
                .cart-table {
                    font-size: 14px;
                }

                .cart-table th, .cart-table td {
                    padding: 8px 4px;
                }

                .btn-sm {
                    font-size: 12px;
                    padding: 4px 8px;
                }
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
                    <a href="${pageContext.request.contextPath}/cart" id="essenceCartBtn"><img src="${pageContext.request.contextPath}/img/core-img/bag.svg" alt=""> <span>0</span></a>
                </div>
            </div>

        </div>
    </header>
    <!-- ##### Header Area End ##### -->
        <div class="container mt-4">
            <h2>Giỏ hàng của bạn</h2>

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

            <c:if test="${empty cartItems}">
                <div class="alert alert-info">Giỏ hàng trống.</div>
                <a href="./products" class="btn btn-primary">Tiếp tục mua sắm</a>
            </c:if>
            <c:if test="${not empty cartItems}">
                <table class="table cart-table">
                    <thead>
                        <tr>
                            <th>Sản phẩm</th>
                            <th>Phiên bản</th>
                            <th>Giá (VNĐ)</th>
                            <th>Số lượng</th>
                            <th>Thành tiền</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="total" value="0"/>
                        <c:forEach var="item" items="${cartItems}">
                            <tr>
                                <td>${item.variant.product.productName}</td>
                                <td>
                                    <c:forEach var="attr" items="${item.variant.attributeValues}">
                                        <span class="badge bg-primary text-white">${attr.attribute.attributeName}: ${attr.value}</span><br/>
                                    </c:forEach>
                                </td>
                                <td><fmt:formatNumber value="${item.variant.price}" pattern="#,###"/></td>
                                <td>
                                    <form action="cart" method="post" style="display: inline;" class="quantity-form">
                                        <input type="hidden" name="action" value="update"/>
                                        <input type="hidden" name="variantId" value="${item.variant.variantID}"/>
                                        <input type="number" 
                                               name="quantity" 
                                               value="${item.orderQuantity}" 
                                               min="1" 
                                               max="${item.variant.quantity}" 
                                               class="quantity-input" 
                                               title="Số lượng tối đa: ${item.variant.quantity}"/>
                                        <button type="submit" class="btn btn-sm btn-outline-primary ms-1">Cập nhật</button>
                                    </form>
                                </td>
                                <td><fmt:formatNumber value="${item.variant.price * item.orderQuantity}" pattern="#,###"/></td>
                                <td>
                                    <!-- Form method for removing item -->
                                    <form action="cart" method="get" style="display: inline;">
                                        <input type="hidden" name="action" value="remove">
                                        <input type="hidden" name="variantId" value="${item.variant.variantID}">
                                        <button type="submit" 
                                                class="btn btn-sm btn-danger btn-remove" 
                                                onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này khỏi giỏ hàng?')"
                                                title="Xóa sản phẩm">
                                            <i class="fas fa-trash"></i> Xóa
                                        </button>
                                    </form>
                                </td>
                            </tr>
                            <c:set var="total" value="${total + (item.variant.price * item.orderQuantity)}"/>
                        </c:forEach>
                    </tbody>
                    <tfoot>
                        <tr class="table-success">
                            <td colspan="4" class="text-end font-weight-bold">Tổng tiền:</td>
                            <td colspan="2" class="font-weight-bold">
                                <fmt:formatNumber value="${total}" pattern="#,###"/> VNĐ
                            </td>
                        </tr>
                    </tfoot>
                </table>
                <div class="mt-3">
                    <a href="products" class="btn btn-secondary">
                        <i class="fas fa-arrow-left"></i> Tiếp tục mua sắm
                    </a>

                    <!-- Form method for clearing cart -->
                    <form action="cart" method="get" style="display: inline;">
                        <input type="hidden" name="action" value="clear">
                        <button type="submit" 
                                class="btn btn-warning"
                                onclick="return confirm('Bạn có chắc chắn muốn xóa TẤT CẢ sản phẩm trong giỏ hàng?')">
                            <i class="fas fa-trash-alt"></i> Xóa tất cả
                        </button>
                    </form>

                    <a href="userOrders?action=checkout" class="btn btn-success">
                        <i class="fas fa-credit-card"></i> Thanh toán
                    </a>
                </div>
            </c:if>
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
