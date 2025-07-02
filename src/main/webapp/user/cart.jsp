<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Giỏ hàng</title>
        <link href="${pageContext.request.contextPath}/css/mdb.min.css" rel="stylesheet">
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

            /* Checkbox styling */
            .product-checkbox {
                transform: scale(1.2);
                margin-right: 10px;
            }

            .select-all-checkbox {
                transform: scale(1.3);
            }

            /* Selected row highlighting */
            .selected-row {
                background-color: #f8f9fa;
            }

            /* Checkout summary */
            .checkout-summary {
                background-color: #e8f5e9;
                border: 1px solid #4caf50;
                border-radius: 8px;
                padding: 15px;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #cc66ff;">
            <div class="container">
                <a class="navbar-brand text-white" href="${pageContext.request.contextPath}/products">
                    <i class="fas fa-tshirt me-2"></i>Cloth Store
                </a>
                <div class="navbar-nav ms-auto">
                    <a class="nav-link text-white" href="${pageContext.request.contextPath}/products">
                        <i class="fas fa-shopping-bag me-1"></i>Sản phẩm
                    </a>
                    <a class="nav-link text-white active" href="${pageContext.request.contextPath}/cart">
                        <i class="fas fa-shopping-cart me-1"></i>Giỏ hàng
                    </a>
                    <a class="nav-link text-white" href="${pageContext.request.contextPath}/userOrders">
                        <i class="fas fa-receipt me-1"></i>Đơn hàng của tôi
                    </a>
                    <a class="nav-link text-white" href="${pageContext.request.contextPath}/userProfile">
                        <i class="fas fa-user me-1"></i>Tài khoản
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
                <a href="${pageContext.request.contextPath}/products" class="btn btn-primary">Tiếp tục mua sắm</a>
            </c:if>
            <c:if test="${not empty cartItems}">
                <table class="table cart-table">
                    <thead>
                        <tr>
                            <th>
                                <input type="checkbox" 
                                       id="selectAll" 
                                       class="select-all-checkbox" 
                                       title="Chọn tất cả">
                                <label for="selectAll" class="ms-1">Chọn tất cả</label>
                            </th>
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
                        <c:forEach var="item" items="${cartItems}" varStatus="status">
                            <tr class="cart-row" data-variant-id="${item.variant.variantID}">
                                <td>
                                    <input type="checkbox" 
                                           class="product-checkbox" 
                                           id="product_${item.variant.variantID}"
                                           data-variant-id="${item.variant.variantID}"
                                           data-price="${item.variant.price}"
                                           data-quantity="${item.orderQuantity}"
                                           data-product-name="${item.variant.product.productName}"
                                           value="${item.variant.variantID}">
                                </td>
                                <td>${item.variant.product.productName}</td>
                                <td>
                                    <c:forEach var="attr" items="${item.variant.attributeValues}">
                                        <span class="badge bg-primary text-white">${attr.attribute.attributeName}: ${attr.value}</span><br/>
                                    </c:forEach>
                                </td>
                                <td><fmt:formatNumber value="${item.variant.price}" pattern="#,###"/></td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/cart" method="post" style="display: inline;" class="quantity-form">
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
                                    <form action="${pageContext.request.contextPath}/cart" method="get" style="display: inline;">
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
                            <td colspan="5" class="text-end font-weight-bold">Tổng tiền:</td>
                            <td colspan="2" class="font-weight-bold">
                                <fmt:formatNumber value="${total}" pattern="#,###"/> VNĐ
                            </td>
                        </tr>
                    </tfoot>
                </table>

                <!-- Simple selected items display -->
                <div class="alert alert-info" id="selectedInfo" style="display: none;">
                    <i class="fas fa-info-circle me-2"></i>
                    Đã chọn <strong><span id="selectedCount2">0</span></strong> sản phẩm để thanh toán.
                </div>
                <div class="mt-3">
                    <a href="${pageContext.request.contextPath}/products" class="btn btn-secondary">
                        <i class="fas fa-arrow-left"></i> Tiếp tục mua sắm
                    </a>

                    <!-- Form method for clearing cart -->
                    <form action="${pageContext.request.contextPath}/cart" method="get" style="display: inline;">
                        <input type="hidden" name="action" value="clear">
                        <button type="submit" 
                                class="btn btn-warning"
                                onclick="return confirm('Bạn có chắc chắn muốn xóa TẤT CẢ sản phẩm trong giỏ hàng?')">
                            <i class="fas fa-trash-alt"></i> Xóa tất cả
                        </button>
                    </form>

                    <!-- Checkout Form with Selected Items -->
                    <form action="${pageContext.request.contextPath}/cart" method="post" style="display: inline;" id="checkoutForm">
                        <input type="hidden" name="action" value="checkoutSelected">
                        
                        <button type="submit" 
                                id="checkoutBtn"
                                class="btn btn-success"
                                onclick="return validateCheckout()"
                                disabled>
                            <i class="fas fa-credit-card"></i> Thanh toán (<span id="selectedCount">0</span> sản phẩm)
                        </button>
                    </form>
                </div>
            </c:if>
        </div>

        <!-- MDB JavaScript -->
        <script src="${pageContext.request.contextPath}/js/mdb.umd.min.js"></script>
        
        <script>
            // Simple JavaScript for checkbox functionality
            document.addEventListener('DOMContentLoaded', function() {
                const selectAllCheckbox = document.getElementById('selectAll');
                const productCheckboxes = document.querySelectorAll('.product-checkbox');
                const checkoutBtn = document.getElementById('checkoutBtn');
                const selectedCount = document.getElementById('selectedCount');
                const selectedInfo = document.getElementById('selectedInfo');
                const selectedCount2 = document.getElementById('selectedCount2');

                // Select All functionality
                if (selectAllCheckbox) {
                    selectAllCheckbox.addEventListener('change', function() {
                        productCheckboxes.forEach(checkbox => {
                            checkbox.checked = this.checked;
                            highlightRow(checkbox);
                        });
                        updateCheckoutButton();
                    });
                }

                // Individual checkbox functionality
                productCheckboxes.forEach(checkbox => {
                    checkbox.addEventListener('change', function() {
                        highlightRow(this);
                        updateSelectAll();
                        updateCheckoutButton();
                    });
                });

                function highlightRow(checkbox) {
                    const row = checkbox.closest('tr');
                    if (checkbox.checked) {
                        row.classList.add('selected-row');
                    } else {
                        row.classList.remove('selected-row');
                    }
                }

                function updateSelectAll() {
                    const checkedBoxes = document.querySelectorAll('.product-checkbox:checked');
                    selectAllCheckbox.checked = checkedBoxes.length === productCheckboxes.length;
                    selectAllCheckbox.indeterminate = checkedBoxes.length > 0 && checkedBoxes.length < productCheckboxes.length;
                }

                function updateCheckoutButton() {
                    const checkedBoxes = document.querySelectorAll('.product-checkbox:checked');
                    const count = checkedBoxes.length;
                    
                    if (count > 0) {
                        checkoutBtn.disabled = false;
                        selectedInfo.style.display = 'block';
                    } else {
                        checkoutBtn.disabled = true;
                        selectedInfo.style.display = 'none';
                    }
                    
                    selectedCount.textContent = count;
                    selectedCount2.textContent = count;
                }

                // Initial update
                updateCheckoutButton();
            });

            // Validate checkout - simple validation
            function validateCheckout() {
                const checkedBoxes = document.querySelectorAll('.product-checkbox:checked');
                
                if (checkedBoxes.length === 0) {
                    alert('Vui lòng chọn ít nhất một sản phẩm để thanh toán!');
                    return false;
                }

                // Add selected variant IDs to form before submit
                const form = document.getElementById('checkoutForm');
                
                // Remove old hidden inputs
                const oldInputs = form.querySelectorAll('input[name="selectedVariants"]');
                oldInputs.forEach(input => input.remove());

                // Add new hidden inputs for selected items
                checkedBoxes.forEach(checkbox => {
                    const input = document.createElement('input');
                    input.type = 'hidden';
                    input.name = 'selectedVariants';
                    input.value = checkbox.value;
                    form.appendChild(input);
                });

                return true;
            }
        </script>
    </body>
</html>