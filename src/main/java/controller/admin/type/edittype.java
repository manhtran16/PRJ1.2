/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.type;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Type;
import repository.TypeDAO;
import service.TypeService;

/**
 *
 * @author manht
 */
public class edittype extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet edittype</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet edittype at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String typeIdStr = request.getParameter("typeID");
        int typeId = Integer.parseInt(typeIdStr);

        // Lấy type từ DB
        TypeDAO typeDao = new TypeDAO();
        Type type = typeDao.getTypeByID(typeId);

        // Gửi tên type sang JSP
        request.setAttribute("type", type);
        request.getRequestDispatcher("/admin/type/edit_type.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String typeIdStr = request.getParameter("typeID");
        String typeName = request.getParameter("typeName");
        String error = null;
        String success = null;
        int typeId = 0;
        Type type = null;
        try {
            typeId = Integer.parseInt(typeIdStr);
            System.out.println("1");
            TypeService typeService = new TypeService();
            System.out.println("2");
            boolean result = typeService.editType(typeId, typeName);
            if (result) {
                success = "Cập nhật thương hiệu thành công!";
            } else {
                error = "Cập nhật thương hiệu thất bại! Tên không hợp lệ hoặc đã tồn tại.";
            }
        } catch (Exception e) {
            error = "Có lỗi xảy ra khi cập nhật thương hiệu.";
        }
        // Lấy lại type mới nhất để hiển thị
        TypeDAO typeDao = new TypeDAO();
        type = typeDao.getTypeByID(typeId);
        request.setAttribute("type", type);
        request.setAttribute("error", error);
        request.setAttribute("success", success);
        request.getRequestDispatcher("/admin/type/edit_type.jsp").forward(request, response);
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

}
