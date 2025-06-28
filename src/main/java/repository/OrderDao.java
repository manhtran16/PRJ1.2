package repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import model.OrderTable;
import model.OrderDetail;
import model.ProductVariant;
import factory.EntityManagerFactoryProvider;
import java.util.List;

/**
 * Data Access Object for Order operations
 * Contains only data access methods, business logic moved to OrderService
 */
public class OrderDao {

    private EntityManager em;

    public OrderDao() {
        this.em = EntityManagerFactoryProvider.getEntityManagerFactory().createEntityManager();
    }

    /**
     * Get cart by user ID (order with status = 0)
     */
    public OrderTable getCartByUserId(int userId) {
        try {
            TypedQuery<OrderTable> query = em.createQuery(
                    "SELECT o FROM OrderTable o WHERE o.user.userID = :userId AND o.status = 0",
                    OrderTable.class);
            query.setParameter("userId", userId);
            List<OrderTable> results = query.getResultList();
            return results.isEmpty() ? null : results.get(0);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Create new order
     */
    public OrderTable createOrder(OrderTable order) {
        try {
            em.getTransaction().begin();
            em.persist(order);
            em.getTransaction().commit();
            return order;
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Get order details by order ID with proper joins
     */
    public List<OrderDetail> getOrderDetailsByOrderId(int orderId) {
        try {
            TypedQuery<OrderDetail> query = em.createQuery(
                    "SELECT od FROM OrderDetail od " +
                            "LEFT JOIN FETCH od.variant pv " +
                            "LEFT JOIN FETCH pv.product p " +
                            "LEFT JOIN FETCH pv.attributeValues av " +
                            "LEFT JOIN FETCH av.attribute a " +
                            "WHERE od.order.orderID = :orderId",
                    OrderDetail.class);
            query.setParameter("orderId", orderId);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Get cart item (order detail in cart)
     */
    public OrderDetail getCartItem(int orderId, int variantId) {
        try {
            TypedQuery<OrderDetail> query = em.createQuery(
                    "SELECT od FROM OrderDetail od WHERE od.order.orderID = :orderId AND od.id.variantId = :variantId",
                    OrderDetail.class);
            query.setParameter("orderId", orderId);
            query.setParameter("variantId", variantId);
            List<OrderDetail> results = query.getResultList();
            return results.isEmpty() ? null : results.get(0);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Create order detail
     */
    public boolean createOrderDetail(OrderDetail orderDetail) {
        try {
            em.getTransaction().begin();

            // Load the ProductVariant from the database to avoid detached entity issue
            if (orderDetail.getId() != null && orderDetail.getId().getVariantId() != 0) {
                ProductVariant variant = em.find(ProductVariant.class, orderDetail.getId().getVariantId());
                if (variant != null) {
                    orderDetail.setVariant(variant);
                }
            }

            em.persist(orderDetail);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Update cart item quantity
     */
    public boolean updateCartItemQuantity(int orderId, int variantId, int newQuantity) {
        try {
            em.getTransaction().begin();
            int updated = em.createQuery(
                    "UPDATE OrderDetail od SET od.orderQuantity = :quantity " +
                            "WHERE od.order.orderID = :orderId AND od.id.variantId = :variantId")
                    .setParameter("quantity", newQuantity)
                    .setParameter("orderId", orderId)
                    .setParameter("variantId", variantId)
                    .executeUpdate();
            em.getTransaction().commit();
            return updated > 0;
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Remove cart item
     */
    public boolean removeCartItem(int orderId, int variantId) {
        try {
            em.getTransaction().begin();
            int deleted = em.createQuery(
                    "DELETE FROM OrderDetail od WHERE od.order.orderID = :orderId AND od.variant.variantID = :variantId")
                    .setParameter("orderId", orderId)
                    .setParameter("variantId", variantId)
                    .executeUpdate();
            em.getTransaction().commit();
            System.out.println(
                    "Deleted " + deleted + " cart items for orderId: " + orderId + ", variantId: " + variantId);
            return deleted > 0;
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            System.err.println("Error removing cart item: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Clear all items from cart
     */
    public boolean clearCart(int orderId) {
        try {
            em.getTransaction().begin();
            int deleted = em.createQuery(
                    "DELETE FROM OrderDetail od WHERE od.order.orderID = :orderId")
                    .setParameter("orderId", orderId)
                    .executeUpdate();
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Get order total amount
     */
    public double getOrderTotal(int orderId) {
        try {
            TypedQuery<Double> query = em.createQuery(
                    "SELECT SUM(od.orderQuantity * od.variant.price) FROM OrderDetail od WHERE od.order.orderID = :orderId",
                    Double.class);
            query.setParameter("orderId", orderId);
            Double result = query.getSingleResult();
            return result != null ? result : 0.0;
        } catch (Exception e) {
            e.printStackTrace();
            return 0.0;
        }
    }

    /**
     * Update order status
     */
    public boolean updateOrderStatus(int orderId, int newStatus) {
        try {
            em.getTransaction().begin();
            int updated = em.createQuery(
                    "UPDATE OrderTable o SET o.status = :status WHERE o.orderID = :orderId")
                    .setParameter("status", newStatus)
                    .setParameter("orderId", orderId)
                    .executeUpdate();
            em.getTransaction().commit();
            return updated > 0;
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Get orders by user ID (excluding cart orders)
     */
    public List<OrderTable> getOrdersByUserId(int userId) {
        try {
            TypedQuery<OrderTable> query = em.createQuery(
                    "SELECT o FROM OrderTable o WHERE o.user.userID = :userId AND o.status > 0 ORDER BY o.orderDate DESC",
                    OrderTable.class);
            query.setParameter("userId", userId);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Get order by ID
     */
    public OrderTable getOrderById(int orderId) {
        try {
            return em.find(OrderTable.class, orderId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Close EntityManager
     */
    public void close() {
        if (em != null && em.isOpen()) {
            em.close();
        }
    }
}