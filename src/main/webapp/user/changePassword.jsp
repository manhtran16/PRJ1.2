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
   <title>Đổi mật khẩu</title>

    <!-- Favicon  -->
    <link rel="icon" href="${pageContext.request.contextPath}/img/core-img/favicon.ico">

    <!-- Core Style CSS -->
<!--    <link href="../css/admin/mdb.min.css" rel="stylesheet">-->
    <link href="${pageContext.request.contextPath}/css/core-style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userhome.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/script.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
     <!-- ##### Header Area Start ##### -->
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
                                        <img src="${pageContext.request.contextPath}/img/bg-img/bg-6.jpg" alt="">
                                    </div>
                                </div>
                            </li>
                            <li><a href="#">Pages</a>
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
                    <a href="${pageContext.request.contextPath}/cart" id="essenceCartBtn"><img src="${pageContext.request.contextPath}/img/core-img/bag.svg" alt=""></a>
                </div>
            </div>

        </div>
    </header>
    <!-- ##### Header Area End ##### -->

    <div class="container">
        <div class="change-password-container">
            <h2 class="text-center mb-4">
                <i class="fas fa-key me-2"></i>Đổi mật khẩu
            </h2>

            <!-- Clear any cart-related messages -->
            <c:remove var="successMessage" scope="session" />
            <c:remove var="errorMessage" scope="session" />

            <!-- Display error message -->
            <c:if test="${not empty error}">
                <div class="alert alert-danger">${error}</div>
            </c:if>

            <!-- Display success message -->
            <c:if test="${not empty success}">
                <div class="alert alert-success">${success}</div>
            </c:if>

            <form method="post" action="${pageContext.request.contextPath}/changepassword">
                <!-- Current Password -->
                <div class="form-outline mb-3">
                    <input type="password" id="currentPassword" name="currentPassword" class="form-control" required>
                    <label class="form-label" for="currentPassword">
                        <i class="fas fa-lock me-1"></i>Mật khẩu hiện tại
                    </label>
                </div>

                <!-- New Password -->
                <div class="form-outline mb-3">
                    <input type="password" id="newPassword" name="newPassword" class="form-control" required>
                    <label class="form-label" for="newPassword">
                        <i class="fas fa-key me-1"></i>Mật khẩu mới
                    </label>
                    
                    <!-- Password Strength Indicator -->
                    <div class="mt-2">
                        <div class="progress" style="height: 4px;">
                            <div id="strengthBar" class="progress-bar" style="width: 0%;"></div>
                        </div>
                        <small id="strengthText" class="text-muted">Nhập mật khẩu</small>
                    </div>
                </div>

                <!-- Confirm New Password -->
                <div class="form-outline mb-4">
                    <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" required>
                    <label class="form-label" for="confirmPassword">
                        <i class="fas fa-check-circle me-1"></i>Xác nhận mật khẩu mới
                    </label>
                </div>

                <!-- Submit Button -->
                <div class="text-center">
                    <button type="submit" class="btn btn-primary btn-block">
                        <i class="fas fa-save me-1"></i>Đổi mật khẩu
                    </button>
                </div>

                <!-- Back to Profile Link -->
                <div class="text-center mt-3">
                    <a href="${pageContext.request.contextPath}/user/userProfile.jsp" class="btn btn-outline-secondary">
                        <i class="fas fa-arrow-left me-1"></i>Quay về trang cá nhân
                    </a>
                </div>
            </form>
        </div>
    </div>

    <!-- MDB JavaScript -->
    <script src="${pageContext.request.contextPath}/admin/js/mdb.umd.min.js"></script>
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
    <script src="${pageContext.request.contextPath}/js/changerPasswork.js"></script>
</body>
</html>