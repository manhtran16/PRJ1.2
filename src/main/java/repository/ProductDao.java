package repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import model.Product;
import model.ProductVariant;
import factory.EntityManagerFactoryProvider;
import java.util.List;
import java.util.ArrayList;

/**
 * Product Data Access Object
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

    /**
     * Get all products
     */
    public List<Product> getAllProducts() {
        try {
            TypedQuery<Product> query = em.createQuery(
                    "SELECT p FROM Product p ORDER BY p.productName",
                    Product.class);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    /**
     * Get product with details (variants, images, attributes)
     */
    public Product getProductWithDetails(int productId) {
        try {
            TypedQuery<Product> query = em.createQuery(
                    "SELECT p FROM Product p " +
                            "LEFT JOIN FETCH p.variants pv " +
                            "LEFT JOIN FETCH pv.attributeValues av " +
                            "LEFT JOIN FETCH av.attribute a " +
                            "LEFT JOIN FETCH pv.images img " +
                            "WHERE p.productID = :productId",
                    Product.class);
            query.setParameter("productId", productId);
            return query.getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * Get variant with details (variant, product, attributes)
     */
    public ProductVariant getVariantWithDetails(int variantId) {
        try {
            TypedQuery<ProductVariant> query = em.createQuery(
                    "SELECT pv FROM ProductVariant pv " +
                            "LEFT JOIN FETCH pv.product p " +
                            "LEFT JOIN FETCH pv.attributeValues av " +
                            "LEFT JOIN FETCH av.attribute a " +
                            "WHERE pv.variantID = :variantId",
                    ProductVariant.class);
            query.setParameter("variantId", variantId);
            return query.getSingleResult();
        } catch (Exception e) {
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
