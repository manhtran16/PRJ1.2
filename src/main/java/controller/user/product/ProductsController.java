package controller.user.product;

import service.ProductService;
import repository.RatingDao;
import repository.BrandDao;
import repository.TypeDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Collections;
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
    private RatingDao ratingDao;
    private BrandDao brandDAO;
    private TypeDao typeDAO;

    @Override
    public void init() throws ServletException {
        productService = new ProductService();
        ratingDao = new RatingDao();
        brandDAO = new BrandDao();
        typeDAO = new TypeDao();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     * 
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductsController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductsController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     * 
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String productId = request.getParameter("id");
        String variantId = request.getParameter("variantId");

        if ("detail".equals(action) && productId != null) {
            showProductDetail(request, response, productId);
        } else if ("variant".equals(action) && variantId != null) {
            showVariantDetail(request, response, variantId);
        } else {
            showProductsList(request, response);
        }
    }

    private void showProductsList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String searchQuery = request.getParameter("q");
            String brandIdStr = request.getParameter("brandId");
            String typeIdStr = request.getParameter("typeId");
            String minPriceStr = request.getParameter("minPrice");
            String maxPriceStr = request.getParameter("maxPrice");

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
                e.printStackTrace();
            }

            List<Product> products;
            if (searchQuery != null || brandId != null || typeId != null || minPrice != null || maxPrice != null) {
                products = productService.searchAndFilterProducts(searchQuery, brandId, typeId, minPrice, maxPrice);
            } else {
                products = productService.getAllProducts();
            }

            Collections.shuffle(products);

            List<Brand> brands = brandDAO.getBrand();
            List<Type> types = typeDAO.getType();

            request.setAttribute("products", products);
            request.setAttribute("brands", brands);
            request.setAttribute("types", types);

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
            Product product = productService.getProductWithDetails(productId);

            if (product == null) {
                request.setAttribute("errorMessage", "Product not found with ID: " + productId);
                request.getRequestDispatcher("products.jsp").forward(request, response);
                return;
            }

            List<Rating> ratings = ratingDao.getRatingsByProductId(productId);
            Double averageRating = ratingDao.getAverageRatingByProductId(productId);
            Long totalRatings = ratingDao.getTotalRatingsByProductId(productId);

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

            ProductVariant variant = productService.getVariantWithDetails(variantId);

            if (variant == null) {
                request.setAttribute("errorMessage", "Variant not found with ID: " + variantId);
                request.getRequestDispatcher("products.jsp").forward(request, response);
                return;
            }

            request.setAttribute("selectedVariant", variant);
            request.setAttribute("product", variant.getProduct());

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