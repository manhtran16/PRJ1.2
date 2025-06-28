package repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import model.OrderTable;
import model.OrderDetail;
import factory.EntityManagerFactoryProvider;
import java.util.List;

public class OrderDao {

    private EntityManager em;

    public OrderDao() {
        this.em = EntityManagerFactoryProvider.getEntityManagerFactory().createEntityManager();
    }

    public List<OrderTable> getOrdersByUserId(int userId) {
        try {
            TypedQuery<OrderTable> query = em.createQuery(
                    "SELECT o FROM OrderTable o WHERE o.user.userID = :userId ORDER BY o.orderDate DESC",
                    OrderTable.class);
            query.setParameter("userId", userId);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public OrderTable getOrderById(int orderId) {
        try {
            return em.find(OrderTable.class, orderId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<OrderDetail> getOrderDetailsByOrderId(int orderId) {
        try {
            TypedQuery<OrderDetail> query = em.createQuery(
                    "SELECT od FROM OrderDetail od " +
                            "LEFT JOIN FETCH od.productVariant pv " +
                            "LEFT JOIN FETCH pv.product p " +
                            "WHERE od.orderTable.orderID = :orderId",
                    OrderDetail.class);
            query.setParameter("orderId", orderId);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public double getOrderTotal(int orderId) {
        try {
            TypedQuery<Double> query = em.createQuery(
                    "SELECT SUM(od.quantity * od.price) FROM OrderDetail od WHERE od.orderTable.orderID = :orderId",
                    Double.class);
            query.setParameter("orderId", orderId);
            Double result = query.getSingleResult();
            return result != null ? result : 0.0;
        } catch (Exception e) {
            e.printStackTrace();
            return 0.0;
        }
    }

    public String getStatusText(int status) {
        switch (status) {
            case 1:
                return "Pending";
            case 2:
                return "Processing";
            case 3:
                return "Shipped";
            case 4:
                return "Delivered";
            case 5:
                return "Cancelled";
            default:
                return "Unknown";
        }
    }

    public void close() {
        if (em != null && em.isOpen()) {
            em.close();
        }
    }
}
