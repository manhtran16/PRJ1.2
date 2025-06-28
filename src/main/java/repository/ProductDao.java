package repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import model.Product;
import model.ProductVariant;
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
        // Clear any cached metadata to refresh schema changes
        try {
            em.getEntityManagerFactory().getCache().evictAll();
        } catch (Exception e) {
            // Ignore cache clear errors
        }
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
        try {
            TypedQuery<Product> query = em.createQuery(
                    "SELECT DISTINCT p FROM Product p " +
                            "LEFT JOIN FETCH p.brand " +
                            "LEFT JOIN FETCH p.type " +
                            "LEFT JOIN FETCH p.variants",
                    Product.class);
            List<Product> products = query.getResultList();

            // Ensure variants are loaded for each product
            for (Product product : products) {
                if (product.getVariants() != null) {
                    product.getVariants().size(); // Trigger lazy loading
                }
            }

            return products;
        } catch (Exception e) {
            System.err.println("Error loading all products: " + e.getMessage());
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    public Product getProductWithDetails(int productId) {
        try {
            // Use a simple query approach that works reliably
            TypedQuery<Product> query = em.createQuery(
                    "SELECT p FROM Product p " +
                            "LEFT JOIN FETCH p.brand " +
                            "LEFT JOIN FETCH p.type " +
                            "LEFT JOIN FETCH p.variants " +
                            "WHERE p.productID = :productId",
                    Product.class);
            query.setParameter("productId", productId);

            List<Product> results = query.getResultList();
            if (results.isEmpty()) {
                return null;
            }

            Product product = results.get(0);

            // Fully load all variant data to prevent lazy loading issues
            if (product.getVariants() != null) {
                product.getVariants().size();

                // Fully initialize all variant collections
                for (var variant : product.getVariants()) {
                    // Load attribute values
                    if (variant.getAttributeValues() != null) {
                        variant.getAttributeValues().size();
                        for (var attrValue : variant.getAttributeValues()) {
                            // Access attribute to ensure it's loaded
                            if (attrValue.getAttribute() != null) {
                                attrValue.getAttribute().getAttributeName();
                            }
                        }
                    }

                    // Load images if they exist
                    if (variant.getImages() != null) {
                        variant.getImages().size();
                    }
                }

                // Detach the entity from the EntityManager context to make it fully independent
                em.detach(product);

                // Force the variants collection to be a concrete ArrayList to avoid proxy
                // issues
                List<model.ProductVariant> concreteVariants = new ArrayList<>(product.getVariants());

                // Also ensure all nested collections in variants are concrete
                for (var variant : concreteVariants) {
                    if (variant.getAttributeValues() != null) {
                        List<model.VariantAttributeValue> concreteAttributeValues = new ArrayList<>(
                                variant.getAttributeValues());
                        variant.setAttributeValues(concreteAttributeValues);
                    }
                    if (variant.getImages() != null) {
                        List<model.Image> concreteImages = new ArrayList<>(variant.getImages());
                        variant.setImages(concreteImages);
                    }
                }

                product.setVariants(concreteVariants);
            }

            return product;

        } catch (Exception e) {
            System.err.println("Error in getProductWithDetails: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    // Alternative simple method - loads only basic product info without
    // relationships
    public Product getProductBasic(int productId) {
        try {
            // Create a very simple query that only selects product fields
            TypedQuery<Product> query = em.createQuery(
                    "SELECT NEW Product(p.productID, p.productName, p.description) FROM Product p WHERE p.productID = :productId",
                    Product.class);
            query.setParameter("productId", productId);

            List<Product> results = query.getResultList();
            return results.isEmpty() ? null : results.get(0);

        } catch (Exception e) {
            System.err.println("Error in getProductBasic: " + e.getMessage());
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

    public ProductVariant getVariantWithDetails(int variantId) {
        try {
            // Sử dụng em.find() đơn giản và hiệu quả nhất
            ProductVariant variant = em.find(ProductVariant.class, variantId);

            if (variant != null) {
                // Trigger lazy loading cho các relationships cần thiết
                if (variant.getProduct() != null) {
                    variant.getProduct().getProductName(); // Load product info

                    // Load brand and type if exists
                    if (variant.getProduct().getBrand() != null) {
                        variant.getProduct().getBrand().getBrandName();
                    }
                    if (variant.getProduct().getType() != null) {
                        variant.getProduct().getType().getTypeName();
                    }
                }

                // Load attribute values
                if (variant.getAttributeValues() != null) {
                    variant.getAttributeValues().size(); // Trigger loading
                    for (var attrValue : variant.getAttributeValues()) {
                        if (attrValue.getAttribute() != null) {
                            attrValue.getAttribute().getAttributeName(); // Load attribute info
                        }
                    }
                }

                // Load images if exist
                if (variant.getImages() != null) {
                    variant.getImages().size(); // Trigger loading
                }
            }

            return variant;

        } catch (Exception e) {
            System.err.println("Error in getVariantWithDetails: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
}
