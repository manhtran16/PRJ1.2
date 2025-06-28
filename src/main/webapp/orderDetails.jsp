<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Chi tiết đơn hàng #${order.orderID} - Clothes Shop</title>
    <link href="css/mdb.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .order-detail-card {
            border: 1px solid #dee2e6;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .order-header {
            background-color: #f8f9fa;
            padding: 20px;
            border-bottom: 1px solid #dee2e6;
            border-radius: 8px 8px 0 0;
        }
        .product-item {
            border-bottom: 1px solid #f0f0f0;
            padding: 15px 0;
        }
        .product-item:last-child {
            border-bottom: none;
        }
        .status-badge {
            font-size: 0.875rem;
            padding: 0.5rem 1rem;
            border-radius: 50rem;
        }
        .status-pending { background-color: #fff3cd; color: #856404; }
        .status-processing { background-color: #cce5ff; color: #004085; }
        .status-shipped { background-color: #e2e3e5; color: #383d41; }
        .status-delivered { background-color: #d4edda; color: #155724; }
        .status-cancelled { background-color: #f8d7da; color: #721c24; }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #cc66ff;">
        <div class="container">
            <a class="navbar-brand text-white" href="products">
                <i class="fas fa-tshirt me-2"></i>Clothes Store
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link text-white" href="products">
                    <i class="fas fa-shopping-bag me-1"></i>Sản phẩm
                </a>
                <a class="nav-link text-white active" href="userOrders">
                    <i class="fas fa-receipt me-1"></i>Đơn hàng của tôi
                </a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <!-- Back Button -->
        <div class="mb-3">
            <a href="userOrders" class="btn btn-outline-secondary">
                <i class="fas fa-arrow-left me-1"></i>Quay lại danh sách đơn hàng
            </a>
        </div>

        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger" role="alert">
                <i class="fas fa-exclamation-triangle me-2"></i>${errorMessage}
            </div>
        </c:if>

        <c:if test="${not empty order}">
            <!-- Order Header -->
            <div class="order-detail-card">
                <div class="order-header">
                    <div class="row">
                        <div class="col-md-6">
                            <h3>Đơn hàng #${order.orderID}</h3>
                            <p class="mb-1">
                                <i class="fas fa-calendar me-2"></i>
                                Ngày đặt: <fmt:formatDate value="${order.orderDate}" pattern="dd/MM/yyyy"/>
                            </p>
                            <p class="mb-0">
                                <i class="fas fa-user me-2"></i>
                                Khách hàng: ${order.user.firstName} ${order.user.lastName}
                            </p>
                        </div>
                        <div class="col-md-6 text-end">
                            <c:choose>
                                <c:when test="${order.status == 1}">
                                    <span class="status-badge status-pending">
                                        <i class="fas fa-clock me-1"></i>Chờ xử lý
                                    </span>
                                </c:when>
                                <c:when test="${order.status == 2}">
                                    <span class="status-badge status-processing">
                                        <i class="fas fa-cog me-1"></i>Đang xử lý
                                    </span>
                                </c:when>
                                <c:when test="${order.status == 3}">
                                    <span class="status-badge status-shipped">
                                        <i class="fas fa-shipping-fast me-1"></i>Đã giao vận
                                    </span>
                                </c:when>
                                <c:when test="${order.status == 4}">
                                    <span class="status-badge status-delivered">
                                        <i class="fas fa-check me-1"></i>Đã giao hàng
                                    </span>
                                </c:when>
                                <c:when test="${order.status == 5}">
                                    <span class="status-badge status-cancelled">
                                        <i class="fas fa-times me-1"></i>Đã hủy
                                    </span>
                                </c:when>
                                <c:otherwise>
                                    <span class="status-badge">Không xác định</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>

                <!-- Order Items -->
                <div class="card-body">
                    <h5 class="mb-3">Chi tiết sản phẩm</h5>
                    
                    <c:if test="${empty orderDetails}">
                        <p class="text-muted">Không có chi tiết sản phẩm.</p>
                    </c:if>
                    
                    <c:if test="${not empty orderDetails}">
                        <c:forEach var="detail" items="${orderDetails}">
                            <div class="product-item">
                                <div class="row align-items-center">
                                    <div class="col-md-6">
                                        <h6 class="mb-1">${detail.variant.product.productName}</h6>
                                        <div class="text-muted">
                                            <c:forEach var="attr" items="${detail.variant.attributeValues}">
                                                <span class="badge bg-light text-dark me-1">
                                                    ${attr.attribute.attributeName}: ${attr.value}
                                                </span>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="col-md-2 text-center">
                                        <span class="fw-bold">SL: ${detail.orderQuantity}</span>
                                    </div>
                                    <div class="col-md-2 text-center">
                                        <span><fmt:formatNumber value="${detail.variant.price}" pattern="#,###"/> VNĐ</span>
                                    </div>
                                    <div class="col-md-2 text-end">
                                        <span class="fw-bold text-primary">
                                            <fmt:formatNumber value="${detail.orderQuantity * detail.variant.price}" pattern="#,###"/> VNĐ
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        
                        <!-- Order Total -->
                        <div class="row mt-3 pt-3 border-top">
                            <div class="col-md-8 offset-md-4">
                                <div class="d-flex justify-content-between">
                                    <span class="fs-5 fw-bold">Tổng cộng:</span>
                                    <span class="fs-5 fw-bold text-success">
                                        <fmt:formatNumber value="${orderTotal}" pattern="#,###"/> VNĐ
                                    </span>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </c:if>
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-3 mt-5">
        <div class="container">
            <p class="mb-0">&copy; 2025 Clothes Store. All rights reserved.</p>
        </div>
    </footer>

    <!-- Scripts -->
    <script src="js/mdb.umd.min.js"></script>
</body>
</html>
