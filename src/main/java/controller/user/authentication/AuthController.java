/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user.authentication;

import utils.Validate;
import repository.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import service.AuthService;

/**
 *
 * @author manht
 */
@WebServlet(name = "AuthController", urlPatterns = { "/auth" })
public class AuthController extends HttpServlet {

    private UserDAO userDao;
    private AuthService authService = new AuthService(userDao);

    @Override
    public void init() throws ServletException {
        userDao = new UserDAO();
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
            out.println("<title>Servlet AuthController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AuthController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
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
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        String type = request.getParameter("type");

        if (type.equals("LOGIN")) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            postLogin(request, response, email, password);
        }
        if (type.equals("REGISTER")) {

            String userName = request.getParameter("userName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String password = request.getParameter("password");
            User user = new User(0, userName, email,
                    phone, address, firstName, lastName);
            postRegister(request, response, user, password);
        }

    }

    protected void postLogin(HttpServletRequest request, HttpServletResponse response, String email, String password)
            throws ServletException, IOException {
        int result = authService.login(request, response, email, password);
        switch (result) {
            case 0:
                response.sendRedirect("index");
                break;
            case 3:
                response.sendRedirect(request.getContextPath() + "/admindashboard");
                break;
            case 1:
                request.setAttribute("loginStatus", 1);
                request.setAttribute("msg", "Wrong password");
                request.setAttribute("email", email);
                request.getRequestDispatcher("login.jsp").forward(request, response);
                break;
            case 2:
                request.setAttribute("loginStatus", 2);
                request.setAttribute("email", email);
                request.setAttribute("msg", "Account is not exist!!!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                break;
            default:
                request.setAttribute("msg", "Lỗi server. Vui lòng thử lại sau.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                break;
        }
    }

    protected void postRegister(HttpServletRequest request, HttpServletResponse response, User user, String password)
            throws ServletException, IOException {
        int result = authService.register(request, user, password);
        switch (result) {
            case 1:
                request.setAttribute("msg", "User is exist!!!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                break;
            case 2:
                request.setAttribute("msg", "Email is exist!!!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                break;
            case 0:
                response.sendRedirect("login.jsp");
                break;
            default:
                request.setAttribute("msg", "Lỗi server. Vui lòng thử lại sau.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                break;
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    @Override
    public void destroy() {
        if (userDao != null) {
            userDao.close();
        }
        super.destroy();
    }
}
