package controller.user.product;

import service.ProductService;
import repository.RatingDAO;
import repository.BrandDAO;
import repository.TypeDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Product;
import model.ProductVariant;
import model.Rating;
import model.User;
import model.Brand;
import model.Type;

@WebServlet("/products")
public class ProductsController extends HttpServlet {

    private ProductService productService;
    private RatingDAO ratingDao;
    private BrandDAO brandDao;
    private TypeDAO typeDao;

    @Override
    public void init() throws ServletException {
        productService = new ProductService();
        ratingDao = new RatingDAO();
        brandDao = new BrandDAO();
        typeDao = new TypeDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String productId = request.getParameter("id");
        String variantId = request.getParameter("variantId");

        if ("detail".equals(action) && productId != null) {
            // Show product detail
            showProductDetail(request, response, productId);
        } else if ("variant".equals(action) && variantId != null) {
            // Show specific variant detail
            showVariantDetail(request, response, variantId);
        } else {
            // Show products list
            showProductsList(request, response);
        }
    }

    private void showProductsList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get search and filter parameters
            String searchQuery = request.getParameter("q");
            String brandIdStr = request.getParameter("brandId");
            String typeIdStr = request.getParameter("typeId");
            String minPriceStr = request.getParameter("minPrice");
            String maxPriceStr = request.getParameter("maxPrice");

            // Parse parameters
            Integer brandId = null;
            Integer typeId = null;
            Double minPrice = null;
            Double maxPrice = null;

            try {
                if (brandIdStr != null && !brandIdStr.trim().isEmpty()) {
                    brandId = Integer.parseInt(brandIdStr);
                }
                if (typeIdStr != null && !typeIdStr.trim().isEmpty()) {
                    typeId = Integer.parseInt(typeIdStr);
                }
                if (minPriceStr != null && !minPriceStr.trim().isEmpty()) {
                    minPrice = Double.parseDouble(minPriceStr);
                }
                if (maxPriceStr != null && !maxPriceStr.trim().isEmpty()) {
                    maxPrice = Double.parseDouble(maxPriceStr);
                }
            } catch (NumberFormatException e) {
                // Ignore invalid numbers, use null values
            }

            // Get products based on search/filter or all products
            List<Product> products;
            if (searchQuery != null || brandId != null || typeId != null || minPrice != null || maxPrice != null) {
                products = productService.searchAndFilterProducts(searchQuery, brandId, typeId, minPrice, maxPrice);
            } else {
                products = productService.getAllProducts();
            }

            // Get brands and types for filter dropdowns
            List<Brand> brands = brandDao.getBrand();
            List<Type> types = typeDao.getType();

            // Set attributes for JSP
            request.setAttribute("products", products);
            request.setAttribute("brands", brands);
            request.setAttribute("types", types);

            // Preserve search/filter values in form
            request.setAttribute("searchQuery", searchQuery);
            request.setAttribute("selectedBrandId", brandId);
            request.setAttribute("selectedTypeId", typeId);
            request.setAttribute("minPrice", minPriceStr);
            request.setAttribute("maxPrice", maxPriceStr);

            request.getRequestDispatcher("products.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Unable to load products. Please try again.");
            request.getRequestDispatcher("products.jsp").forward(request, response);
        }
    }

    private void showProductDetail(HttpServletRequest request, HttpServletResponse response, String productIdStr)
            throws ServletException, IOException {

        if (productIdStr == null || productIdStr.trim().isEmpty()) {
            response.sendRedirect("products");
            return;
        }

        try {
            int productId = Integer.parseInt(productIdStr);
            // Use getProductWithDetails to load all relationships including variants
            Product product = productService.getProductWithDetails(productId);

            if (product == null) {
                request.setAttribute("errorMessage", "Product not found with ID: " + productId);
                request.getRequestDispatcher("products.jsp").forward(request, response);
                return;
            }

            // Get rating information for the product
            List<Rating> ratings = ratingDao.getRatingsByProductId(productId);
            Double averageRating = ratingDao.getAverageRatingByProductId(productId);
            Long totalRatings = ratingDao.getTotalRatingsByProductId(productId);

            // Check if current user has rated this product
            HttpSession session = request.getSession();
            User currentUser = (User) session.getAttribute("user");
            Rating userRating = null;
            if (currentUser != null) {
                userRating = ratingDao.getUserRatingForProduct(currentUser.getUserID(), productId);
            }

            request.setAttribute("product", product);
            request.setAttribute("ratings", ratings);
            request.setAttribute("averageRating", averageRating != null ? averageRating : 0.0);
            request.setAttribute("totalRatings", totalRatings != null ? totalRatings : 0L);
            request.setAttribute("userRating", userRating);
            request.getRequestDispatcher("displayPro.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect("products");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error loading product details: " + e.getMessage());
            request.getRequestDispatcher("products.jsp").forward(request, response);
        }
    }

    private void showVariantDetail(HttpServletRequest request, HttpServletResponse response, String variantIdStr)
            throws ServletException, IOException {

        if (variantIdStr == null || variantIdStr.trim().isEmpty()) {
            response.sendRedirect("products");
            return;
        }

        try {
            int variantId = Integer.parseInt(variantIdStr);

            // Get the variant with its product details
            ProductVariant variant = productService.getVariantWithDetails(variantId);

            if (variant == null) {
                request.setAttribute("errorMessage", "Variant not found with ID: " + variantId);
                request.getRequestDispatcher("products.jsp").forward(request, response);
                return;
            }

            // Set both variant and product information
            request.setAttribute("selectedVariant", variant);
            request.setAttribute("product", variant.getProduct());

            // Forward to a variant detail page (we'll create this)
            request.getRequestDispatcher("variantDetail.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect("products");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error loading variant details: " + e.getMessage());
            request.getRequestDispatcher("products.jsp").forward(request, response);
        }
    }

    @Override
    public void destroy() {
        if (productService != null) {
            productService.close();
        }
        super.destroy();
    }
}