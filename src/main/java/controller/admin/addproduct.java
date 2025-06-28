package controller.admin;

import repository.BrandDao;
import repository.TypeDao;
import model.Type;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import model.Attribute;
import model.Brand;
import model.Image;
import model.Product;
import model.ProductVariant;
import model.VariantAttributeValue;
import service.ProductService;

@WebServlet(name = "AddProduct", urlPatterns = { "/addproduct" })
public class addproduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to the add product form
        TypeDao tdao = new TypeDao();
        List<Type> typeList = tdao.getType();
        BrandDao bdao = new BrandDao();
        List<Brand> brandList = bdao.getBrand();
        request.setAttribute("typeList", typeList);
        request.setAttribute("brandList", brandList);
        request.getRequestDispatcher("/admin/add_product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Lấy thông tin sản phẩm từ form
            String productName = request.getParameter("productName");
            String description = request.getParameter("description");
            int brandID = Integer.parseInt(request.getParameter("brandID"));
            int typeID = Integer.parseInt(request.getParameter("typeID"));
            Double price = Double.parseDouble(request.getParameter("price"));

            BrandDao bdao = new BrandDao();
            TypeDao tdao = new TypeDao();

            Brand brand = bdao.getBrandById(brandID);
            Type type = tdao.getTypeByID(typeID);
            
            Product product = new Product();
            product.setProductName(productName);
            product.setDescription(description);
            product.setBrand(brand);
            product.setType(type);

            // Lấy thông tin biến thể
            String[] sizes = request.getParameterValues("variantSize[]");
            for (String size : sizes) {
                System.out.println(size);
            }
            String[] colors = request.getParameterValues("variantColor[]");
            for (String color : colors) {
                System.out.println(color);
            }
            String[] quantities = request.getParameterValues("variantQuantity[]");
            for (String quantity : quantities) {
                System.out.println(quantity);
            }
            String[] images = request.getParameterValues("variantImage[]");
            for (String image : images) {
                System.out.println(image);
            }

            List<ProductVariant> variantList = new ArrayList<>();
            for (int i = 0; i < quantities.length; i++) {
                ProductVariant variant = new ProductVariant();
                variant.setQuantity(Integer.parseInt(quantities[i]));
                variant.setPrice(price);

                List<VariantAttributeValue> attributes = new ArrayList<>();

                // Gán size attribute
                VariantAttributeValue sizeVav = new VariantAttributeValue();
                sizeVav.setValue(sizes[i]);
                attributes.add(sizeVav);

                // Gán color attribute
                VariantAttributeValue colorVav = new VariantAttributeValue();
                colorVav.setValue(colors[i]);
                attributes.add(colorVav);

                variant.setAttributeValues(attributes);

                List<Image> variantImages = new ArrayList<>();
                Image image = new Image(images[i], variant);
                variantImages.add(image);
                variant.setImages(variantImages);

                variantList.add(variant);
            }

            ProductService productService = new ProductService();
            boolean success = productService.addFullProduct(product, variantList);
            if (success) {
                response.sendRedirect("productlist.jsp");
            } else {
                request.setAttribute("error", "Thêm sản phẩm thất bại");
                request.getRequestDispatcher("/admin/add_product.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("error", "Đã xảy ra lỗi: " + e.getMessage());
            request.getRequestDispatcher("/admin/add_product.jsp").forward(request, response);
        }
    }
}