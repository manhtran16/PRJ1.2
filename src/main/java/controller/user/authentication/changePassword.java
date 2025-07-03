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

        HttpSession session = request.getSession();
        session.removeAttribute("successMessage");
        session.removeAttribute("errorMessage");

        request.getRequestDispatcher("user/changePassword.jsp").forward(request, response);
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
            if (currentPassword == null || currentPassword.trim().isEmpty()) {
                request.setAttribute("error", "Vui lòng nhập mật khẩu hiện tại");
                request.getRequestDispatcher("user/changePassword.jsp").forward(request, response);
                return;
            }

            if (newPassword == null || newPassword.trim().isEmpty()) {
                request.setAttribute("error", "Vui lòng nhập mật khẩu mới");
                request.getRequestDispatcher("user/changePassword.jsp").forward(request, response);
                return;
            }

            if (!newPassword.equals(confirmPassword)) {
                request.setAttribute("error", "Mật khẩu mới và xác nhận không khớp");
                request.getRequestDispatcher("user/changePassword.jsp").forward(request, response);
                return;
            }

            if (!userDao.verifyCurrentPassword(user.getUserID(), currentPassword)) {
                request.setAttribute("error", "Mật khẩu hiện tại không đúng");
                request.getRequestDispatcher("user/changePassword.jsp").forward(request, response);
                return;
            }

            boolean success = userDao.updatePassword(user.getUserID(), newPassword);

            if (success) {
                request.setAttribute("success", "Đổi mật khẩu thành công!");
                request.getRequestDispatcher("user/changePassword.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Không thể đổi mật khẩu. Vui lòng thử lại.");
                request.getRequestDispatcher("user/changePassword.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Có lỗi xảy ra khi đổi mật khẩu: " + e.getMessage());
            request.getRequestDispatcher("user/changePassword.jsp").forward(request, response);
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
