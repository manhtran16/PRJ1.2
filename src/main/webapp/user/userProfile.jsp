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
    <link href="${pageContext.request.contextPath}/css/mdb.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/core-style.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/style.css" rel="stylesheet" />
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
    <!-- Navigation Bar -->
    <nav
      class="navbar navbar-expand-lg navbar-light"
      style="background-color: #cc66ff"
    >
      <div class="container">
        <a class="navbar-brand text-white" href="${pageContext.request.contextPath}/products">
          <i class="fas fa-tshirt me-2"></i>Clothes Shop
        </a>
        <div class="navbar-nav ms-auto">
          <a class="nav-link text-white" href="${pageContext.request.contextPath}/products">
            <i class="fas fa-shopping-bag me-1"></i>Sản phẩm
          </a>
          <a class="nav-link text-white" href="${pageContext.request.contextPath}/userOrders">
            <i class="fas fa-receipt me-1"></i>Đơn hàng của tôi
          </a>
          <a class="nav-link text-white" href="${pageContext.request.contextPath}/cart">
            <i class="fas fa-shopping-cart me-1"></i>Giỏ hàng
          </a>
          <a class="nav-link text-white active" href="${pageContext.request.contextPath}/userProfile">
            <i class="fas fa-user me-1"></i>Tài khoản
          </a>
        </div>
      </div>
    </nav>

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

    <!-- MDB JavaScript -->
    <script src="${pageContext.request.contextPath}/js/mdb.umd.min.js"></script>
  </body>
</html>