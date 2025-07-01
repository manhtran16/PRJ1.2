<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Thanh toán - Clothes store</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" />
    <link rel="stylesheet" href="css/mdb.min.css" />
</head>
<body>
    <header>
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg bg-body">
    <div class="container-fluid">
      <button
        data-mdb-collapse-init
        class="navbar-toggler"
        type="button"
        data-mdb-target="#navbarExample01"
        aria-controls="navbarExample01"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarExample01">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item active">
            <a class="nav-link" aria-current="page" href="#">Trang chủ</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Trang phục nam</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Trang phục nữ</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Trang phục trẻ em</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Phụ kiện</a>
          </li>
        </ul>
        <ul class="navbar-nav d-flex flex-row">
      <!-- Icons -->
      <li class="nav-item me-3 me-lg-0">
        <a class="nav-link" href="#">
          <span class="badge badge-pill bg-danger">1</span>
          <span><i class="fas fa-shopping-cart"></i></span>
        </a>
      </li>
      <li class="nav-item me-3 me-lg-0">
        <a class="nav-link" href="#">
          <i class="fab fa-twitter"></i>
        </a>
      </li>
      <!-- Icon dropdown -->
      <li class="nav-item me-3 me-lg-0 dropdown">
        <a
          data-mdb-dropdown-init
          class="nav-link dropdown-toggle"
          href="#"
          id="navbarDropdown"
          role="button"
          aria-expanded="false"
        >
          <i class="fas fa-user"></i>
        </a>
        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
          <li>
            <a class="dropdown-item" href="#">Action</a>
          </li>
          <li>
            <a class="dropdown-item" href="#">Another action</a>
          </li>
          <li><hr class="dropdown-divider" /></li>
          <li>
            <a class="dropdown-item" href="#">Something else here</a>
          </li>
        </ul>
      </li>
    </ul>
      </div>
    </div>
  </nav>
  <!-- Navbar -->
   
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



    <footer class="text-center bg-body-tertiary">
  <!-- Grid container -->
  <div class="container pt-4">
    <!-- Section: Social media -->
    <section class="mb-4">
      <!-- Facebook -->
      <a
        data-mdb-ripple-init
        class="btn btn-link btn-floating btn-lg text-body m-1"
        href="#!"
        role="button"
        data-mdb-ripple-color="dark"
        ><i class="fab fa-facebook-f"></i
      ></a>

      <!-- Twitter -->
      <a
        data-mdb-ripple-init
        class="btn btn-link btn-floating btn-lg text-body m-1"
        href="#!"
        role="button"
        data-mdb-ripple-color="dark"
        ><i class="fab fa-twitter"></i
      ></a>

      <!-- Google -->
      <a
        data-mdb-ripple-init
        class="btn btn-link btn-floating btn-lg text-body m-1"
        href="#!"
        role="button"
        data-mdb-ripple-color="dark"
        ><i class="fab fa-google"></i
      ></a>

      <!-- Instagram -->
      <a
        data-mdb-ripple-init
        class="btn btn-link btn-floating btn-lg text-body m-1"
        href="#!"
        role="button"
        data-mdb-ripple-color="dark"
        ><i class="fab fa-instagram"></i
      ></a>

      <!-- Linkedin -->
      <a
        data-mdb-ripple-init
        class="btn btn-link btn-floating btn-lg text-body m-1"
        href="#!"
        role="button"
        data-mdb-ripple-color="dark"
        ><i class="fab fa-linkedin"></i
      ></a>
      <!-- Github -->
      <a
        data-mdb-ripple-init
        class="btn btn-link btn-floating btn-lg text-body m-1"
        href="#!"
        role="button"
        data-mdb-ripple-color="dark"
        ><i class="fab fa-github"></i
      ></a>
    </section>
    <!-- Section: Social media -->
  </div>
  <!-- Grid container -->

  <!-- Copyright -->
  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.05);">
    <a class="text-body" href="#">Clothestore.com</a>
  </div>
  <!-- Copyright -->
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>

