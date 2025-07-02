<%-- 
    Document   : products
    Created on : Jun 1, 2025, 11:00:14 PM
    Author     : manht
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Products - Clothes Store</title>
    <link href="css/mdb.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .product-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: 1px solid #dee2e6;
            border-radius: 8px;
            overflow: hidden;
        }
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }
        .product-image {
            height: 250px;
            object-fit: cover;
            width: 100%;
        }
        .product-title {
            font-size: 1.1rem;
            font-weight: 600;
            color: #333;
            text-decoration: none;
        }
        .product-title:hover {
            color: #cc66ff;
            text-decoration: none;
        }
        .product-description {
            color: #6c757d;
            font-size: 0.9rem;
            height: 40px;
            overflow: hidden;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }
        .brand-badge {
            background-color: #cc66ff;
            color: white;
            font-size: 0.75rem;
            padding: 0.25rem 0.5rem;
            border-radius: 15px;
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #cc66ff;">
        <div class="container">
            <a class="navbar-brand text-white" href="index">
                <i class="fas fa-tshirt me-2"></i>Clothes Store
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link text-white" href="index">
                    <i class="fas fa-home me-1"></i>Home
                </a>
                <a class="nav-link text-white active" href="products">
                    <i class="fas fa-shopping-bag me-1"></i>Products
                </a>
                <a class="nav-link text-white" href="cart">
                    <i class="fas fa-shopping-cart me-1"></i>Cart
                </a>
                <a class="nav-link text-white" href="userOrders">
                    <i class="fas fa-receipt me-1"></i>My Orders
                </a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="row">
            <div class="col-12">
                <h2 class="mb-4">
                    <i class="fas fa-shopping-bag me-2"></i>Our Products
                </h2>

                <!-- Error Message -->
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="fas fa-exclamation-triangle me-2"></i>${errorMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                </c:if>

                <!-- Search and Filter Section -->
                <div class="card mb-4">
                    <div class="card-body">
                        <form method="GET" action="products">
                            <div class="row g-3">
                                <!-- Search Box -->
                                <div class="col-md-4">
                                    <label for="searchQuery" class="form-label">Search Products</label>
                                    <input type="text" class="form-control" id="searchQuery" name="q" 
                                           value="${searchQuery}" placeholder="Enter product name...">
                                </div>
                                
                                <!-- Brand Filter -->
                                <div class="col-md-2">
                                    <label for="brandSelect" class="form-label">Brand</label>
                                    <select class="form-select" id="brandSelect" name="brandId">
                                        <option value="">All Brands</option>
                                        <c:forEach var="brand" items="${brands}">
                                            <option value="${brand.brandID}" 
                                                    ${selectedBrandId == brand.brandID ? 'selected' : ''}>
                                                ${brand.brandName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                
                                <!-- Type Filter -->
                                <div class="col-md-2">
                                    <label for="typeSelect" class="form-label">Category</label>
                                    <select class="form-select" id="typeSelect" name="typeId">
                                        <option value="">All Categories</option>
                                        <c:forEach var="type" items="${types}">
                                            <option value="${type.typeID}" 
                                                    ${selectedTypeId == type.typeID ? 'selected' : ''}>
                                                ${type.typeName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                
                                <!-- Price Range -->
                                <div class="col-md-2">
                                    <label for="minPrice" class="form-label">Min Price (VNĐ)</label>
                                    <input type="number" class="form-control" id="minPrice" name="minPrice" 
                                           value="${minPrice}" placeholder="0" min="0" step="1000">
                                </div>
                                
                                <div class="col-md-2">
                                    <label for="maxPrice" class="form-label">Max Price (VNĐ)</label>
                                    <input type="number" class="form-control" id="maxPrice" name="maxPrice" 
                                           value="${maxPrice}" placeholder="1000000" min="0" step="1000">
                                </div>
                            </div>
                            
                            <div class="row mt-3">
                                <div class="col-12">
                                    <button type="submit" class="btn btn-primary me-2">
                                        <i class="fas fa-search me-1"></i>Search & Filter
                                    </button>
                                    <a href="products" class="btn btn-outline-secondary">
                                        <i class="fas fa-times me-1"></i>Clear Filters
                                    </a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Products Grid -->
                <c:choose>
                    <c:when test="${empty products}">
                        <div class="text-center py-5">
                            <i class="fas fa-box-open fa-3x text-muted mb-3"></i>
                            <h4>No Products Available</h4>
                            <p class="text-muted">We're working on adding new products. Check back soon!</p>
                            <a href="index" class="btn btn-primary">
                                <i class="fas fa-home me-1"></i>Back to Home
                            </a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="row">
                            <c:forEach var="product" items="${products}">
                                <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                                    <div class="card product-card h-100">
                                        <!-- Product Image -->
                                        <c:choose>
                                            <c:when test="${not empty product.variants and not empty product.variants[0].images and not empty product.variants[0].images[0].url}">
                                                <img src="${product.variants[0].images[0].url}" 
                                                     class="product-image" 
                                                     alt="${product.productName}"
                                                     onerror="this.src='https://via.placeholder.com/300x250?text=No+Image';">
                                            </c:when>
                                            <c:otherwise>
                                                <img src="https://via.placeholder.com/300x250?text=No+Image" 
                                                     class="product-image" 
                                                     alt="${product.productName}">
                                            </c:otherwise>
                                        </c:choose>
                                        
                                        <!-- Product Details -->
                                        <div class="card-body d-flex flex-column">
                                            <!-- Brand Badge -->
                                            <c:if test="${not empty product.brand}">
                                                <div class="mb-2">
                                                    <span class="brand-badge">${product.brand.brandName}</span>
                                                </div>
                                            </c:if>
                                              <!-- Product Name -->
                                            <h5 class="product-title mb-2">
                                                <a href="products?action=detail&id=${product.productID}" class="product-title">
                                                    ${product.productName}
                                                </a>
                                            </h5>
                                            
                                            <!-- Product Description -->
                                            <p class="product-description mb-3">
                                                ${product.description}
                                            </p>
                                            
                                            <!-- Action Button -->
                                            <div class="mt-auto">
                                                <a href="products?action=detail&id=${product.productID}" 
                                                   class="btn btn-primary w-100">
                                                    <i class="fas fa-eye me-1"></i>View Details
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
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
