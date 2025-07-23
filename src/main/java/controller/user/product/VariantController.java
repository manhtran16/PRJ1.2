package controller.user.product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import repository.ProductDao;
import model.Product;
import model.ProductVariant;

@WebServlet(name = "VariantController", urlPatterns = { "/variant" })
public class VariantController extends HttpServlet {

    private ProductDao productDao;

    @Override
    public void init() throws ServletException {
        productDao = new ProductDao();
    }

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

        String variantIdStr = request.getParameter("variantId");

        if (variantIdStr == null || variantIdStr.trim().isEmpty()) {
            response.sendRedirect("products");
            return;
        }

        try {
            int variantId = Integer.parseInt(variantIdStr);

            ProductVariant variant = productDao.getVariantWithDetails(variantId);

            if (variant == null) {
                request.setAttribute("errorMessage", "Không tìm thấy phiên bản sản phẩm này.");
                request.getRequestDispatcher("products.jsp").forward(request, response);
                return;
            }

            Product product = variant.getProduct();
            if (product == null) {
                request.setAttribute("errorMessage", "Không tìm thấy sản phẩm cho phiên bản này.");
                request.getRequestDispatcher("products.jsp").forward(request, response);
                return;
            }

            request.setAttribute("selectedVariant", variant);
            request.setAttribute("product", product);

            request.getRequestDispatcher("variantDetail.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "ID phiên bản không hợp lệ.");
            request.getRequestDispatcher("products.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Có lỗi xảy ra khi tải thông tin phiên bản sản phẩm.");
            request.getRequestDispatcher("products.jsp").forward(request, response);
        }
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
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