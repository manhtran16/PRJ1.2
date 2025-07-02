package controller.user.cart;

import service.CartService;
import service.ProductService;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.OrderDetail;
import model.OrderTable;
import model.User;

@WebServlet("/cart")
public class CartController extends HttpServlet {

    private CartService cartService;
    private ProductService productService;

    @Override
    public void init() throws ServletException {
        this.cartService = new CartService();
        this.productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");

        if (currentUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        if ("add".equals(action)) {
            handleAddToCart(request, response, currentUser);
        } else if ("remove".equals(action)) {
            handleRemoveFromCart(request, response, currentUser);
        } else if ("clear".equals(action)) {
            handleClearCart(request, response, currentUser);
        } else {
            // Display cart
            displayCart(request, response, currentUser);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");

        if (currentUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            handleAddToCart(request, response, currentUser);
        } else if ("update".equals(action)) {
            handleUpdateCart(request, response, currentUser);
        } else if ("checkoutSelected".equals(action)) {
            handleCheckoutSelected(request, response, currentUser);
        } else {
            displayCart(request, response, currentUser);
        }
    }

    /**
     * Display cart page
     */
    private void displayCart(HttpServletRequest request, HttpServletResponse response, User user)
            throws ServletException, IOException {

        try {
            List<OrderDetail> cartItems = cartService.getCartItems(user);
            double cartTotal = cartService.getCartTotal(user);
            int itemCount = cartService.getCartItemsCount(user);

            request.setAttribute("cartItems", cartItems);
            request.setAttribute("cartTotal", cartTotal);
            request.setAttribute("cartItemCount", itemCount);

            request.getRequestDispatcher("user/cart.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Unable to load cart. Please try again.");
            request.getRequestDispatcher("user/cart.jsp").forward(request, response);
        }
    }

    /**
     * Handle add to cart
     */
    private void handleAddToCart(HttpServletRequest request, HttpServletResponse response, User user)
            throws ServletException, IOException {

        try {
            String variantIdStr = request.getParameter("variantId");
            String quantityStr = request.getParameter("quantity");

            System.out.println("DEBUG: Adding to cart - variantId: " + variantIdStr + ", quantity: " + quantityStr);

            if (variantIdStr == null || quantityStr == null) {
                System.out.println("DEBUG: Missing parameters");
                HttpSession session = request.getSession();
                session.setAttribute("errorMessage", "Missing product information.");
                response.sendRedirect("products");
                return;
            }

            int variantId = Integer.parseInt(variantIdStr);
            int quantity = Integer.parseInt(quantityStr);

            System.out.println("DEBUG: Parsed - variantId: " + variantId + ", quantity: " + quantity);

            boolean success = cartService.addToCart(user, variantId, quantity);

            System.out.println("DEBUG: Add to cart result: " + success);

            HttpSession session = request.getSession();
            if (success) {
                session.setAttribute("successMessage", "Đã thêm sản phẩm vào giỏ hàng!");
            } else {
                session.setAttribute("errorMessage", "Không thể thêm sản phẩm vào giỏ hàng.");
            }

            // Redirect to prevent double submission
            response.sendRedirect("cart");

        } catch (NumberFormatException e) {
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", "Invalid product or quantity.");
            response.sendRedirect("products");
        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", "Error adding to cart: " + e.getMessage());
            response.sendRedirect("products");
        }
    }

    /**
     * Handle update cart item quantity
     */
    private void handleUpdateCart(HttpServletRequest request, HttpServletResponse response, User user)
            throws ServletException, IOException {

        try {
            String variantIdStr = request.getParameter("variantId");
            String quantityStr = request.getParameter("quantity");

            int variantId = Integer.parseInt(variantIdStr);
            int quantity = Integer.parseInt(quantityStr);

            boolean success = cartService.updateCartItem(user, variantId, quantity);

            HttpSession session = request.getSession();
            if (success) {
                session.setAttribute("successMessage", "Đã cập nhật giỏ hàng!");
            } else {
                session.setAttribute("errorMessage", "Không thể cập nhật giỏ hàng.");
            }

            response.sendRedirect("cart");

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid product or quantity.");
            displayCart(request, response, user);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error updating cart: " + e.getMessage());
            displayCart(request, response, user);
        }
    }

    /**
     * Handle remove from cart
     */
    private void handleRemoveFromCart(HttpServletRequest request, HttpServletResponse response, User user)
            throws ServletException, IOException {

        try {
            String variantIdStr = request.getParameter("variantId");

            if (variantIdStr == null) {
                response.sendRedirect("cart");
                return;
            }

            int variantId = Integer.parseInt(variantIdStr);

            boolean success = cartService.removeFromCart(user, variantId);

            HttpSession session = request.getSession();
            if (success) {
                session.setAttribute("successMessage", "Đã xóa sản phẩm khỏi giỏ hàng!");
            } else {
                session.setAttribute("errorMessage", "Không thể xóa sản phẩm.");
            }

            response.sendRedirect("cart");

        } catch (NumberFormatException e) {
            response.sendRedirect("cart");
        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", "Error removing from cart: " + e.getMessage());
            response.sendRedirect("cart");
        }
    }

    /**
     * Handle clear cart
     */
    private void handleClearCart(HttpServletRequest request, HttpServletResponse response, User user)
            throws ServletException, IOException {

        try {
            boolean success = cartService.clearCart(user);

            HttpSession session = request.getSession();
            if (success) {
                session.setAttribute("successMessage", "Đã xóa tất cả sản phẩm khỏi giỏ hàng!");
            } else {
                session.setAttribute("errorMessage", "Không thể xóa giỏ hàng.");
            }

            response.sendRedirect("cart");

        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", "Error clearing cart: " + e.getMessage());
            response.sendRedirect("cart");
        }
    }

    /**
     * Handle checkout for selected items
     */
    private void handleCheckoutSelected(HttpServletRequest request, HttpServletResponse response, User user)
            throws ServletException, IOException {

        try {
            String[] selectedVariants = request.getParameterValues("selectedVariants");

            if (selectedVariants == null || selectedVariants.length == 0) {
                HttpSession session = request.getSession();
                session.setAttribute("errorMessage", "Vui lòng chọn ít nhất một sản phẩm để thanh toán.");
                response.sendRedirect("cart");
                return;
            }

            // Convert string array to integer array
            Integer[] variantIds = new Integer[selectedVariants.length];
            for (int i = 0; i < selectedVariants.length; i++) {
                variantIds[i] = Integer.parseInt(selectedVariants[i]);
            }

            // Convert selected cart items to order
            OrderTable order = cartService.checkoutSelectedItems(user, variantIds);

            if (order != null) {
                // Set success message
                HttpSession session = request.getSession();
                session.setAttribute("successMessage",
                        "Đặt hàng thành công! Mã đơn hàng: " + order.getOrderID() +
                                " (" + selectedVariants.length + " sản phẩm)");

                // Redirect to order details
                response.sendRedirect("userOrders?action=viewDetails&orderId=" + order.getOrderID());
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("errorMessage", "Không thể đặt hàng. Vui lòng thử lại.");
                response.sendRedirect("cart");
            }

        } catch (Exception e) {
            System.err.println("Selected checkout error: " + e.getMessage());
            e.printStackTrace();
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", "Lỗi trong quá trình đặt hàng: " + e.getMessage());
            response.sendRedirect("cart");
        }
    }

    @Override
    public void destroy() {
        if (cartService != null) {
            cartService.close();
        }
        if (productService != null) {
            productService.close();
        }
        super.destroy();
    }
}