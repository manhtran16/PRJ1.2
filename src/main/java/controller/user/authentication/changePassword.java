package controller.user.authentication;

import repository.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

@WebServlet(name = "/changePassword", urlPatterns = { "/changepassword" })
public class changePassword extends HttpServlet {

    private UserDAO userDao;

    @Override
    public void init() throws ServletException {
        userDao = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to change password form
        request.getRequestDispatcher("changePassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        try {
            // Validate input
            if (currentPassword == null || currentPassword.trim().isEmpty()) {
                request.setAttribute("error", "Current password is required");
                request.getRequestDispatcher("changePassword.jsp").forward(request, response);
                return;
            }

            if (newPassword == null || newPassword.trim().isEmpty()) {
                request.setAttribute("error", "New password is required");
                request.getRequestDispatcher("changePassword.jsp").forward(request, response);
                return;
            }

            if (!newPassword.equals(confirmPassword)) {
                request.setAttribute("error", "New passwords do not match");
                request.getRequestDispatcher("changePassword.jsp").forward(request, response);
                return;
            }

            // Verify current password
            if (!userDao.verifyCurrentPassword(user.getUserID(), currentPassword)) {
                request.setAttribute("error", "Current password is incorrect");
                request.getRequestDispatcher("changePassword.jsp").forward(request, response);
                return;
            }

            // Update password
            boolean success = userDao.updatePassword(user.getUserID(), newPassword);

            if (success) {
                request.setAttribute("success", "Password changed successfully!");
                request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Failed to change password. Please try again.");
                request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while changing password: " + e.getMessage());
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
        }
    }

    @Override
    public void destroy() {
        if (userDao != null) {
            userDao.close();
        }
        super.destroy();
    }
}
