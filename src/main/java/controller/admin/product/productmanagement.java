/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin.product;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Product;
import model.ProductVariant;
import model.User;
import model.VariantAttributeValue;
import service.ProductService;

/**
 *
 * @author manht
 */
@WebServlet(name="productmanagement", urlPatterns={"/productmanagement"})
public class productmanagement extends HttpServlet {
   
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
            out.println("<title>Servlet productmanagement</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet productmanagement at " + request.getContextPath () + "</h1>");
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
        User user = (User) request.getSession().getAttribute("user");
        request.setAttribute("user", user);
        request.getRequestDispatcher("/admin/product/product_management.jsp").forward(request, response);
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
        ProductService productService = new ProductService();

        String productName = request.getParameter("productName");
        // Nếu không tìm kiếm, hiển thị tất cả sản phẩm
        if (productName == null || productName.trim().isEmpty()) {
            List<Product> productList = productService.getAllProducts();

            for (Product p : productList) {
                for (ProductVariant v : p.getVariants()) {
                    System.out.println("Variant ID: " + v.getVariantID());
                    for (VariantAttributeValue vav : v.getAttributeValues()) {
                        System.out.println("  " + vav.getAttribute().getAttributeName() + ": " + vav.getValue());
                    }
                }
            }

            request.setAttribute("productList", productList);
        } else {
            // Tìm kiếm sản phẩm theo tên
            List<Product> searchResults = productService.searchProductsByName(productName);
            request.setAttribute("searchResults", searchResults);
        }
        // Forward về trang quản lý sản phẩm để hiển thị kết quả
        request.getRequestDispatcher("/admin/product/product_management.jsp").forward(request, response);
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
