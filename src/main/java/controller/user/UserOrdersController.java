package controller.user;

import dal.OrderDao;
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

    private OrderDao orderDao;

    @Override
    public void init() throws ServletException {
        orderDao = new OrderDao();
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
        } else {
            listUserOrders(request, response, currentUser);
        }
    }

    private void listUserOrders(HttpServletRequest request, HttpServletResponse response, User user)
            throws ServletException, IOException {

        try {
            List<OrderTable> orders = orderDao.getOrdersByUserId(user.getUserID());

            // Calculate totals for each order
            for (OrderTable order : orders) {
                double total = orderDao.getOrderTotal(order.getOrderID());
                request.setAttribute("orderTotal_" + order.getOrderID(), total);
            }

            request.setAttribute("orders", orders);
            request.setAttribute("orderDao", orderDao); // For status text method
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
            OrderTable order = orderDao.getOrderById(orderId);
            if (order == null || order.getUser().getUserID() != user.getUserID()) {
                request.setAttribute("errorMessage", "Mặt hàng không tồn tại hoặc không thuộc về bạn");
                response.sendRedirect("userOrders");
                return;
            }

            // Get order details
            List<OrderDetail> orderDetails = orderDao.getOrderDetailsByOrderId(orderId);
            double orderTotal = orderDao.getOrderTotal(orderId);

            request.setAttribute("order", order);
            request.setAttribute("orderDetails", orderDetails);
            request.setAttribute("orderTotal", orderTotal);
            request.setAttribute("orderDao", orderDao);

            request.getRequestDispatcher("orderDetails.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect("userOrders");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Không thể tải thông tin đơn hàng. Vui lòng thử lại.");
            response.sendRedirect("userOrders");
        }
    }
}
