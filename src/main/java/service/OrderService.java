package service;

import repository.OrderDao;
import model.OrderTable;
import model.OrderDetail;
import java.util.List;
import java.util.ArrayList;

/**
 * Order Service - handles order business logic
 */
public class OrderService {

    private OrderDao orderDao;

    public OrderService() {
        this.orderDao = new OrderDao();
    }

    /**
     * Get orders for a specific user (excluding cart orders)
     */
    public List<OrderTable> getUserOrders(int userId) {
        if (userId <= 0) {
            return new ArrayList<>();
        }

        try {
            return orderDao.getOrdersByUserId(userId);
        } catch (Exception e) {
            System.err.println("Error getting user orders: " + e.getMessage());
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    /**
     * Get order by ID
     */
    public OrderTable getOrderById(int orderId) {
        if (orderId <= 0) {
            return null;
        }

        try {
            return orderDao.getOrderById(orderId);
        } catch (Exception e) {
            System.err.println("Error getting order by ID: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Get order details for a specific order
     */
    public List<OrderDetail> getOrderDetails(int orderId) {
        if (orderId <= 0) {
            return new ArrayList<>();
        }

        try {
            return orderDao.getOrderDetailsByOrderId(orderId);
        } catch (Exception e) {
            System.err.println("Error getting order details: " + e.getMessage());
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    /**
     * Calculate total amount for an order
     */
    public double getOrderTotal(int orderId) {
        if (orderId <= 0) {
            return 0.0;
        }

        try {
            return orderDao.getOrderTotal(orderId);
        } catch (Exception e) {
            System.err.println("Error calculating order total: " + e.getMessage());
            e.printStackTrace();
            return 0.0;
        }
    }

    /**
     * Get order status text
     */
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

    /**
     * Update order status
     */
    public boolean updateOrderStatus(int orderId, int newStatus) {
        if (orderId <= 0 || newStatus < 0) {
            return false;
        }

        try {
            return orderDao.updateOrderStatus(orderId, newStatus);
        } catch (Exception e) {
            System.err.println("Error updating order status: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Close resources
     */
    public void close() {
        if (orderDao != null) {
            orderDao.close();
        }
    }
}
