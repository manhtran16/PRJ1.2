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
public class ProductDAO {
    private EntityManager em;

    public ProductDAO() {
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
            return em.find(Product.class, productId);
        } catch (Exception e) {
            e.printStackTrace();
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
     * Search and filter products
     */
    public List<Product> searchAndFilterProducts(String searchQuery, Integer brandId, Integer typeId,
            Double minPrice, Double maxPrice) {
        try {
            StringBuilder queryStr = new StringBuilder("SELECT p FROM Product p WHERE 1=1");

            if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                queryStr.append(" AND LOWER(p.productName) LIKE LOWER(:searchQuery)");
            }

            if (brandId != null && brandId > 0) {
                queryStr.append(" AND p.brand.brandID = :brandId");
            }

            if (typeId != null && typeId > 0) {
                queryStr.append(" AND p.type.typeID = :typeId");
            }

            // For price filtering, we need to join with variants
            if (minPrice != null || maxPrice != null) {
                queryStr.append(" AND EXISTS (SELECT v FROM ProductVariant v WHERE v.product = p");
                if (minPrice != null) {
                    queryStr.append(" AND v.price >= :minPrice");
                }
                if (maxPrice != null) {
                    queryStr.append(" AND v.price <= :maxPrice");
                }
                queryStr.append(")");
            }

            queryStr.append(" ORDER BY p.productName");

            TypedQuery<Product> query = em.createQuery(queryStr.toString(), Product.class);

            // Set parameters
            if (searchQuery != null && !searchQuery.trim().isEmpty()) {
                query.setParameter("searchQuery", "%" + searchQuery.trim() + "%");
            }

            if (brandId != null && brandId > 0) {
                query.setParameter("brandId", brandId);
            }

            if (typeId != null && typeId > 0) {
                query.setParameter("typeId", typeId);
            }

            if (minPrice != null) {
                query.setParameter("minPrice", minPrice);
            }

            if (maxPrice != null) {
                query.setParameter("maxPrice", maxPrice);
            }

            return query.getResultList();

        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    /**
     * Get total number of products
     */
    public long getTotalProducts() {
        try {
            TypedQuery<Long> query = em.createQuery(
                "SELECT COUNT(p) FROM Product p", Long.class
            );
            return query.getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
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
