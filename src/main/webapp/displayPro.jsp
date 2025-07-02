<%-- 
    Document   : displayPro
    Created on : Jun 3, 2025, 11:34:00 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>Essence - Fashion Ecommerce Template</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/userhome.css">
</head>

<body>
    <!-- ##### Header Area Start ##### -->
    <header class="header_area">
        <div class="classy-nav-container breakpoint-off d-flex align-items-center justify-content-between">
            <!-- Classy Menu -->
            <nav class="classy-navbar" id="essenceNav">
                <!-- Logo -->
                <a class="nav-brand" href="index.html"><img src="img/core-img/logo.png" alt=""></a>
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
                            <li><a href="#">Shop</a>
                                <div class="megamenu">
                                    <ul class="single-mega cn-col-4">
                                        <li class="title">Women's Collection</li>
                                        <li><a href="shop.html">Dresses</a></li>
                                        <li><a href="shop.html">Blouses &amp; Shirts</a></li>
                                        <li><a href="shop.html">T-shirts</a></li>
                                        <li><a href="shop.html">Rompers</a></li>
                                        <li><a href="shop.html">Bras &amp; Panties</a></li>
                                    </ul>
                                    <ul class="single-mega cn-col-4">
                                        <li class="title">Men's Collection</li>
                                        <li><a href="shop.html">T-Shirts</a></li>
                                        <li><a href="shop.html">Polo</a></li>
                                        <li><a href="shop.html">Shirts</a></li>
                                        <li><a href="shop.html">Jackets</a></li>
                                        <li><a href="shop.html">Trench</a></li>
                                    </ul>
                                    <ul class="single-mega cn-col-4">
                                        <li class="title">Kid's Collection</li>
                                        <li><a href="shop.html">Dresses</a></li>
                                        <li><a href="shop.html">Shirts</a></li>
                                        <li><a href="shop.html">T-shirts</a></li>
                                        <li><a href="shop.html">Jackets</a></li>
                                        <li><a href="shop.html">Trench</a></li>
                                    </ul>
                                    <div class="single-mega cn-col-4">
                                        <img src="img/bg-img/bg-6.jpg" alt="">
                                    </div>
                                </div>
                            </li>
                            <li><a href="#">Pages</a>
                                <ul class="dropdown">
                                    <li><a href="index.html">Home</a></li>
                                    <li><a href="shop.html">Shop</a></li>
                                    <li><a href="checkout.html">Checkout</a></li>
                                    <li><a href="contact.html">Contact</a></li>
                                </ul>
                            </li>
                            <li><a href="contact.html">Contact</a></li>
                        </ul>
                    </div>
                    <!-- Nav End -->
                </div>
            </nav>

            <!-- Header Meta Data -->
            <div class="header-meta d-flex clearfix justify-content-end">
                <!-- Search Area -->
                <div class="search-area">
                    <form action="#" method="post">
                        <input type="search" name="search" id="headerSearch" placeholder="Type for search">
                        <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                    </form>
                </div>
                <!-- Favourite Area -->
                <div class="favourite-area">
                    <a href="#"><img src="img/core-img/heart.svg" alt=""></a>
                </div>
                <!-- User Login Info -->
                <div class="user-login-info">
                    <a href="#"><img src="img/core-img/user.svg" alt=""></a>
                    <div class="user-content">
                        <a href="#">Register</a>
                        <a href="#">Log in</a>

                    </div>
                </div>
                <!-- Cart Area -->
                <div class="cart-area">
                    <a href="#" id="essenceCartBtn"><img src="img/core-img/bag.svg" alt=""> <span>3</span></a>
                </div>
            </div>

        </div>
    </header>
    <!-- ##### Header Area End ##### -->

    <!-- ##### Right Side Cart Area ##### -->
    <div class="right-side-cart-area">

        <!-- Cart Button -->
        <div class="cart-button">
            <a href="#" id="rightSideCart"><img src="img/core-img/bag.svg" alt=""> <span>3</span></a>
        </div>

        <div class="cart-content d-flex">

            <!-- Cart List Area -->
            <div class="cart-list">
                <!-- Single Cart Item -->
                <div class="single-cart-item">
                    <a href="#" class="product-image">
                        <img src="img/product-img/product-1.jpg" class="cart-thumb" alt="">
                        <!-- Cart Item Desc -->
                        <div class="cart-item-desc">
                            <span class="product-remove"><i class="fa fa-close" aria-hidden="true"></i></span>
                            <span class="badge">Mango</span>
                            <h6>Button Through Strap Mini Dress</h6>
                            <p class="size">Size: S</p>
                            <p class="color">Color: Red</p>
                            <p class="price">$45.00</p>
                        </div>
                    </a>
                </div>

                <!-- Single Cart Item -->
                <div class="single-cart-item">
                    <a href="#" class="product-image">
                        <img src="img/product-img/product-2.jpg" class="cart-thumb" alt="">
                        <!-- Cart Item Desc -->
                        <div class="cart-item-desc">
                            <span class="product-remove"><i class="fa fa-close" aria-hidden="true"></i></span>
                            <span class="badge">Mango</span>
                            <h6>Button Through Strap Mini Dress</h6>
                            <p class="size">Size: S</p>
                            <p class="color">Color: Red</p>
                            <p class="price">$45.00</p>
                        </div>
                    </a>
                </div>

                <!-- Single Cart Item -->
                <div class="single-cart-item">
                    <a href="#" class="product-image">
                        <img src="img/product-img/product-3.jpg" class="cart-thumb" alt="">
                        <!-- Cart Item Desc -->
                        <div class="cart-item-desc">
                            <span class="product-remove"><i class="fa fa-close" aria-hidden="true"></i></span>
                            <span class="badge">Mango</span>
                            <h6>Button Through Strap Mini Dress</h6>
                            <p class="size">Size: S</p>
                            <p class="color">Color: Red</p>
                            <p class="price">$45.00</p>
                        </div>
                    </a>
                </div>
            </div>

            <!-- Cart Summary -->
            <div class="cart-amount-summary">

                <h2>Summary</h2>
                <ul class="summary-table">
                    <li><span>subtotal:</span> <span>$274.00</span></li>
                    <li><span>delivery:</span> <span>Free</span></li>
                    <li><span>discount:</span> <span>-15%</span></li>
                    <li><span>total:</span> <span>$232.00</span></li>
                </ul>
                <div class="checkout-btn mt-100">
                    <a href="checkout.html" class="btn essence-btn">check out</a>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Right Side Cart End ##### -->

    <!-- ##### Single Product Details Area Start ##### -->
    <section class="single_product_details_area d-flex align-items-center">

        <!-- Single Product Thumb -->
        <div class="single_product_thumb clearfix">
            <div class="product_thumbnail_slides owl-carousel">
                <img src="img/product-img/product-big-1.jpg" alt="">
                <img src="img/product-img/product-big-2.jpg" alt="">
                <img src="img/product-img/product-big-3.jpg" alt="">
            </div>
        </div>

        <!-- Single Product Description -->
        <div class="single_product_desc clearfix">
            <span>mango</span>
            <a href="cart.html">
                <h2>One Shoulder Glitter Midi Dress</h2>
            </a>
            <p class="product-price"><span class="old-price">$65.00</span> $49.00</p>
            <p class="product-desc">Mauris viverra cursus ante laoreet eleifend. Donec vel fringilla ante. Aenean
                finibus velit id urna vehicula, nec maximus est sollicitudin.</p>

            <!-- Form -->
            <form class="cart-form clearfix" method="get">
                <!-- Select Box -->
                <div class="color-selection">
                    Color:
                    <button type="button" class="color-box" style="background-color: #f8e6d7;"
                        data-color="breige"></button>
                    <button type="button" class="color-box" style="background-color: #e9e9e9;"
                        data-color="graygray"></button>
                    <input type="hidden" name="color" id="selectedColor">
                </div>
                <div class="size-selection">
                    Size:
                    <button type="button" class="size-btn" data-size="M">M</button>
                    <button type="button" class="size-btn" data-size="L">L</button>
                    <button type="button" class="size-btn" data-size="XL">XL</button>
                    <input type="hidden" name="size" id="selectedSize">
                </div>

                <!-- Cart & Favourite Box -->
                <div class="cart-fav-box d-flex align-items-center">
                    <!-- Cart -->
                    <button type="submit" name="addtocart" value="5" class="btn essence-btn">Thêm vào giỏ hàng</button>
                    <!-- Favourite -->
                    <div class="product-favourite ml-4">
                        <a href="#" class="favme fa fa-heart"></a>
                    </div>
                </div>
            </form>
        </div>
    </section>
    
    <!-- ##### Single Product Details Area End ##### -->

    <!--Description,Detail,Reviews-->
    <div class="tab-container">
        <input type="radio" name="tabs" id="tab1" class="tab-input" checked>
        <input type="radio" name="tabs" id="tab2" class="tab-input">
        <input type="radio" name="tabs" id="tab3" class="tab-input">

        <!-- Tab navigation -->
        <ul class="tab-nav">
            <li>
                <label for="tab1" class="tab-label">Description</label>
            </li>
            <li>
                <label for="tab2" class="tab-label">Details</label>
            </li>
            <li>
                <label for="tab3" class="tab-label">Reviews</label>
            </li>
        </ul>

        <!-- Tab content container -->
        <div class="tab-content-container">
            <div id="content1" class="tab-content">
                <h2>Product Description</h2>
                <p>Introducing our premium product designed with cutting-edge technology and superior craftsmanship.
                    This item represents the perfect blend of form and function, engineered to exceed your
                    expectations.</p>
                <p>Featuring an ergonomic design and constructed from high-grade materials, our product offers
                    durability and comfort in one sleek package. The attention to detail is evident in every curve
                    and surface.</p>
            </div>
            <div id="content2" class="tab-content">
                <h2>Technical Details</h2>
                <ul>
                    <li><strong>Dimensions:</strong> 12.5 x 8.2 x 3.7 inches</li>
                    <li><strong>Weight:</strong> 2.4 lbs (1.1 kg)</li>
                    <li><strong>Materials:</strong> Aircraft-grade aluminum, tempered glass</li>
                    <li><strong>Color Options:</strong> Space Gray, Silver, Rose Gold, Midnight Blue</li>
                    <li><strong>Warranty:</strong> 3-year limited warranty</li>
                </ul>
            </div>

            <div id="content3" class="tab-content">
                <h2>Customer Feedback</h2>
                <div class="review">
                    <div class="reviewer-rating">
                        <h3>Alex Johnson</h3>
                        <div class="review-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o empty"></i>
                        </div>
                    </div>
                    <p>"Absolutely love this product! The quality is exceptional and it's even better than I
                        expected. Worth every penny!"</p>
                </div>
                <div class="review">
                    <div class="reviewer-rating">
                        <h3>Sarah Miller</h3>
                        <div class="review-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-o empty"></i>
                            <i class="fa fa-star-o empty"></i>
                        </div>
                    </div>
                    <p>"Great product overall, but I wish it came in more color options. The functionality is
                        top-notch though."</p>
                </div>
            </div>
        </div>
    </div>
    <!-- Related products -->
    <div class="related-product">
        <div class="row">
            <!-- Title -->
            <div class="col-md-12">
                <div class="section-title">
                    <h3 class="title">Gợi ý sản phẩm</h3>
                </div>
            </div>
            <!-- Single Product -->
            <div class="col-md-3 col-xs-6">
                <div class="single-product-wrapper">
                    <!-- Product Image -->
                    <div class="product-img">
                        <img src="img/product-img/product-1.jpg" alt="">
                        <!-- Hover Thumb -->
                        <img class="hover-img" src="img/product-img/product-2.jpg" alt="">
                        <!-- Favourite -->
                        <div class="product-favourite">
                            <a href="#" class="favme fa fa-heart"></a>
                        </div>
                    </div>

                    <!-- Product Description -->
                    <div class="product-description">
                        <span>topshop</span>
                        <a href="single-product-details.html">
                            <h6>Knot Front Mini Dress</h6>
                        </a>
                        <p class="product-price"><span class="old-price">$75.00</span> $55.00</p>

                        <!-- Hover Content -->
                        <div class="hover-content">
                            <!-- Add to Cart -->
                            <div class="add-to-cart-btn">
                                <a href="#" class="btn essence-btn">Add to Cart</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Product -->
            <div class="col-md-3 col-xs-6">
                <div class="single-product-wrapper">
                    <!-- Product Image -->
                    <div class="product-img">
                        <img src="img/product-img/product-2.jpg" alt="">
                        <!-- Hover Thumb -->
                        <img class="hover-img" src="img/product-img/product-3.jpg" alt="">

                        <!-- Favourite -->
                        <div class="product-favourite">
                            <a href="#" class="favme fa fa-heart"></a>
                        </div>
                    </div>

                    <!-- Product Description -->
                    <div class="product-description">
                        <span>topshop</span>
                        <a href="single-product-details.html">
                            <h6>Knot Front Mini Dress</h6>
                        </a>
                        <p class="product-price">$80.00</p>

                        <!-- Hover Content -->
                        <div class="hover-content">
                            <!-- Add to Cart -->
                            <div class="add-to-cart-btn">
                                <a href="#" class="btn essence-btn">Add to Cart</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Product -->
            <div class="col-md-3 col-xs-6">
                <div class="single-product-wrapper">
                    <!-- Product Image -->
                    <div class="product-img">
                        <img src="img/product-img/product-3.jpg" alt="">
                        <!-- Hover Thumb -->
                        <img class="hover-img" src="img/product-img/product-4.jpg" alt="">

                        <!-- Favourite -->
                        <div class="product-favourite">
                            <a href="#" class="favme fa fa-heart"></a>
                        </div>
                    </div>

                    <!-- Product Description -->
                    <div class="product-description">
                        <span>topshop</span>
                        <a href="single-product-details.html">
                            <h6>Knot Front Mini Dress</h6>
                        </a>
                        <p class="product-price">$80.00</p>

                        <!-- Hover Content -->
                        <div class="hover-content">
                            <!-- Add to Cart -->
                            <div class="add-to-cart-btn">
                                <a href="#" class="btn essence-btn">Add to Cart</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Product -->
            <div class="col-md-3 col-xs-6">
                <div class="single-product-wrapper">
                    <!-- Product Image -->
                    <div class="product-img">
                        <img src="img/product-img/product-4.jpg" alt="">
                        <!-- Hover Thumb -->
                        <img class="hover-img" src="img/product-img/product-5.jpg" alt="">

                        <!-- Favourite -->
                        <div class="product-favourite">
                            <a href="#" class="favme fa fa-heart"></a>
                        </div>
                    </div>

                    <!-- Product Description -->
                    <div class="product-description">
                        <span>topshop</span>
                        <a href="single-product-details.html">
                            <h6>Knot Front Mini Dress</h6>
                        </a>
                        <p class="product-price">$80.00</p>

                        <!-- Hover Content -->
                        <div class="hover-content">
                            <!-- Add to Cart -->
                            <div class="add-to-cart-btn">
                                <a href="#" class="btn essence-btn">Add to Cart</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Product -->
            <div class="col-md-3 col-xs-6">
                <div class="single-product-wrapper">
                    <!-- Product Image -->
                    <div class="product-img">
                        <img src="img/product-img/product-5.jpg" alt="">
                        <!-- Hover Thumb -->
                        <img class="hover-img" src="img/product-img/product-6.jpg" alt="">


                        <!-- Favourite -->
                        <div class="product-favourite">
                            <a href="#" class="favme fa fa-heart"></a>
                        </div>
                    </div>

                    <!-- Product Description -->
                    <div class="product-description">
                        <span>topshop</span>
                        <a href="single-product-details.html">
                            <h6>Knot Front Mini Dress</h6>
                        </a>
                        <p class="product-price"><span class="old-price">$75.00</span> $55.00</p>

                        <!-- Hover Content -->
                        <div class="hover-content">
                            <!-- Add to Cart -->
                            <div class="add-to-cart-btn">
                                <a href="#" class="btn essence-btn">Add to Cart</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Product -->
            <div class="col-md-3 col-xs-6">
                <div class="single-product-wrapper">
                    <!-- Product Image -->
                    <div class="product-img">
                        <img src="img/product-img/product-6.jpg" alt="">
                        <!-- Hover Thumb -->
                        <img class="hover-img" src="img/product-img/product-7.jpg" alt="">

                        <!-- Favourite -->
                        <div class="product-favourite">
                            <a href="#" class="favme fa fa-heart"></a>
                        </div>
                    </div>

                    <!-- Product Description -->
                    <div class="product-description">
                        <span>topshop</span>
                        <a href="single-product-details.html">
                            <h6>Knot Front Mini Dress</h6>
                        </a>
                        <p class="product-price">$80.00</p>

                        <!-- Hover Content -->
                        <div class="hover-content">
                            <!-- Add to Cart -->
                            <div class="add-to-cart-btn">
                                <a href="#" class="btn essence-btn">Add to Cart</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Product -->
            <div class="col-md-3 col-xs-6">
                <div class="single-product-wrapper">
                    <!-- Product Image -->
                    <div class="product-img">
                        <img src="img/product-img/product-7.jpg" alt="">
                        <!-- Hover Thumb -->
                        <img class="hover-img" src="img/product-img/product-8.jpg" alt="">

                        <!-- Product Badge -->
                        <div class="product-badge new-badge">
                            <span>New</span>
                        </div>

                        <!-- Favourite -->
                        <div class="product-favourite">
                            <a href="#" class="favme fa fa-heart"></a>
                        </div>
                    </div>

                    <!-- Product Description -->
                    <div class="product-description">
                        <span>topshop</span>
                        <a href="single-product-details.html">
                            <h6>Knot Front Mini Dress</h6>
                        </a>
                        <p class="product-price">$80.00</p>

                        <!-- Hover Content -->
                        <div class="hover-content">
                            <!-- Add to Cart -->
                            <div class="add-to-cart-btn">
                                <a href="#" class="btn essence-btn">Add to Cart</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Product -->
            <div class="col-md-3 col-xs-6">
                <div class="single-product-wrapper">
                    <!-- Product Image -->
                    <div class="product-img">
                        <img src="img/product-img/product-8.jpg" alt="">
                        <!-- Hover Thumb -->
                        <img class="hover-img" src="img/product-img/product-9.jpg" alt="">

                        <!-- Favourite -->
                        <div class="product-favourite">
                            <a href="#" class="favme fa fa-heart"></a>
                        </div>
                    </div>

                    <!-- Product Description -->
                    <div class="product-description">
                        <span>topshop</span>
                        <a href="single-product-details.html">
                            <h6>Knot Front Mini Dress</h6>
                        </a>
                        <p class="product-price">$80.00</p>

                        <!-- Hover Content -->
                        <div class="hover-content">
                            <!-- Add to Cart -->
                            <div class="add-to-cart-btn">
                                <a href="#" class="btn essence-btn">Add to Cart</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
</div>
    <!-- ##### Footer Area Start ##### -->
    <footer class="footer_area clearfix">
        <div class="container">
            <div class="row">
                <!-- Single Widget Area -->
                <div class="col-12 col-md-6">
                    <div class="single_widget_area d-flex mb-30">
                        <!-- Logo -->
                        <div class="footer-logo mr-50">
                            <a href="#"><img src="img/core-img/logo2.png" alt=""></a>
                        </div>
                        <!-- Footer Menu -->
                        <div class="footer_menu">
                            <ul>
                                <li><a href="shop.html">Shop</a></li>
                                <li><a href="blog.html">Blog</a></li>
                                <li><a href="contact.html">Contact</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- Single Widget Area -->
                <div class="col-12 col-md-6">
                    <div class="single_widget_area mb-30">
                        <ul class="footer_widget_menu">
                            <li><a href="#">Order Status</a></li>
                            <li><a href="#">Payment Options</a></li>
                            <li><a href="#">Shipping and Delivery</a></li>
                            <li><a href="#">Guides</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Terms of Use</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="row align-items-end">
                <!-- Single Widget Area -->
                <div class="col-12 col-md-6">
                    <div class="single_widget_area">
                        <div class="footer_heading mb-30">
                            <h6>Subscribe</h6>
                        </div>
                        <div class="subscribtion_form">
                            <form action="#" method="post">
                                <input type="email" name="mail" class="mail" placeholder="Your email here">
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
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;
                        <script>document.write(new Date().getFullYear());</script> All rights reserved | Made with <i
                            class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com"
                            target="_blank">Colorlib</a>, distributed by <a href="https://themewagon.com/"
                            target="_blank">ThemeWagon</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </p>
                </div>
            </div>

        </div>
    </footer>
    <!-- ##### Footer Area End ##### -->

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="js/plugins.js"></script>
    <!-- Classy Nav js -->
    <script src="js/classy-nav.min.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>
    <!-- Script js -->
     <script src="js/script.js"></script>

</body>

</html>