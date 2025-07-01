<%-- 
    Document   : userCart
    Created on : Jun 28, 2025, 2:10:22 PM
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
    <title>Essence - Fashion Ecommerce Template</title>

    <link rel="icon" href="img/core-img/favicon.ico">

    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/userhome.css">
    <link rel="stylesheet" href="css/userCart.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
	<link href=" https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
</head>
<body>
    <header class="header_area">
        <div class="classy-nav-container breakpoint-off d-flex align-items-center justify-content-between">
            <nav class="classy-navbar" id="essenceNav">
                <a class="nav-brand" href="index.html"><img src="img/core-img/logo.png" alt=""></a>
                <div class="classy-navbar-toggler">
                    <span class="navbarToggler"><span></span><span></span><span></span></span>
                </div>
                <div class="classy-menu">
                    <div class="classycloseIcon">
                        <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                    </div>
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
                    </div>
            </nav>

            <div class="header-meta d-flex clearfix justify-content-end">
                <div class="search-area">
                    <form action="#" method="post">
                        <input type="search" name="search" id="headerSearch" placeholder="Type for search">
                        <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                    </form>
                </div>
                <div class="favourite-area">
                    <a href="#"><img src="img/core-img/heart.svg" alt=""></a>
                </div>
                <div class="user-login-info">
                    <a href="#"><img src="img/core-img/user.svg" alt=""></a>
                    <div class="user-content">
                        <a href="#">Register</a>
                        <a href="#">Log in</a>

                    </div>
                </div>
                <div class="cart-area">
                    <a href="#" id="essenceCartBtn"><img src="img/core-img/bag.svg" alt=""> <span>3</span></a>
                </div>
            </div>

        </div>
    </header>
    <div class="right-side-cart-area">

        <div class="cart-button">
            <a href="#" id="rightSideCart"><img src="img/core-img/bag.svg" alt=""> <span>3</span></a>
        </div>

        <div class="cart-content d-flex">

            <div class="cart-list">
                <div class="single-cart-item">
                    <a href="#" class="product-image">
                        <img src="img/product-img/product-1.jpg" class="cart-thumb" alt="">
                        <div class="cart-item-desc">
                            <span class="product-remove"><i class="fa fa-close" aria-hidden="true"></i></span>
                            <span class="badge">Mango</span>
                            <h6>Button Through Strap Mini Dress</h6>
                            <p class="size">Size: S</p>
                            <p class="text-gray-600"><label for="color-headphone">Color:</label> 
                            <select id="color-headphone" class="color-select" onchange="updateCartSummary()">
                                <option value="black" selected>Black</option>
                                <option value="white">White</option>
                                <option value="red">Red</option>
                            </select>
                        </p>

                            <p class="price">$45.00</p>
                        </div>
                    </a>
                </div>

                <div class="single-cart-item">
                    <a href="#" class="product-image">
                        <img src="img/product-img/product-2.jpg" class="cart-thumb" alt="">
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

                <div class="single-cart-item">
                    <a href="#" class="product-image">
                        <img src="img/product-img/product-3.jpg" class="cart-thumb" alt="">
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
   <div class="container px-4 py-5 mx-auto">
    <div class="row d-flex justify-content-center">
        <div class="col-4">
            <h4 class="heading">Giỏ hàng</h4>
        </div>
        <div class="col-8">
            <div class="row text-right" style="padding-top:30px">
                <div class="col-2">
                    <h6 class="mt-2">Kích thước</h6>
                </div>
                <div class="col-2">
                    <h6 class="mt-2">Màu sắc</h6>
                </div>
                <div class="col-3">
                    <h6 class="mt-2">Số lượng</h6>
                </div>
                <div class="col-3">
                    <h6 class="mt-2">Giá</h6>
                </div>
                <div class="col-2">
                    
                </div>
            </div>
        </div>
    </div>

    <div class="row d-flex justify-content-center border-top">
        <div class="col-4">
            <div class="row d-flex">
                <div class="book">
                    <img src="img/product-img/product-big-1.jpg" class="book-img">
                </div>
                <div class="my-auto flex-column d-flex pad-left">
                    <h6 class="mob-text">Thinking, Fast and Slow</h6>
                    <p class="mob-text">Daniel Kahneman</p>
                </div>
            </div>
        </div>
        <div class="my-auto col-8">
            <div class="row text-right">
                <div class="col-2">
                    <p class="text-gray-600">
                            <select id="size-headphone" class="size-select" onchange="updateCartSummary()">
                                <option value="one-size" selected>One Size</option>
                            </select>
                        </p>

                </div>
                <div class="col-2">
                   <p class="text-gray-600">
                            <select id="color-headphone" class="color-select" onchange="updateCartSummary()">
                                <option value="black" selected>Black</option>
                                <option value="white">White</option>
                                <option value="red">Red</option>
                            </select>
                        </p>
                </div>
                <div class="col-3">
                    <div class="flex items-center">
                                <button class="text-gray-500 px-2 py-1 border rounded" onclick="updateQuantity(this, -1)">-</button>
                                <span class="mx-2">1</span>
                                <button class="text-gray-500 px-2 py-1 border rounded" onclick="updateQuantity(this, 1)">+</button>
                            </div>

                </div>
                <div class="col-3">
                    <h6 class="mob-text">$9.99</h6>
                </div>
                <div class="col-2">
                    <button class="product-remove text-xl" onclick="removeCartItem(this)">✕</button>
                </div>
            </div>
        </div>
    </div>

    <div class="row d-flex justify-content-center border-top">
        <div class="col-4">
            <div class="row d-flex">
                <div class="book">
                    <img src="img/product-img/product-big-1.jpg" class="book-img">
                </div>
                <div class="my-auto flex-column d-flex pad-left">
                    <h6 class="mob-text">Thinking, Fast and Slow</h6>
                    <p class="mob-text">Daniel Kahneman</p>
                </div>
            </div>
        </div>
        <div class="my-auto col-8">
            <div class="row text-right">
                <div class="col-2">
                    <p class="text-gray-600">
                            <select id="size-headphone" class="size-select" onchange="updateCartSummary()">
                                <option value="one-size" selected>One Size</option>
                            </select>
                        </p>

                </div>
                <div class="col-2">
                   <p class="text-gray-600">
                            <select id="color-headphone" class="color-select" onchange="updateCartSummary()">
                                <option value="black" selected>Black</option>
                                <option value="white">White</option>
                                <option value="red">Red</option>
                            </select>
                        </p>
                </div>
                <div class="col-3">
                    <div class="flex items-center">
                                <button class="text-gray-500 px-2 py-1 border rounded" onclick="updateQuantity(this, -1)">-</button>
                                <span class="mx-2">1</span>
                                <button class="text-gray-500 px-2 py-1 border rounded" onclick="updateQuantity(this, 1)">+</button>
                            </div>

                </div>
                <div class="col-3">
                    <h6 class="mob-text">$9.99</h6>
                </div>
                <div class="col-2">
                    <button class="product-remove text-xl" onclick="removeCartItem(this)">✕</button>
                </div>
            </div>
        </div>
    </div>
     <div class="row d-flex justify-content-center border-top">
        <div class="col-4">
            <div class="row d-flex">
                <div class="book">
                    <img src="img/product-img/product-big-1.jpg" class="book-img">
                </div>
                <div class="my-auto flex-column d-flex pad-left">
                    <h6 class="mob-text">Thinking, Fast and Slow</h6>
                    <p class="mob-text">Daniel Kahneman</p>
                </div>
            </div>
        </div>
        <div class="my-auto col-8">
            <div class="row text-right">
                <div class="col-2">
                    <p class="text-gray-600">
                            <select id="size-headphone" class="size-select" onchange="updateCartSummary()">
                                <option value="one-size" selected>One Size</option>
                            </select>
                        </p>

                </div>
                <div class="col-2">
                   <p class="text-gray-600">
                            <select id="color-headphone" class="color-select" onchange="updateCartSummary()">
                                <option value="black" selected>Black</option>
                                <option value="white">White</option>
                                <option value="red">Red</option>
                            </select>
                        </p>
                </div>
                <div class="col-3">
                    <div class="flex items-center">
                                <button class="text-gray-500 px-2 py-1 border rounded" onclick="updateQuantity(this, -1)">-</button>
                                <span class="mx-2">1</span>
                                <button class="text-gray-500 px-2 py-1 border rounded" onclick="updateQuantity(this, 1)">+</button>
                            </div>

                </div>
                <div class="col-3">
                    <h6 class="mob-text">$9.99</h6>
                </div>
                <div class="col-2">
                    <button class="product-remove text-xl" onclick="removeCartItem(this)">✕</button>
                </div>
            </div>
        </div>
    </div>
     <div class="row d-flex justify-content-center border-top">
        <div class="col-4">
            <div class="row d-flex">
                <div class="book">
                    <img src="img/product-img/product-big-1.jpg" class="book-img">
                </div>
                <div class="my-auto flex-column d-flex pad-left">
                    <h6 class="mob-text">Thinking, Fast and Slow</h6>
                    <p class="mob-text">Daniel Kahneman</p>
                </div>
            </div>
        </div>
        <div class="my-auto col-8">
            <div class="row text-right">
                <div class="col-2">
                    <p class="text-gray-600">
                            <select id="size-headphone" class="size-select" onchange="updateCartSummary()">
                                <option value="one-size" selected>One Size</option>
                            </select>
                        </p>

                </div>
                <div class="col-2">
                   <p class="text-gray-600">
                            <select id="color-headphone" class="color-select" onchange="updateCartSummary()">
                                <option value="black" selected>Black</option>
                                <option value="white">White</option>
                                <option value="red">Red</option>
                            </select>
                        </p>
                </div>
                <div class="col-3">
                    <div class="flex items-center">
                                <button class="text-gray-500 px-2 py-1 border rounded" onclick="updateQuantity(this, -1)">-</button>
                                <span class="mx-2">1</span>
                                <button class="text-gray-500 px-2 py-1 border rounded" onclick="updateQuantity(this, 1)">+</button>
                            </div>

                </div>
                <div class="col-3">
                    <h6 class="mob-text">$9.99</h6>
                </div>
                <div class="col-2">
                    <button class="product-remove text-xl" onclick="removeCartItem(this)">✕</button>
                </div>
            </div>
        </div>
    </div>
     <div class="row d-flex justify-content-center border-top">
        <div class="col-4">
            <div class="row d-flex">
                <div class="book">
                    <img src="img/product-img/product-big-1.jpg" class="book-img">
                </div>
                <div class="my-auto flex-column d-flex pad-left">
                    <h6 class="mob-text">Thinking, Fast and Slow</h6>
                    <p class="mob-text">Daniel Kahneman</p>
                </div>
            </div>
        </div>
        <div class="my-auto col-8">
            <div class="row text-right">
                <div class="col-2">
                    <p class="text-gray-600">
                            <select id="size-headphone" class="size-select" onchange="updateCartSummary()">
                                <option value="one-size" selected>One Size</option>
                            </select>
                        </p>

                </div>
                <div class="col-2">
                   <p class="text-gray-600">
                            <select id="color-headphone" class="color-select" onchange="updateCartSummary()">
                                <option value="black" selected>Black</option>
                                <option value="white">White</option>
                                <option value="red">Red</option>
                            </select>
                        </p>
                </div>
                <div class="col-3">
                    <div class="flex items-center">
                                <button class="text-gray-500 px-2 py-1 border rounded" onclick="updateQuantity(this, -1)">-</button>
                                <span class="mx-2">1</span>
                                <button class="text-gray-500 px-2 py-1 border rounded" onclick="updateQuantity(this, 1)">+</button>
                            </div>

                </div>
                <div class="col-3">
                    <h6 class="mob-text">$9.99</h6>
                </div>
                <div class="col-2">
                    <button class="product-remove text-xl" onclick="removeCartItem(this)">✕</button>
                </div>
            </div>
        </div>
    </div>
     <div class="row d-flex justify-content-center border-top">
        <div class="col-4">
            <div class="row d-flex">
                <div class="book">
                    <img src="img/product-img/product-big-1.jpg" class="book-img">
                </div>
                <div class="my-auto flex-column d-flex pad-left">
                    <h6 class="mob-text">Thinking, Fast and Slow</h6>
                    <p class="mob-text">Daniel Kahneman</p>
                </div>
            </div>
        </div>
        <div class="my-auto col-8">
            <div class="row text-right">
                <div class="col-2">
                    <p class="text-gray-600">
                            <select id="size-headphone" class="size-select" onchange="updateCartSummary()">
                                <option value="one-size" selected>One Size</option>
                            </select>
                        </p>

                </div>
                <div class="col-2">
                   <p class="text-gray-600">
                            <select id="color-headphone" class="color-select" onchange="updateCartSummary()">
                                <option value="black" selected>Black</option>
                                <option value="white">White</option>
                                <option value="red">Red</option>
                            </select>
                        </p>
                </div>
                <div class="col-3">
                    <div class="flex items-center">
                                <button class="text-gray-500 px-2 py-1 border rounded" onclick="updateQuantity(this, -1)">-</button>
                                <span class="mx-2">1</span>
                                <button class="text-gray-500 px-2 py-1 border rounded" onclick="updateQuantity(this, 1)">+</button>
                            </div>

                </div>
                <div class="col-3">
                    <h6 class="mob-text">$9.99</h6>
                </div>
                <div class="col-2">
                    <button class="product-remove text-xl" onclick="removeCartItem(this)">✕</button>
                </div>
            </div>
        </div>
    </div>
     <div class="row d-flex justify-content-center border-top">
        <div class="col-4">
            <div class="row d-flex">
                <div class="book">
                    <img src="img/product-img/product-big-1.jpg" class="book-img">
                </div>
                <div class="my-auto flex-column d-flex pad-left">
                    <h6 class="mob-text">Thinking, Fast and Slow</h6>
                    <p class="mob-text">Daniel Kahneman</p>
                </div>
            </div>
        </div>
        <div class="my-auto col-8">
            <div class="row text-right">
                <div class="col-2">
                    <p class="text-gray-600">
                            <select id="size-headphone" class="size-select" onchange="updateCartSummary()">
                                <option value="one-size" selected>One Size</option>
                            </select>
                        </p>

                </div>
                <div class="col-2">
                   <p class="text-gray-600">
                            <select id="color-headphone" class="color-select" onchange="updateCartSummary()">
                                <option value="black" selected>Black</option>
                                <option value="white">White</option>
                                <option value="red">Red</option>
                            </select>
                        </p>
                </div>
                <div class="col-3">
                    <div class="flex items-center">
                                <button class="text-gray-500 px-2 py-1 border rounded" onclick="updateQuantity(this, -1)">-</button>
                                <span class="mx-2">1</span>
                                <button class="text-gray-500 px-2 py-1 border rounded" onclick="updateQuantity(this, 1)">+</button>
                            </div>

                </div>
                <div class="col-3">
                    <h6 class="mob-text">$9.99</h6>
                </div>
                <div class="col-2">
                    <button class="product-remove text-xl" onclick="removeCartItem(this)">✕</button>
                </div>
            </div>
        </div>
    </div>
     <div class="row justify-content-center checkout">
                <div class="row checkout-Cart">
                    <div class="col-12">
                        <div class="row d-flex justify-content-between px-4">
                            <p class="mb-1 text-left">Subtotal</p>
                            <h6 class="mb-1 text-right">$23.49</h6>
                        </div>
                        <div class="row d-flex justify-content-between px-4">
                            <p class="mb-1 text-left">Shipping</p>
                            <h6 class="mb-1 text-right">$2.99</h6>
                        </div>
                        <div class="row d-flex justify-content-between px-4" id="tax">
                            <p class="mb-1 text-left">Total (tax included)</p>
                            <h6 class="mb-1 text-right">$26.48</h6>
                        </div>
                    </div>
                    <div class="col-12 ">
                        <button class="btn-block btn-blue">
                            <span>
                                <span id="checkout">Checkout</span>
                                <span id="check-amt">$26.48</span>
                            </span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    <footer class="footer_area clearfix">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-6">
                    <div class="single_widget_area d-flex mb-30">
                        <div class="footer-logo mr-50">
                            <a href="#"><img src="img/core-img/logo2.png" alt=""></a>
                        </div>
                        <div class="footer_menu">
                            <ul>
                                <li><a href="shop.html">Shop</a></li>
                                <li><a href="blog.html">Blog</a></li>
                                <li><a href="contact.html">Contact</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
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
                        <script>document.write(new Date().getFullYear());</script> All rights reserved | Made with <i
                            class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com"
                            target="_blank">Colorlib</a>, distributed by <a href="https://themewagon.com/"
                            target="_blank">ThemeWagon</a>
                        </p>
                </div>
            </div>

        </div>
    </footer>
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/classy-nav.min.js"></script>
    <script src="js/active.js"></script>
        <script>
        function updateQuantity(button, change) {
            const quantityElement = button.parentElement.querySelector('span');
            let quantity = parseInt(quantityElement.textContent);
            
            quantity += change;
            
            // Ensure quantity doesn't go below 1
            quantity = Math.max(1, quantity);
            
            quantityElement.textContent = quantity;
            updateCartSummary();
        }

        function updateCartSummary() {
            let subtotal = 0;
            const cartItems = document.querySelectorAll('.cart-item');
            
            cartItems.forEach(item => {
                // Skip if item is in hidden state (being removed) or not checked
                if (item.classList.contains('hidden') || !item.querySelector('input[type="checkbox"]').checked) return;
                
                const priceText = item.querySelector('.font-semibold:last-child').textContent;
                const price = parseFloat(priceText.replace('$', ''));
                const quantity = parseInt(item.querySelector('.mx-2').textContent);
                
                subtotal += price * quantity;
            });
            
            document.getElementById('subtotal').textContent = '$' + subtotal.toFixed(2);
            
            // Calculate tax (example: 8% tax rate)
            const tax = subtotal * 0.08;
            document.getElementById('tax').textContent = '$' + tax.toFixed(2);
            
            // Update total
            const total = subtotal + tax;
            document.getElementById('total').textContent = '$' + total.toFixed(2);
        }
    </script>
</body>

</html>
