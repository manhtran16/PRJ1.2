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

            /* Custom CSS for horizontal menu items */
            .single-mega.cn-col-4 li:not(.title) {
                display: inline-block;
                margin-right: 20px;
                margin-bottom: 5px;
                white-space: nowrap;
            }

            .single-mega.cn-col-4 li.title {
                display: block;
                margin-bottom: 15px;
                font-weight: bold;
                width: 100%;
            }

            .single-mega.cn-col-4 {
                width: 100% !important;
                flex-wrap: wrap;
            }

            .single-mega.cn-col-4 li:not(.title) a {
                padding: 5px 10px;
                background-color: #f8f9fa;
                border-radius: 15px;
                text-decoration: none;
                color: #333;
                font-size: 13px;
                transition: all 0.3s ease;
            }

            .single-mega.cn-col-4 li:not(.title) a:hover {
                background-color: #007bff;
                color: white;
            }

            /* Adjust megamenu image size */
            .single-mega.cn-col-4 img {
                width: 200px !important;
                height: 150px !important;
                object-fit: cover;
                border-radius: 8px;
            }

            .megamenu .single-mega.cn-col-4:last-child {
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 20px;
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
                                        <li class="title">Danh mục sản phẩm</li>
                                        <c:forEach var="type" items="${types}">
                                            <li><a href="products?typeId=${type.typeID}">${type.typeName}</a></li>
                                        </c:forEach>
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
                <a href="../products" class="btn btn-primary">Tiếp tục mua sắm</a>
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
<< HEAD
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
