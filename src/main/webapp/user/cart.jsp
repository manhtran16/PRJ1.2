<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Giỏ hàng</title>
        <link href="css/mdb.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #cc66ff;">
            <div class="container">
                <a class="navbar-brand text-white" href="products">
                    <i class="fas fa-tshirt me-2"></i>Cloth Store
                </a>
                <div class="navbar-nav ms-auto">
                    <a class="nav-link text-white" href="products">
                        <i class="fas fa-shopping-bag me-1"></i>Sản phẩm
                    </a>
                    <a class="nav-link text-white active" href="cart">
                        <i class="fas fa-shopping-cart me-1"></i>Giỏ hàng
                    </a>
                </div>
            </div>
        </nav>
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
                <a href="products" class="btn btn-primary">Tiếp tục mua sắm</a>
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

        <!-- MDB JavaScript -->
        <script src="js/mdb.umd.min.js"></script>
    </body>
</html>
