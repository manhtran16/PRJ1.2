<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>My Orders - Clothes Shop</title>
    <link href="css/mdb.min.css" rel="stylesheet" />
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
        <a class="navbar-brand text-white" href="index.jsp">
          <i class="fas fa-tshirt me-2"></i>Clothes Shop
        </a>
        <div class="navbar-nav ms-auto">
          <a class="nav-link text-white" href="index.jsp">
            <i class="fas fa-home me-1"></i>Home
          </a>
          <a class="nav-link text-white" href="products.jsp">
            <i class="fas fa-shopping-bag me-1"></i>Products
          </a>
          <a class="nav-link text-white active" href="userOrders">
            <i class="fas fa-receipt me-1"></i>My Orders
          </a>
        </div>
      </div>
    </nav>

    <div class="container mt-4">
      <div class="row">
        <div class="col-12">
          <div class="d-flex justify-content-between align-items-center mb-4">
            <h2><i class="fas fa-receipt me-2"></i>My Orders</h2>
            <a href="index.jsp" class="btn btn-outline-primary">
              <i class="fas fa-arrow-left me-1"></i>Back to Home
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
                <a href="products.jsp" class="btn btn-primary">
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
                              <i class="fas fa-clock me-1"></i>Pending
                            </span>
                          </c:when>
                          <c:when test="${order.status == 1}">
                            <span class="status-badge status-completed">
                              <i class="fas fa-check me-1"></i>Completed
                            </span>
                          </c:when>
                          <c:otherwise>
                            <span class="status-badge">Unknown</span>
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
                          href="userOrders?action=viewDetails&orderId=${order.orderID}"
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

    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-3 mt-5">
      <div class="container">
        <p class="mb-0">&copy; 2025 Clothes Shop. All rights reserved.</p>
      </div>
    </footer>

    <!-- Scripts -->
    <script src="js/mdb.umd.min.js"></script>
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
