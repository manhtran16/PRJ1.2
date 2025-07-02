/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.product;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;
import service.ProductService;

/**
 *
 * @author manht
 */
public class updateproduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productIDStr = request.getParameter("productID");
        int productID = 0;
        try {
            productID = Integer.parseInt(productIDStr);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "ID sản phẩm không hợp lệ!");
            request.getRequestDispatcher("/admin/product/update_product.jsp").forward(request, response);
            return;
        }
        ProductService productService = new ProductService();
        Product product = productService.getProductWithDetails(productID);
        if (product == null) {
            request.setAttribute("error", "Không tìm thấy sản phẩm!");
        } else {
            request.setAttribute("product", product);
            // Lấy danh sách variant của sản phẩm
            request.setAttribute("variants", product.getVariants());
        }
        request.getRequestDispatcher("/admin/product/update_product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // Nhận thông tin sản phẩm
        String productIdStr = request.getParameter("productId");
        String productName = request.getParameter("productName");
        String description = request.getParameter("description");

        // Nhận thông tin biến thể
        String[] variantIds = request.getParameterValues("variantIds");
        String[] variantPrices = request.getParameterValues("variantPrices");
        String[] variantQuantities = request.getParameterValues("variantQuantities");

        try {
            int productId = Integer.parseInt(productIdStr);

            ProductService productService = new ProductService();

            // Gọi hàm cập nhật sản phẩm (KHÔNG truyền typeId, brandId vì không cho sửa)
            boolean success = productService.updateFullProduct(
                    productId,
                    productName,
                    description,
                    variantIds,
                    variantPrices,
                    variantQuantities,
                    request // truyền request để lấy các mảng thuộc tính động cho từng variant
            );

            if (success) {
                request.setAttribute("success", "Cập nhật sản phẩm thành công!");
            } else {
                request.setAttribute("error", "Cập nhật sản phẩm thất bại!");
            }
        } catch (Exception e) {
            request.setAttribute("error", "Có lỗi xảy ra: " + e.getMessage());
            e.printStackTrace();
        }

        // Sau khi cập nhật, load lại thông tin sản phẩm để hiển thị
        ProductService productService = new ProductService();
        Product product = productService.getProductWithDetails(Integer.parseInt(productIdStr));
        request.setAttribute("product", product);
        request.setAttribute("variants", product.getVariants());

        request.getRequestDispatcher("/admin/product/update_product.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Update product servlet";
    }
}
