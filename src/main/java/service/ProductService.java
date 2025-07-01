package service;

import repository.ProductDAO;
import model.Product;
import model.ProductVariant;
import model.Image;
import model.Attribute;
import model.VariantAttributeKey;
import model.VariantAttributeValue;

import java.util.List;

import factory.EntityManagerFactoryProvider;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.util.ArrayList;

/**
 * Product Service Layer - handles business logic for products
 */
public class ProductService {

    private ProductDAO productDao;

    public ProductService() {
        this.productDao = new ProductDAO();
    }

    /**
     * Get variant with details and validation
     */
    public ProductVariant getVariantWithDetails(int variantId) {
        if (variantId <= 0) {
            throw new IllegalArgumentException("Invalid variant ID");
        }

        ProductVariant variant = productDao.getVariantWithDetails(variantId);

        // Apply business logic - check stock, validate price, etc.
        if (variant != null) {
            // You could add stock validation, price checks, etc. here
        }

        return variant;
    }

    /**
     * Get all products with validation and business logic
     */
    public List<Product> getAllProducts() {
        try {
            List<Product> products = productDao.getAllProducts();
            return products != null ? products : new ArrayList<>();
        } catch (Exception e) {
            System.err.println("Error in ProductService.getAllProducts: " + e.getMessage());
            return new ArrayList<>();
        }
    }

    /**
     * Get product with full details for display
     */
    public Product getProductWithDetails(int productId) {
        if (productId <= 0) {
            throw new IllegalArgumentException("Invalid product ID");
        }

        Product product = productDao.getProductWithDetails(productId);
        if (product == null) {
            return null;
        }

        // Apply business logic - filter out inactive variants, sort variants, etc.
        if (product.getVariants() != null) {
            // Here you could add business rules like filtering inactive variants
            // or sorting variants by price, popularity, etc.
        }

        return product;
    }

    public boolean addFullProduct(Product product, List<ProductVariant> variants) {
        EntityManager em = EntityManagerFactoryProvider.getEntityManagerFactory().createEntityManager();
        EntityTransaction tx = em.getTransaction();

        try {
            tx.begin();

            // Lưu sản phẩm chính
            em.persist(product);

            for (ProductVariant variant : variants) {
                // Gán product cho variant
                variant.setProduct(product);


                em.persist(variant);
                em.flush(); // Đảm bảo variantID có
                System.out.println("After flush - Variant ID: " + variant.getVariantID());
                // Xử lý các giá trị thuộc tính
                List<VariantAttributeValue> attributeValues = variant.getAttributeValues();
                if (attributeValues != null) {
                    for (VariantAttributeValue vav : attributeValues) {
                        // Kiểm tra kỹ attribute trước khi sử dụng
                        System.out.println("1");
                        if (vav.getAttribute() == null || vav.getAttribute().getAttributeID() == 0) {
                            throw new IllegalArgumentException("❌ Thiếu hoặc sai attribute ID trong VariantAttributeValue");
                        }
                        System.out.println("2");
                        // Lấy attribute từ DB (managed)
                        int attrId = vav.getAttribute().getAttributeID();
                        Attribute managedAttr = em.getReference(Attribute.class, attrId);
                        vav.setAttribute(managedAttr);

                        // Gán variant
                        vav.setVariant(variant);


                        // Đảm bảo id không null và có đủ giá trị
                        if (vav.getId() == null) {
                            vav.setId(new VariantAttributeKey(
                                    variant.getVariantID(),
                                    vav.getAttribute().getAttributeID()));
                        } else {
                            vav.getId().setVariantId(variant.getVariantID());
                            vav.getId().setAttributeId(vav.getAttribute().getAttributeID());
                        }

                        em.persist(vav); // Chỉ persist vav, KHÔNG persist attribute!
                    }
                }
                // Lưu variant → sinh ID
                System.out.println("5");

                // Lưu ảnh nếu có
                if (variant.getImages() != null) {
                    for (Image image : variant.getImages()) {
                        image.setVariant(variant);
                        em.persist(image);
                    }
                }
            }

            tx.commit();
            return true;

        } catch (Exception e) {
            System.err.println("❌ Lỗi khi thêm sản phẩm: " + e.getMessage());
            e.printStackTrace();
            if (tx.isActive()) {
                tx.rollback();
            }

            return false;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    /**
     * Search and filter products
     */
    public List<Product> searchAndFilterProducts(String searchQuery, Integer brandId, Integer typeId,
            Double minPrice, Double maxPrice) {
        try {
            List<Product> products = productDao.searchAndFilterProducts(searchQuery, brandId, typeId, minPrice,
                    maxPrice);
            return products != null ? products : new ArrayList<>();
        } catch (Exception e) {
            System.err.println("Error in ProductService.searchAndFilterProducts: " + e.getMessage());
            return new ArrayList<>();
        }
    }

    /**
     * Close resources
     */
    public void close() {
        if (productDao != null) {
            productDao.close();
        }
    }

}
