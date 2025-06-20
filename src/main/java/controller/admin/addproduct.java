package controller.admin;

import dal.BrandDao;
import dal.ProductDao;
import dal.TypeDao;
import model.Type;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import model.Brand;
import model.Product;

@WebServlet(name = "AddProduct", urlPatterns = {"/addproduct"})
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
            // Get basic product information
            String productName = request.getParameter("productName");
            int quantity = Integer.parseInt(request.getParameter("productQuantity"));
            String description = request.getParameter("productDescription");
            double price = Double.parseDouble(request.getParameter("productPrice"));
            int brandId = Integer.parseInt(request.getParameter("productBrand"));

    }
}
