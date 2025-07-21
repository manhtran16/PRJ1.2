<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
<<<<<<< HEAD
        <title>Giỏ hàng</title>
        <link href="${pageContext.request.contextPath}/css/mdb.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
=======
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
>>>>>>> 59620543d8394f5b3d0f000d6b73fceff0075f13
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
<<<<<<< HEAD

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
=======
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
>>>>>>> 59620543d8394f5b3d0f000d6b73fceff0075f13
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
<<<<<<< HEAD
                <a href="${pageContext.request.contextPath}/products" class="btn btn-primary">Tiếp tục mua sắm</a>
=======
                <a href="../products" class="btn btn-primary">Tiếp tục mua sắm</a>
>>>>>>> 59620543d8394f5b3d0f000d6b73fceff0075f13
            </c:if>
            <c:if test="${not empty cartItems}">
                <table class="table cart-table">
                    <thead>
                        <tr>
<<<<<<< HEAD
                            <th>
                                <input type="checkbox" 
                                       id="selectAll" 
                                       class="select-all-checkbox" 
                                       title="Chọn tất cả">
                                <label for="selectAll" class="ms-1">Chọn tất cả</label>
                            </th>
=======
>>>>>>> 59620543d8394f5b3d0f000d6b73fceff0075f13
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
<<<<<<< HEAD
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
=======
                        <c:forEach var="item" items="${cartItems}">
                            <tr>
>>>>>>> 59620543d8394f5b3d0f000d6b73fceff0075f13
                                <td>${item.variant.product.productName}</td>
                                <td>
                                    <c:forEach var="attr" items="${item.variant.attributeValues}">
                                        <span class="badge bg-primary text-white">${attr.attribute.attributeName}: ${attr.value}</span><br/>
                                    </c:forEach>
                                </td>
                                <td><fmt:formatNumber value="${item.variant.price}" pattern="#,###"/></td>
                                <td>
<<<<<<< HEAD
                                    <form action="${pageContext.request.contextPath}/cart" method="post" style="display: inline;" class="quantity-form">
=======
                                    <form action="cart" method="post" style="display: inline;" class="quantity-form">
>>>>>>> 59620543d8394f5b3d0f000d6b73fceff0075f13
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
<<<<<<< HEAD
                                    <form action="${pageContext.request.contextPath}/cart" method="get" style="display: inline;">
=======
                                    <form action="cart" method="get" style="display: inline;">
>>>>>>> 59620543d8394f5b3d0f000d6b73fceff0075f13
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
<<<<<<< HEAD
                            <td colspan="5" class="text-end font-weight-bold">Tổng tiền:</td>
=======
                            <td colspan="4" class="text-end font-weight-bold">Tổng tiền:</td>
>>>>>>> 59620543d8394f5b3d0f000d6b73fceff0075f13
                            <td colspan="2" class="font-weight-bold">
                                <fmt:formatNumber value="${total}" pattern="#,###"/> VNĐ
                            </td>
                        </tr>
                    </tfoot>
                </table>
<<<<<<< HEAD

                <!-- Simple selected items display -->
                <div class="alert alert-info" id="selectedInfo" style="display: none;">
                    <i class="fas fa-info-circle me-2"></i>
                    Đã chọn <strong><span id="selectedCount2">0</span></strong> sản phẩm để thanh toán.
                </div>
                <div class="mt-3">
                    <a href="${pageContext.request.contextPath}/products" class="btn btn-secondary">
=======
                <div class="mt-3">
                    <a href="products" class="btn btn-secondary">
>>>>>>> 59620543d8394f5b3d0f000d6b73fceff0075f13
                        <i class="fas fa-arrow-left"></i> Tiếp tục mua sắm
                    </a>

                    <!-- Form method for clearing cart -->
<<<<<<< HEAD
                    <form action="${pageContext.request.contextPath}/cart" method="get" style="display: inline;">
=======
                    <form action="cart" method="get" style="display: inline;">
>>>>>>> 59620543d8394f5b3d0f000d6b73fceff0075f13
                        <input type="hidden" name="action" value="clear">
                        <button type="submit" 
                                class="btn btn-warning"
                                onclick="return confirm('Bạn có chắc chắn muốn xóa TẤT CẢ sản phẩm trong giỏ hàng?')">
                            <i class="fas fa-trash-alt"></i> Xóa tất cả
                        </button>
                    </form>

<<<<<<< HEAD
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
=======
                    <a href="userOrders?action=checkout" class="btn btn-success">
                        <i class="fas fa-credit-card"></i> Thanh toán
                    </a>
>>>>>>> 59620543d8394f5b3d0f000d6b73fceff0075f13
                </div>
            </c:if>
        </div>

<<<<<<< HEAD
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
    </body>
</html>
>>>>>>> 59620543d8394f5b3d0f000d6b73fceff0075f13
