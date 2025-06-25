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

        // Lấy thông tin sản phẩm từ form
        String productName = request.getParameter("productName");
        String description = request.getParameter("description");
        String brandIdStr = request.getParameter("brandName"); // assuming brandName param holds the brand ID
        String typeName = request.getParameter("typeName");
        Double price = Double.parseDouble(request.getParameter("price"));

        Product product = new Product();
        product.setProductName(productName);
        product.setDescription(description);

        BrandDao bdao = new BrandDao();
        Brand brand = bdao.getBrandById(Integer.parseInt(brandIdStr));
        product.setBrand(brand);
        product.setType(new Type(typeName));

        // Lấy thông tin biến thể
        String[] sizes = request.getParameterValues("variantSize[]");
        String[] colors = request.getParameterValues("variantColor[]"); // Bạn nên sửa name="variantColor[]" để tách
                                                                        // riêng
        String[] quantities = request.getParameterValues("variantQuantity[]");
        String[] images = request.getParameterValues("variantImage[]");

        List<ProductVariant> variantList = new ArrayList<>();
        for (int i = 0; i < quantities.length; i++) {
            ProductVariant variant = new ProductVariant();
            variant.setQuantity(Integer.parseInt(quantities[i]));
            variant.setPrice(price);

            List<VariantAttributeValue> attributes = new ArrayList<>();

            // Gán size attribute
            Attribute sizeAttr = new Attribute();
            sizeAttr.setAttributeID(1); // giả sử 1 là 'Size'
            attributes.add(new VariantAttributeValue(variant, sizeAttr, sizes[i]));

            // Gán color attribute
            Attribute colorAttr = new Attribute();
            colorAttr.setAttributeID(2); // giả sử 2 là 'Color'
            attributes.add(new VariantAttributeValue(variant, colorAttr, colors[i]));

            variant.setAttributeValues(attributes);
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
    }
}
