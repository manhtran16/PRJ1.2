package controller.admin;

import dal.ProductDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import model.Product;
import model.SpecProduct;

@WebServlet(name = "AddProduct", urlPatterns = {"/admin/AddProduct"})
public class addproduct extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to the add product form
        request.getRequestDispatcher("/admin/add_product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get basic product information
            String productName = request.getParameter("productName");
            int quantity = Integer.parseInt(request.getParameter("productQuantity"));
            String description = request.getParameter("productDescription");
            double price = Double.parseDouble(request.getParameter("productPrice"));
            int brandId = Integer.parseInt(request.getParameter("productBrand"));

            // Create Product object
            Product product = new Product();
            product.setProductName(productName);
            product.setQuantity(quantity);
            product.setDescription(description);
            product.setPrice(price);
            product.setBrandID(brandId);

            // Handle multiple types
            String[] typeIds = request.getParameterValues("productType");
            List<Integer> typeIdList = new ArrayList<>();
            if (typeIds != null) {
                for (String typeId : typeIds) {
                    typeIdList.add(Integer.parseInt(typeId));
                }
            }

            // Handle specifications
            String[] specs = request.getParameterValues("productSpecification");
            String[] specProducts = request.getParameterValues("specProduct");
            String[] specValues = request.getParameterValues("specValue");
            List<SpecProduct> specifications = new ArrayList<>();

            if (specs != null && specProducts != null && specValues != null) {
                for (int i = 0; i < specs.length; i++) {
                    if (i < specProducts.length && i < specValues.length) {
                        SpecProduct spec = new SpecProduct();
                        spec.setSpecId(Integer.parseInt(specs[i]));
                        spec.setSpecProduct(specProducts[i]);
                        spec.setSpecValue(Double.parseDouble(specValues[i]));
                        specifications.add(spec);
                    }
                }
            }
            product.setSpecProducts(specifications);

            // Handle images
            String[] images = request.getParameterValues("productImage");
            if (images != null) {
                product.setImageProduct(Arrays.asList(images));
            }

            // Save to database
            ProductDao productDao = new ProductDao();
            boolean success = productDao.addProduct(product, typeIdList);

            if (success) {
                response.sendRedirect(request.getContextPath() + "/admin/ListProduct");
            } else {
                request.setAttribute("error", "Failed to add product. Please try again.");
                request.getRequestDispatcher("/admin/add_product.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid number format. Please check your input.");
            request.getRequestDispatcher("/admin/add_product.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("/admin/add_product.jsp").forward(request, response);
        }
    }
} 