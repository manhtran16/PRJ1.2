package dal;

import controller.user.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.OrderTable;
import model.OrderDetail;
import model.User;
import model.ProductVariant;
import model.Product;

/**
 * Data Access Object for Order operations
 */
public class OrderDao extends DBContext {

    /**
     * Get all orders for a specific user
     */
    public List<OrderTable> getOrdersByUserId(int userId) {
        List<OrderTable> orders = new ArrayList<>();
        String sql = "SELECT o.OrderID, o.OrderDate, o.Status, " +
                "u.UserID, u.UserName, u.Email, u.FirstName, u.LastName " +
                "FROM [dbo].[OrderTable] o " +
                "JOIN [dbo].[User] u ON o.UserID = u.UserID " +
                "WHERE o.UserID = ? " +
                "ORDER BY o.OrderDate DESC";

        try {
            PreparedStatement stm = c.prepareStatement(sql);
            stm.setInt(1, userId);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                // Create User object
                User user = new User();
                user.setUserID(rs.getInt("UserID"));
                user.setUserName(rs.getString("UserName"));
                user.setEmail(rs.getString("Email"));
                user.setFirstName(rs.getString("FirstName"));
                user.setLastName(rs.getString("LastName"));

                // Create OrderTable object
                OrderTable order = new OrderTable();
                order.setOrderID(rs.getInt("OrderID"));
                order.setOrderDate(rs.getDate("OrderDate"));
                order.setStatus(rs.getInt("Status"));
                order.setUser(user);

                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orders;
    }

    /**
     * Get order details for a specific order
     */
    public List<OrderDetail> getOrderDetailsByOrderId(int orderId) {
        List<OrderDetail> orderDetails = new ArrayList<>();
        String sql = "SELECT od.OrderID, od.VariantID, od.OrderQuantity, " +
                "pv.Price, pv.Quantity, " +
                "p.ProductID, p.ProductName, p.Description " +
                "FROM [dbo].[OrderDetail] od " +
                "JOIN [dbo].[ProductVariant] pv ON od.VariantID = pv.VariantID " +
                "JOIN [dbo].[Product] p ON pv.ProductID = p.ProductID " +
                "WHERE od.OrderID = ?";

        try {
            PreparedStatement stm = c.prepareStatement(sql);
            stm.setInt(1, orderId);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                // Create Product object
                Product product = new Product();
                product.setProductID(rs.getInt("ProductID"));
                product.setProductName(rs.getString("ProductName"));
                product.setDescription(rs.getString("Description"));
                // Create ProductVariant object
                ProductVariant variant = new ProductVariant();
                variant.setVariantID(rs.getInt("VariantID"));
                variant.setPrice(rs.getDouble("Price"));
                variant.setQuantity(rs.getInt("Quantity")); // Using correct column name
                variant.setProduct(product);

                // Create OrderDetail object
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setVariant(variant);
                orderDetail.setOrderQuantity(rs.getInt("OrderQuantity"));

                orderDetails.add(orderDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderDetails;
    }

    /**
     * Get order by ID
     */
    public OrderTable getOrderById(int orderId) {
        String sql = "SELECT o.OrderID, o.OrderDate, o.Status, " +
                "u.UserID, u.UserName, u.Email, u.FirstName, u.LastName " +
                "FROM [dbo].[OrderTable] o " +
                "JOIN [dbo].[User] u ON o.UserID = u.UserID " +
                "WHERE o.OrderID = ?";

        try {
            PreparedStatement stm = c.prepareStatement(sql);
            stm.setInt(1, orderId);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                // Create User object
                User user = new User();
                user.setUserID(rs.getInt("UserID"));
                user.setUserName(rs.getString("UserName"));
                user.setEmail(rs.getString("Email"));
                user.setFirstName(rs.getString("FirstName"));
                user.setLastName(rs.getString("LastName"));

                // Create OrderTable object
                OrderTable order = new OrderTable();
                order.setOrderID(rs.getInt("OrderID"));
                order.setOrderDate(rs.getDate("OrderDate"));
                order.setStatus(rs.getInt("Status"));
                order.setUser(user);

                return order;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * Calculate total amount for an order
     */
    public double getOrderTotal(int orderId) {
        String sql = "SELECT SUM(od.OrderQuantity * pv.Price) as Total " +
                "FROM [dbo].[OrderDetail] od " +
                "JOIN [dbo].[ProductVariant] pv ON od.VariantID = pv.VariantID " +
                "WHERE od.OrderID = ?";

        try {
            PreparedStatement stm = c.prepareStatement(sql);
            stm.setInt(1, orderId);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                return rs.getDouble("Total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0.0;
    }

    /**
     * Update order status
     */
    public boolean updateOrderStatus(int orderId, int status) {
        String sql = "UPDATE [dbo].[OrderTable] SET Status = ? WHERE OrderID = ?";

        try {
            PreparedStatement stm = c.prepareStatement(sql);
            stm.setInt(1, status);
            stm.setInt(2, orderId);

            int rowsAffected = stm.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Get status text
     */
    public String getStatusText(int status) {
        switch (status) {
            case 0:
                return "Pending";
            case 1:
                return "Completed";
            default:
                return "Unknown";
        }
    }
}
