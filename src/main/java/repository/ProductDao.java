package repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import model.Product;
import factory.EntityManagerFactoryProvider;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author manht
 */
public class ProductDao {
    private EntityManager em;

    public ProductDao() {
        this.em = EntityManagerFactoryProvider.getEntityManagerFactory().createEntityManager();
    }

    public void add(Product product) {
        em.getTransaction().begin();
        em.persist(product);
        em.getTransaction().commit();
    }

    public Product findById(int id) {
        return em.find(Product.class, id);
    }

    public List<Product> getAllProducts() {
        TypedQuery<Product> query = em.createQuery(
                "SELECT DISTINCT p FROM Product p " +
                        "LEFT JOIN FETCH p.brand " +
                        "LEFT JOIN FETCH p.type " +
                        "LEFT JOIN FETCH p.variants",
                Product.class);
        return query.getResultList();
    }

    public Product getProductWithDetails(int productId) {
        try {
            System.out.println("ProductDao: Querying product with id = " + productId);

            TypedQuery<Product> query = em.createQuery(
                    "SELECT p FROM Product p " +
                            "LEFT JOIN FETCH p.brand " +
                            "LEFT JOIN FETCH p.type " +
                            "LEFT JOIN FETCH p.variants v " +
                            "LEFT JOIN FETCH v.images " +
                            "WHERE p.productID = :id",
                    Product.class);
            query.setParameter("id", productId);

            List<Product> results = query.getResultList();
            System.out.println("ProductDao: Query returned " + results.size() + " results");

            return results.isEmpty() ? null : results.get(0);
        } catch (Exception e) {
            System.out.println("ProductDao: Exception in getProductWithDetails = " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    public void close() {
        if (em != null && em.isOpen()) {
            em.close();
        }
    }

    public List<Product> getRandomProducts(int limit) {
        try {
            TypedQuery<Product> query = em.createQuery(
                    "SELECT DISTINCT p FROM Product p " +
                            "LEFT JOIN FETCH p.brand " +
                            "LEFT JOIN FETCH p.type " +
                            "ORDER BY FUNCTION('NEWID')",
                    Product.class);
            query.setMaxResults(limit);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }
}
