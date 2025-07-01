package controller.user.orders;

import service.OrderService;
import service.CartService;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.OrderTable;
import model.OrderDetail;
import model.User;

@WebServlet("/userOrders")
public class UserOrdersController extends HttpServlet {

    private OrderService orderService;
    private CartService cartService;

    @Override
    public void init() throws ServletException {
        this.orderService = new OrderService();
        this.cartService = new CartService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("user");

        if (currentUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");

        if ("viewDetails".equals(action)) {
            viewOrderDetails(request, response, currentUser);
        } else if ("checkout".equals(action)) {
            handleCheckout(request, response, currentUser);
        } else {
            listUserOrders(request, response, currentUser);
        }
    }

    /**
     * Handle checkout process
     */
    private void handleCheckout(HttpServletRequest request, HttpServletResponse response, User user)
            throws ServletException, IOException {

        try {
            // Convert cart to order
            OrderTable order = cartService.checkoutCart(user);

            if (order != null) {
                // Set success message
                HttpSession session = request.getSession();
                session.setAttribute("successMessage", "Đặt hàng thành công! Mã đơn hàng: " + order.getOrderID());

                // Redirect to order details
                response.sendRedirect("userOrders?action=viewDetails&orderId=" + order.getOrderID());
            } else {
                request.setAttribute("errorMessage", "Không thể đặt hàng. Vui lòng thử lại.");
                response.sendRedirect("cart");
            }

        } catch (Exception e) {
            System.err.println("Checkout error: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("errorMessage", "Lỗi trong quá trình đặt hàng: " + e.getMessage());
            response.sendRedirect("cart");
        }
    }

    private void listUserOrders(HttpServletRequest request, HttpServletResponse response, User user)
            throws ServletException, IOException {

        try {
            List<OrderTable> orders = orderService.getUserOrders(user.getUserID());

            // Calculate totals for each order
            for (OrderTable order : orders) {
                double total = orderService.getOrderTotal(order.getOrderID());
                request.setAttribute("orderTotal_" + order.getOrderID(), total);
            }

            request.setAttribute("orders", orders);
            request.setAttribute("orderService", orderService);
            request.getRequestDispatcher("userOrders.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Unable to load orders. Please try again.");
            request.getRequestDispatcher("userOrders.jsp").forward(request, response);
        }
    }

    private void viewOrderDetails(HttpServletRequest request, HttpServletResponse response, User user)
            throws ServletException, IOException {

        try {
            String orderIdStr = request.getParameter("orderId");
            if (orderIdStr == null || orderIdStr.trim().isEmpty()) {
                response.sendRedirect("userOrders");
                return;
            }

            int orderId = Integer.parseInt(orderIdStr);

            // Get order information
            OrderTable order = orderService.getOrderById(orderId);
            if (order == null || order.getUser().getUserID() != user.getUserID()) {
                request.setAttribute("errorMessage", "Mặt hàng không tồn tại hoặc không thuộc về bạn");
                response.sendRedirect("userOrders");
                return;
            }

            // Get order details
            List<OrderDetail> orderDetails = orderService.getOrderDetails(orderId);
            double orderTotal = orderService.getOrderTotal(orderId);

            request.setAttribute("order", order);
            request.setAttribute("orderDetails", orderDetails);
            request.setAttribute("orderTotal", orderTotal);
            request.setAttribute("orderService", orderService);

            request.getRequestDispatcher("orderDetails.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect("userOrders");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Không thể tải thông tin đơn hàng. Vui lòng thử lại.");
            response.sendRedirect("userOrders");
        }
    }

    @Override
    public void destroy() {
        if (orderService != null) {
            orderService.close();
        }
        if (cartService != null) {
            cartService.close();
        }
        super.destroy();
    }
}
