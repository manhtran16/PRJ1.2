package service;

import repository.OrderDAO;
import model.OrderTable;
import model.OrderDetail;
import java.util.List;
import java.util.ArrayList;

public class OrderService {

    private OrderDAO orderDAO;

    public OrderService() {
        this.orderDAO = new OrderDAO();
    }

    public List<OrderTable> getUserOrders(int userId) {
        if (userId <= 0) {
            return new ArrayList<>();
        }

        try {
            return orderDAO.getOrdersByUserId(userId);
        } catch (Exception e) {
            System.err.println("Error getting user orders: " + e.getMessage());
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    public OrderTable getOrderById(int orderId) {
        if (orderId <= 0) {
            return null;
        }

        try {
            return orderDAO.getOrderById(orderId);
        } catch (Exception e) {
            System.err.println("Error getting order by ID: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    public List<OrderDetail> getOrderDetails(int orderId) {
        if (orderId <= 0) {
            return new ArrayList<>();
        }

        try {
            return orderDAO.getOrderDetailsByOrderId(orderId);
        } catch (Exception e) {
            System.err.println("Error getting order details: " + e.getMessage());
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    public double getOrderTotal(int orderId) {
        if (orderId <= 0) {
            return 0.0;
        }

        try {
            return orderDAO.getOrderTotal(orderId);
        } catch (Exception e) {
            System.err.println("Error calculating order total: " + e.getMessage());
            e.printStackTrace();
            return 0.0;
        }
    }

    public String getOrderStatusText(int status) {
        switch (status) {
            case 0:
                return "Giỏ hàng";
            case 1:
                return "Đã thanh toán";
            default:
                return "Không xác định";
        }
    }

    public boolean updateOrderStatus(int orderId, int newStatus) {
        if (orderId <= 0 || newStatus < 0) {
            return false;
        }

        try {
            return orderDAO.updateOrderStatus(orderId, newStatus);
        } catch (Exception e) {
            System.err.println("Error updating order status: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public void close() {
        if (orderDAO != null) {
            orderDAO.close();
        }
    }
}
