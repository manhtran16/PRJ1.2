package controller.user.profile;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import java.io.IOException;

@WebServlet("/userProfile")
public class UserProfileController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");

        if (currentUser == null) {
            // Set error message and redirect to login
            session.setAttribute("errorMessage", "Vui lòng đăng nhập để xem thông tin cá nhân.");
            response.sendRedirect("login.jsp");
            return;
        }

        // Clear any previous messages
        session.removeAttribute("errorMessage");
        session.removeAttribute("successMessage");

        // User information is already in session, just forward to JSP
        request.getRequestDispatcher("user/userProfile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}