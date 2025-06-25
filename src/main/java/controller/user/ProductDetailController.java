package controller.user;

import dal.ProductDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;

@WebServlet("/productDetail")
public class ProductDetailController extends HttpServlet {

    private ProductDao productDao;

    @Override
    public void init() throws ServletException {
        productDao = new ProductDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String productIdStr = request.getParameter("id");

        if (productIdStr == null || productIdStr.trim().isEmpty()) {
            response.sendRedirect("products.jsp");
            return;
        }

        try {
            int productId = Integer.parseInt(productIdStr);
            Product product = getProductById(productId);

            if (product == null) {
                request.setAttribute("errorMessage", "Product not found");
                request.getRequestDispatcher("products.jsp").forward(request, response);
                return;
            }

            request.setAttribute("product", product);
            request.getRequestDispatcher("displayPro.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect("products.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error loading product details");
            request.getRequestDispatcher("products.jsp").forward(request, response);
        }
    }

    /**
     * Simple method to get product by ID
     * This is a basic implementation that can be expanded
     */
    private Product getProductById(int productId) {
        try {
            String sql = "SELECT p.ProductID, p.ProductName, p.Description, " +
                    "b.BrandID, b.BrandName, t.TypeID, t.TypeName " +
                    "FROM Product p " +
                    "LEFT JOIN Brand b ON p.BrandID = b.BrandID " +
                    "LEFT JOIN Type t ON p.TypeID = t.TypeID " +
                    "WHERE p.ProductID = ?";

            java.sql.PreparedStatement stm = productDao.c.prepareStatement(sql);
            stm.setInt(1, productId);
            java.sql.ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setDescription(rs.getString("Description"));

                // Create Brand object
                model.Brand brand = new model.Brand();
                brand.setBrandID(rs.getInt("BrandID"));
                brand.setBrandName(rs.getString("BrandName"));
                product.setBrand(brand);

                // Create Type object if exists
                if (rs.getInt("TypeID") > 0) {
                    model.Type type = new model.Type();
                    type.setTypeID(rs.getInt("TypeID"));
                    type.setTypeName(rs.getString("TypeName"));
                    product.setType(type);
                }

                // Get product variants (for pricing)
                getProductVariants(product, productId);

                // Get product images
                getProductImages(product, productId);

                return product;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    private void getProductVariants(Product product, int productId) {
        try {
            String sql = "SELECT VariantID, Price, Quantity FROM ProductVariant WHERE ProductID = ?";
            java.sql.PreparedStatement stm = productDao.c.prepareStatement(sql);
            stm.setInt(1, productId);
            java.sql.ResultSet rs = stm.executeQuery();

            java.util.List<model.ProductVariant> variants = new java.util.ArrayList<>();
            while (rs.next()) {
                model.ProductVariant variant = new model.ProductVariant();
                variant.setVariantID(rs.getInt("VariantID"));
                variant.setPrice(rs.getDouble("Price"));
                variant.setQuantity(rs.getInt("Quantity"));
                variant.setProduct(product);
                variants.add(variant);
            }
            product.setVariants(variants);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void getProductImages(Product product, int productId) {
        try {
            String sql = "SELECT i.ImageID, i.URL FROM Image i " +
                    "JOIN ProductVariant pv ON i.VariantID = pv.VariantID " +
                    "WHERE pv.ProductID = ?";
            java.sql.PreparedStatement stm = productDao.c.prepareStatement(sql);
            stm.setInt(1, productId);
            java.sql.ResultSet rs = stm.executeQuery();

            java.util.List<model.Image> images = new java.util.ArrayList<>();
            while (rs.next()) {
                model.Image image = new model.Image();
                image.setImageID(rs.getInt("ImageID"));
                image.setUrl(rs.getString("URL"));
                // Note: We're not setting variant here to keep it simple
                images.add(image);
            }
            // Note: Since Image is linked to ProductVariant, we'll add a simple approach
            // You might want to modify this based on your exact needs
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
