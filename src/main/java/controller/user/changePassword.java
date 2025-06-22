package controller.user;

import dal.UserDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

@WebServlet("/changePassword")
public class changePassword extends HttpServlet {

    private UserDao userDao;

    @Override
    public void init() throws ServletException {
        userDao = new UserDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to change password page
        request.getRequestDispatcher("changePassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");

        if (currentUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Validate input
        if (currentPassword == null || currentPassword.trim().isEmpty() ||
                newPassword == null || newPassword.trim().isEmpty() ||
                confirmPassword == null || confirmPassword.trim().isEmpty()) {
            request.setAttribute("errorMessage", "All fields are required");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            return;
        }

        // Check if new password matches confirmation
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("errorMessage", "New password and confirmation do not match");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            return;
        }
        // Verify current password
        boolean currentPasswordValid = userDao.verifyCurrentPassword(currentUser.getEmail(), currentPassword);
        if (!currentPasswordValid) {
            request.setAttribute("errorMessage", "Current password is incorrect");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            return;
        } // Validate new password strength (simple validation)
        if (newPassword.length() < 6) {
            request.setAttribute("errorMessage", "New password must be at least 6 characters long");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            return;
        }

        // Update password
        boolean updateSuccess = userDao.updatePassword(currentUser.getEmail(), newPassword);

        if (updateSuccess) {
            request.setAttribute("successMessage", "Password changed successfully");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Failed to update password. Please try again.");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
        }
    }
}
