package repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import model.Product;
import model.ProductVariant;
import factory.EntityManagerFactoryProvider;
import java.util.List;
import java.util.ArrayList;

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

    public void update(Product product) {
        em.getTransaction().begin();
        em.merge(product);
        em.getTransaction().commit();
    }

    public Product findById(int id) {
        return em.find(Product.class, id);
    }


    public List<Product> getAllProducts() {
        try {
            em.clear();

            TypedQuery<Product> query = em.createQuery(
                    "SELECT DISTINCT p FROM Product p "
                            + "LEFT JOIN FETCH p.variants "
                            + "ORDER BY p.productName",
                    Product.class);
            List<Product> products = query.getResultList();

            for (Product product : products) {
                if (product.getVariants() != null) {
                    for (ProductVariant variant : product.getVariants()) {

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

    public Product getProductWithDetails(int productId) {
        try {
            em.clear();

            TypedQuery<Product> productQuery = em.createQuery(
                    "SELECT DISTINCT p FROM Product p "
                            + "LEFT JOIN FETCH p.brand b "
                            + "LEFT JOIN FETCH p.type t "
                            + "WHERE p.productID = :productId",
                    Product.class);
            productQuery.setParameter("productId", productId);
            Product product = productQuery.getSingleResult();

            if (product != null) {
                TypedQuery<ProductVariant> variantQuery = em.createQuery(
                        "SELECT DISTINCT v FROM ProductVariant v "
                                + "LEFT JOIN FETCH v.images "
                                + "WHERE v.product.productID = :productId",
                        ProductVariant.class);
                variantQuery.setParameter("productId", productId);
                List<ProductVariant> variants = variantQuery.getResultList();

                for (ProductVariant variant : variants) {
                    TypedQuery<ProductVariant> attrQuery = em.createQuery(
                            "SELECT DISTINCT v FROM ProductVariant v "
                                    + "LEFT JOIN FETCH v.attributeValues av "
                                    + "LEFT JOIN FETCH av.attribute a "
                                    + "WHERE v.variantID = :variantId",
                            ProductVariant.class);
                    attrQuery.setParameter("variantId", variant.getVariantID());
                    ProductVariant variantWithAttrs = attrQuery.getSingleResult();
                    variant.setAttributeValues(variantWithAttrs.getAttributeValues());
                }

                product.setVariants(variants);
            }

            return product;
        } catch (Exception e) {
            System.err.println("ERROR in getProductWithDetails: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    public ProductVariant getVariantWithDetails(int variantId) {
        try {
            em.clear();

            TypedQuery<ProductVariant> query = em.createQuery(
                    "SELECT pv FROM ProductVariant pv "
                            + "LEFT JOIN FETCH pv.product p "
                            + "LEFT JOIN FETCH pv.attributeValues av "
                            + "LEFT JOIN FETCH av.attribute a "
                            + "WHERE pv.variantID = :variantId",
                    ProductVariant.class);
            query.setParameter("variantId", variantId);
            return query.getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    public List<Product> searchAndFilterProducts(String searchQuery, Integer brandId, Integer typeId,
            Double minPrice, Double maxPrice) {
        try {
            em.clear();

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

     public long getTotalProducts() {
        try {
            TypedQuery<Long> query = em.createQuery(
                    "SELECT COUNT(p) FROM Product p", Long.class);
            return query.getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

   public void close() {
        if (em != null && em.isOpen()) {
            em.close();
        }
    }
}