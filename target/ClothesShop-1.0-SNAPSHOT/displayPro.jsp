<%-- 
    Document   : displayPro
    Created on : Jun 3, 2025, 11:34:00 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>
      <c:choose>
        <c:when test="${not empty product}">
          ${product.productName} - Clothes Store
        </c:when>
        <c:otherwise>
          Product Details - Clothes Store
        </c:otherwise>
      </c:choose>
    </title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
    />
    <!-- Google Fonts Roboto -->
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap"
    />
    <!-- MDB -->
    <link rel="stylesheet" href="css/mdb.min.css" />
    <style>
    .color-box {
    display: inline-block;
    width: 30px;
    height: 30px;
    border: 1px solid #ccc;
    border-radius: 50%;
    margin-right: 5px;
}
.size-selection {
    margin: 10px 0;
}
.size-selection button {
    padding: 5px 12px;
    border:1px solid white;
    border-radius: 5px;
}
.quantity-control {
    margin: 10px 0;
}
.quantity-control input {
    width: 40px;
    text-align: center;
}
.add-to-cart {
    background-color: #000;
    color: #fff;
    padding: 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    width: 100%;
}
    .color-box {
            width: 30px;
            height: 30px;
            border: 2px solid transparent;
            cursor: pointer;
        }
        .size-btn {
            padding: 5px 10px;
            border: 2px solid transparent;
            cursor: pointer;
        }
        .color-box.active, .size-btn.active {
            border: 2px solid #000000;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
        }
    </style>
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
      <div class="collapse navbar-collapse" id="navbarExample01">        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item active">
            <a class="nav-link" aria-current="page" href="userhome.jsp">Home</a>
          </li>          <li class="nav-item">
            <a class="nav-link" href="products">Products</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="userOrders">My Orders</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="about.jsp">About</a>
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
        </a>        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
          <li>
            <a class="dropdown-item" href="userOrders">My Orders</a>
          </li>
          <li>
            <a class="dropdown-item" href="changePassword">Change Password</a>
          </li>
          <li><hr class="dropdown-divider" /></li>
          <li>
            <a class="dropdown-item" href="logout">Logout</a>
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
<!--Main layout-->
<main class="mt-5 pt-4">
    <div class="container mt-5">
        <!-- Error Message -->
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <i class="fas fa-exclamation-triangle me-2"></i>${errorMessage}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>

        <!-- Check if product exists -->
        <c:choose>
            <c:when test="${empty product}">
                <div class="text-center py-5">
                    <i class="fas fa-box-open fa-3x text-muted mb-3"></i>
                    <h3>Product Not Found</h3>                    <p class="text-muted">The product you're looking for doesn't exist.</p>
                    <a href="products" class="btn btn-primary">
                        <i class="fas fa-arrow-left me-1"></i>Back to Products
                    </a>
                </div>
            </c:when>
            <c:otherwise>
                <!--Grid row-->
                <div class="row">
                    <!--Grid column-->
                    <div class="col-md-6 mb-4">
                        <c:choose>
                            <c:when test="${not empty product.images and not empty product.images[0]}">
                                <img src="${product.images[0].url}" class="img-fluid" alt="${product.productName}" />
                            </c:when>
                            <c:otherwise>
                                <img src="https://via.placeholder.com/500x400?text=No+Image" class="img-fluid" alt="No Image" />
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-md-6 mb-4">
                        <!--Content-->
                        <div class="p-4">
                            <div class="mb-3">
                                <h2>${product.productName}</h2>
                                <c:if test="${not empty product.brand}">
                                    <p class="text-muted">Brand: ${product.brand.brandName}</p>
                                </c:if>
                                <c:if test="${not empty product.type}">
                                    <p class="text-muted">Category: ${product.type.typeName}</p>
                                </c:if>
                            </div>

                            <!-- Price Display -->
                            <c:choose>
                                <c:when test="${not empty product.variants}">
                                    <p class="lead">
                                        <span class="text-success">
                                            $<fmt:formatNumber value="${product.variants[0].price}" type="number" minFractionDigits="2" maxFractionDigits="2"/>
                                        </span>
                                        <c:if test="${product.variants.size() > 1}">
                                            <small class="text-muted">Starting from</small>
                                        </c:if>
                                    </p>
                                </c:when>
                                <c:otherwise>
                                    <p class="lead">
                                        <span class="text-muted">Price not available</span>
                                    </p>
                                </c:otherwise>
                            </c:choose>

                            <strong><p style="font-size: 20px;">Description</p></strong>
                            <p>${product.description}</p>                   <form action="addToCart" method="post" onsubmit="return prepareFormData()">
                        <input type="hidden" name="productId" value="${product.productID}">
                        
                        <div class="color-selection">
                            Color:
                            <button type="button" class="color-box" style="background-color: #f8e6d7;" data-color="beige"></button>
                            <button type="button" class="color-box" style="background-color: #e9e9e9;" data-color="gray"></button>
                            <input type="hidden" name="color" id="selectedColor">
                        </div>
                        <div class="size-selection">
                            Size:
                            <button type="button" class="size-btn" data-size="M">M</button>
                            <button type="button" class="size-btn" data-size="L">L</button>
                            <button type="button" class="size-btn" data-size="XL">XL</button>
                            <input type="hidden" name="size" id="selectedSize">
                        </div>
                        <div class="quantity-control">
                            <button type="button" id="decrease">-</button>
                            <input type="number" id="quantity" name="quantity" value="1" min="1" />
                            <button type="button" id="increase">+</button>
                        </div>

                        <!-- Add to Cart Button -->
                        <button type="submit" class="add-to-cart">
                            <i class="fas fa-shopping-cart me-2"></i>ADD TO CART
                        </button>
                          <!-- Back to Products -->
                        <div class="mt-3">
                            <a href="products" class="btn btn-outline-secondary w-100">
                                <i class="fas fa-arrow-left me-1"></i>Back to Products
                            </a>
                        </div>
                    </form>
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
    <!--Grid row-->
<!--Main layout-->
    <hr class="text-dark" />

    <div class="container">
        <!-- Section: Social media -->
        <section class="mb-3">
            <!-- Facebook -->
            <a class="btn-link btn-floating btn-lg text-white" href="#!" role="button" data-mdb-ripple-color="dark"><i class="fab fa-facebook-f"></i></a>

            <!-- Twitter -->
            <a class="btn-link btn-floating btn-lg text-white" href="#!" role="button" data-mdb-ripple-color="dark"><i class="fab fa-twitter"></i></a>

            <!-- Google -->
            <a class="btn-link btn-floating btn-lg text-white" href="#!" role="button" data-mdb-ripple-color="dark"><i class="fab fa-google"></i></a>

            <!-- Instagram -->
            <a class="btn-link btn-floating btn-lg text-white" href="#!" role="button" data-mdb-ripple-color="dark"><i class="fab fa-instagram"></i></a>

            <!-- YouTube -->
            <a class="btn-link btn-floating btn-lg text-white" href="#!" role="button" data-mdb-ripple-color="dark"><i class="fab fa-youtube"></i></a>
            <!-- Github -->
            <a class="btn-link btn-floating btn-lg text-white" href="#!" role="button" data-mdb-ripple-color="dark"><i class="fab fa-github"></i></a>
        </section>
        <!-- Section: Social media -->
    </div>
    <!-- Grid container -->
</main>


 <!-- Copyright -->
  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.05);">
    © 2020 Copyright:
    <a class="text-body" href="https://mdbootstrap.com/">MDBootstrap.com</a>
  </div>
  <!-- Copyright -->
</footer>
<script>
document.querySelectorAll('.color-box').forEach(button => {
    button.addEventListener('click', function () {
        document.querySelectorAll('.color-box').forEach(b => b.classList.remove('active'));
        this.classList.add('active');
        document.getElementById('selectedColor').value = this.dataset.color;
    });
});

document.querySelectorAll('.size-btn').forEach(button => {
    button.addEventListener('click', function () {
        document.querySelectorAll('.size-btn').forEach(b => b.classList.remove('active'));
        this.classList.add('active');
        document.getElementById('selectedSize').value = this.dataset.size;
    });
});

document.getElementById('increase').addEventListener('click', function () {
    const quantityInput = document.getElementById('quantity');
    let value = parseInt(quantityInput.value);
    if (!isNaN(value)) {
        quantityInput.value = value + 1;
    }
});

document.getElementById('decrease').addEventListener('click', function () {
    const quantityInput = document.getElementById('quantity');
    let value = parseInt(quantityInput.value);
    if (!isNaN(value) && value > 1) {
        quantityInput.value = value - 1;
    }
});

// Optional: prevent submission if color or size not selected
function prepareFormData() {
    const color = document.getElementById('selectedColor').value;
    const size = document.getElementById('selectedSize').value;
    if (!color || !size) {
        alert('Please select color and size!');
        return false;
    }
    return true;
}
</script>

  </body>
</html>

