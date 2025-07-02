<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Chi tiết variant - ${product.productName}</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" />
    <link rel="stylesheet" href="css/mdb.min.css" />
    <link rel="stylesheet" href="css/core-style.css" />
    <link rel="stylesheet" href="style.css" />
    <style>
        .variant-card {
            border: 2px solid #007bff;
            border-radius: 10px;
            padding: 20px;
            margin: 20px 0;
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .attribute-badge {
            background-color: #007bff;
            color: white;
            padding: 5px 10px;
            border-radius: 15px;
            margin: 5px;
            display: inline-block;
            font-size: 14px;
        }
        .back-btn {
            background-color: #6c757d;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            display: inline-block;
            margin-bottom: 20px;
        }
        .add-to-cart-btn {
            background-color: #28a745;
            color: white;
            padding: 15px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            font-weight: bold;
            width: 100%;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <!-- Navbar (same as other pages) -->
    <header>
        <nav class="navbar navbar-expand-lg bg-body">
            <div class="container-fluid">
                <a href="products" class="navbar-brand">Cloth Store</a>
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="products">Trang chủ</a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>

    <main class="mt-5 pt-4">
        <div class="container mt-5">
            
            <!-- Back button -->
            <a href="products?action=detail&id=${product.productID}" class="back-btn">
                <i class="fas fa-arrow-left"></i> Quay lại sản phẩm
            </a>
            
            <div class="row">
                <!-- Product Image -->
                <div class="col-md-6 mb-4">
                    <c:choose>
                        <c:when test="${not empty selectedVariant.images}">
                            <img src="${selectedVariant.images[0].url}" class="img-fluid" alt="${product.productName}" />
                        </c:when>
                        <c:when test="${not empty product.variants and not empty product.variants[0].images}">
                            <img src="${product.variants[0].images[0].url}" class="img-fluid" alt="${product.productName}" />
                        </c:when>
                        <c:otherwise>
                            <img src="https://via.placeholder.com/500x400?text=Product+Image" class="img-fluid" alt="${product.productName}" />
                        </c:otherwise>
                    </c:choose>
                </div>

                <!-- Variant Details -->
                <div class="col-md-6 mb-4">
                    <div class="p-4">
                        
                        <!-- Product Title -->
                        <h2>${product.productName}</h2>
                        <c:if test="${not empty product.brand}">
                            <p class="text-muted">Brand: ${product.brand.brandName}</p>
                        </c:if>
                        <c:if test="${not empty product.type}">
                            <p class="text-muted">Category: ${product.type.typeName}</p>
                        </c:if>
                        
                        <!-- Variant Specific Card -->
                        <div class="variant-card">
                            <h4 style="color: #007bff; margin-bottom: 15px;">
                                <i class="fas fa-tag"></i> Chi tiết phiên bản này
                            </h4>
                            
                            <!-- Variant Attributes -->
                            <div style="margin-bottom: 15px;">
                                <c:forEach var="attrValue" items="${selectedVariant.attributeValues}">
                                    <span class="attribute-badge">
                                        ${attrValue.attribute.attributeName}: ${attrValue.value}
                                    </span>
                                </c:forEach>
                            </div>
                            
                            <!-- Price -->
                            <h3 style="color: #28a745; margin: 15px 0;">
                                Giá: ${selectedVariant.price} VNĐ
                            </h3>
                            
                            <!-- Stock Status -->
                            <div style="margin: 15px 0;">
                                <c:choose>
                                    <c:when test="${selectedVariant.quantity > 0}">
                                        <p style="color: #28a745; font-size: 16px;">
                                            <i class="fas fa-check-circle"></i> 
                                            Còn hàng: <strong>${selectedVariant.quantity}</strong> sản phẩm
                                        </p>
                                    </c:when>
                                    <c:otherwise>
                                        <p style="color: #dc3545; font-size: 16px;">
                                            <i class="fas fa-times-circle"></i> 
                                            <strong>Hết hàng</strong>
                                        </p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        
                        <!-- Product Description -->
                        <div style="margin: 20px 0;">
                            <h5>Mô tả sản phẩm:</h5>
                            <p>
                                <c:choose>
                                    <c:when test="${not empty product.description}">
                                        ${product.description}
                                    </c:when>
                                    <c:otherwise>
                                        Không có mô tả cho sản phẩm này.
                                    </c:otherwise>
                                </c:choose>
                            </p>
                        </div>
                        
                        <!-- Add to Cart Form -->
                        <c:if test="${selectedVariant.quantity > 0}">
                            <form action="cart" method="post">
                                <input type="hidden" name="action" value="add">
                                <input type="hidden" name="variantId" value="${selectedVariant.variantID}">
                                
                                <div style="margin: 20px 0;">
                                    <label for="quantity" style="font-weight: bold;">Số lượng:</label>
                                    <input type="number" id="quantity" name="quantity" value="1" 
                                           min="1" max="${selectedVariant.quantity}" 
                                           style="width: 80px; margin-left: 10px; padding: 5px; border: 1px solid #ddd; border-radius: 5px;">
                                </div>
                                
                                <button type="submit" class="add-to-cart-btn">
                                    <i class="fas fa-shopping-cart"></i> THÊM VÀO GIỎ HÀNG
                                </button>
                            </form>
                        </c:if>
                        
                        <!-- Other Variants Link -->
                        <div style="margin-top: 30px; text-align: center;">
                            <a href="products?action=detail&id=${product.productID}" 
                               style="color: #007bff; text-decoration: none; font-weight: bold;">
                                <i class="fas fa-list"></i> Xem tất cả phiên bản khác
                            </a>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer style="margin-top: 50px; padding: 20px 0; background-color: #f8f9fa;">
        <div class="text-center">
            <p>&copy; 2025 Cloth Store. All rights reservedHello.</p>
        </div>
    </footer>

</body>
</html>
