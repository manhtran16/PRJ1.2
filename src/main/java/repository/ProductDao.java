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
            // First, get products with variants
            TypedQuery<Product> query = em.createQuery(
                    "SELECT DISTINCT p FROM Product p " +
                            "LEFT JOIN FETCH p.variants " +
                            "ORDER BY p.productName",
                    Product.class);
            List<Product> products = query.getResultList();

            // Then fetch images for each variant
            for (Product product : products) {
                if (product.getVariants() != null) {
                    for (ProductVariant variant : product.getVariants()) {
                        // This will trigger lazy loading of images
                        variant.getImages().size();
                    }
                }
            }
            return products;
        } catch (Exception e) {
            System.err.println("ERROR in getAllProducts: " + e.getMessage());
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
     * Close EntityManager
     */
    public void close() {
        if (em != null && em.isOpen()) {
            em.close();
        }
    }
}
