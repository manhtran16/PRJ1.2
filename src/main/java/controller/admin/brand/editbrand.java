/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin.brand;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Brand;
import repository.BrandDao;
import service.BrandService;

/**
 *
 * @author manht
 */
@WebServlet(name="editbrand", urlPatterns={"/editbrand"})
public class editbrand extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet editbrand</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editbrand at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String brandIdStr = request.getParameter("brandId");
        int brandId = Integer.parseInt(brandIdStr);

        // Lấy brand từ DB
        BrandDao brandDao = new BrandDao();
        Brand brand = brandDao.getBrandById(brandId);

        // Gửi tên brand sang JSP
        request.setAttribute("brand", brand);
        request.getRequestDispatcher("/admin/brand/edit_brand.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String brandIdStr = request.getParameter("brandId");
        String brandName = request.getParameter("brandName");
        String error = null;
        String success = null;
        int brandId = 0;
        Brand brand = null;
        try {
            brandId = Integer.parseInt(brandIdStr);
            BrandService brandService = new BrandService();
            boolean result = brandService.editBrand(brandId, brandName);
            if (result) {
                success = "Cập nhật thương hiệu thành công!";
            } else {
                error = "Cập nhật thương hiệu thất bại! Tên không hợp lệ hoặc đã tồn tại.";
            }
        } catch (Exception e) {
            error = "Có lỗi xảy ra khi cập nhật thương hiệu.";
        }
        // Lấy lại brand mới nhất để hiển thị
        BrandDao brandDao = new BrandDao();
        brand = brandDao.getBrandById(brandId);
        request.setAttribute("brand", brand);
        request.setAttribute("error", error);
        request.setAttribute("success", success);
        request.getRequestDispatcher("/admin/brand/edit_brand.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
