package controller.user.product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import repository.ProductDAO;
import model.Product;
import model.ProductVariant;

@WebServlet(name = "VariantController", urlPatterns = { "/variant" })
public class VariantController extends HttpServlet {

    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO();
    }

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

            // Get variant details with all relationships loaded
            ProductVariant variant = productDAO.getVariantWithDetails(variantId);

            if (variant == null) {
                request.setAttribute("errorMessage", "Không tìm thấy phiên bản sản phẩm này.");
                request.getRequestDispatcher("products.jsp").forward(request, response);
                return;
            }

            // Get the product associated with this variant
            Product product = variant.getProduct();
            if (product == null) {
                request.setAttribute("errorMessage", "Không tìm thấy sản phẩm cho phiên bản này.");
                request.getRequestDispatcher("products.jsp").forward(request, response);
                return;
            }

            // Set attributes for JSP
            request.setAttribute("selectedVariant", variant);
            request.setAttribute("product", product);

            // Forward to variant detail page
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}