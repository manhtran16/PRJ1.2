package controller.user;

import repository.ProductDao;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;

@WebServlet("/products")
public class ProductsController extends HttpServlet {

    private ProductDao productDao;

    @Override
    public void init() throws ServletException {
        productDao = new ProductDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String productId = request.getParameter("id");

        if ("detail".equals(action) && productId != null) {
            // Show product detail
            showProductDetail(request, response, productId);
        } else {
            // Show products list
            showProductsList(request, response);
        }
    }

    private void showProductsList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Product> products = productDao.getAllProducts();
            request.setAttribute("products", products);
            request.getRequestDispatcher("products.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Unable to load products. Please try again.");
            request.getRequestDispatcher("products.jsp").forward(request, response);
        }
    }

    private void showProductDetail(HttpServletRequest request, HttpServletResponse response, String productIdStr)
            throws ServletException, IOException {

        if (productIdStr == null || productIdStr.trim().isEmpty()) {
            response.sendRedirect("products");
            return;
        }

        try {
            int productId = Integer.parseInt(productIdStr);
            Product product = productDao.getProductWithDetails(productId);

            if (product == null) {
                request.setAttribute("errorMessage", "Product not found");
                request.getRequestDispatcher("products.jsp").forward(request, response);
                return;
            }

            request.setAttribute("product", product);
            request.getRequestDispatcher("displayPro.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect("products");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error loading product details");
            request.getRequestDispatcher("products.jsp").forward(request, response);
        }
    }

    @Override
    public void destroy() {
        if (productDao != null) {
            productDao.close();
        }
        super.destroy();
    }
}
