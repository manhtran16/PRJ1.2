package controller.user.rating;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import repository.RatingDAO;
import model.User;
import java.io.IOException;

@WebServlet("/user/rating")
public class RatingController extends HttpServlet {

    private RatingDAO ratingDAO;

    @Override
    public void init() throws ServletException {
        ratingDAO = new RatingDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            addRating(request, response, user);
        } else if ("update".equals(action)) {
            updateRating(request, response, user);
        }
    }

    private void addRating(HttpServletRequest request, HttpServletResponse response, User user)
            throws ServletException, IOException {

        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int rate = Integer.parseInt(request.getParameter("rate"));
            String comment = request.getParameter("comment");

            if (rate < 1 || rate > 5) {
                request.setAttribute("error", "Rating must be between 1 and 5");
                request.getRequestDispatcher("/displayPro?id=" + productId).forward(request, response);
                return;
            }

            boolean success = ratingDAO.addRating(user.getUserID(), productId, rate, comment);

            if (success) {
                request.setAttribute("success", "Thank you for your rating!");
            } else {
                request.setAttribute("error", "You have already rated this product or an error occurred.");
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid input format.");
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred while processing your rating.");
        }

        String productId = request.getParameter("productId");
        response.sendRedirect(request.getContextPath() + "/displayPro?id=" + productId);
    }

    private void updateRating(HttpServletRequest request, HttpServletResponse response, User user)
            throws ServletException, IOException {

        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int rate = Integer.parseInt(request.getParameter("rate"));
            String comment = request.getParameter("comment");

            if (rate < 1 || rate > 5) {
                request.setAttribute("error", "Rating must be between 1 and 5");
                request.getRequestDispatcher("/displayPro?id=" + productId).forward(request, response);
                return;
            }

            boolean success = ratingDAO.updateRating(user.getUserID(), productId, rate, comment);

            if (success) {
                request.setAttribute("success", "Your rating has been updated!");
            } else {
                request.setAttribute("error", "Unable to update rating. Please try again.");
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid input format.");
        } catch (Exception e) {
            request.setAttribute("error", "An error occurred while updating your rating.");
        }

        String productId = request.getParameter("productId");
        response.sendRedirect(request.getContextPath() + "/displayPro?id=" + productId);
    }
}
