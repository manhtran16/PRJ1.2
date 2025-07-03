package controller.user.product;

import service.ProductService;
import repository.RatingDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Product;
import model.Rating;
import model.User;

@WebServlet("/displayPro")
public class ProductDetailController extends HttpServlet {

    private ProductService productService;
    private RatingDAO ratingDAO;

    @Override
    public void init() throws ServletException {
        productService = new ProductService();
        ratingDAO = new RatingDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String productIdStr = request.getParameter("id");

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

            List<Rating> ratings = ratingDAO.getRatingsByProductId(productId);
            Double averageRating = ratingDAO.getAverageRatingByProductId(productId);
            Long totalRatings = ratingDAO.getTotalRatingsByProductId(productId);

            HttpSession session = request.getSession();
            User currentUser = (User) session.getAttribute("user");
            Rating userRating = null;
            if (currentUser != null) {
                userRating = ratingDAO.getUserRatingForProduct(currentUser.getUserID(), productId);
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
}
