package controller.user.product;

import repository.ProductDao;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;
import model.ProductVariant;

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
        String variantId = request.getParameter("variantId");

        if ("detail".equals(action) && productId != null) {
            // Show product detail
            showProductDetail(request, response, productId);
        } else if ("variant".equals(action) && variantId != null) {
            // Show specific variant detail
            showVariantDetail(request, response, variantId);
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
            // Use getProductWithDetails to load all relationships including variants
            Product product = productDao.getProductWithDetails(productId);

            if (product == null) {
                request.setAttribute("errorMessage", "Product not found with ID: " + productId);
                request.getRequestDispatcher("products.jsp").forward(request, response);
                return;
            }

            request.setAttribute("product", product);
            request.getRequestDispatcher("displayPro.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect("products");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error loading product details: " + e.getMessage());
            request.getRequestDispatcher("products.jsp").forward(request, response);
        }
    }

    private void showVariantDetail(HttpServletRequest request, HttpServletResponse response, String variantIdStr)
            throws ServletException, IOException {

        if (variantIdStr == null || variantIdStr.trim().isEmpty()) {
            response.sendRedirect("products");
            return;
        }

        try {
            int variantId = Integer.parseInt(variantIdStr);

            // Get the variant with its product details
            ProductVariant variant = productDao.getVariantWithDetails(variantId);

            if (variant == null) {
                request.setAttribute("errorMessage", "Variant not found with ID: " + variantId);
                request.getRequestDispatcher("products.jsp").forward(request, response);
                return;
            }

            // Set both variant and product information
            request.setAttribute("selectedVariant", variant);
            request.setAttribute("product", variant.getProduct());

            // Forward to a variant detail page (we'll create this)
            request.getRequestDispatcher("variantDetail.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect("products");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error loading variant details: " + e.getMessage());
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
