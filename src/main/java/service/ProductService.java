package service;

import repository.ProductDAO;
import model.Product;
import model.ProductVariant;
import model.Image;
import model.Attribute;
import model.VariantAttributeKey;
import model.VariantAttributeValue;

import java.util.List;
import java.util.stream.Collectors;

import factory.EntityManagerFactoryProvider;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.util.ArrayList;
import model.Brand;
import model.Type;

/**
 * Product Service Layer - xu ly logic nghiep vu
 */
public class ProductService {

    private ProductDAO productDAO;

    public ProductService() {
        this.productDAO = new ProductDAO();
    }

    /**
     * lay thong tin chi tiet variant theo ID
     */
    public ProductVariant getVariantWithDetails(int variantId) {
        if (variantId <= 0) {
            throw new IllegalArgumentException("Invalid variant ID");
        }

        ProductVariant variant = productDAO.getVariantWithDetails(variantId);
        if (variant != null) {
        }

        return variant;
    }

    /**
     * Get all products with validation and business logic
     */
    public List<Product> getAllProducts() {
        try {

            List<Product> products = productDAO.getAllProducts();
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

        Product product = productDAO.getProductWithDetails(productId);
        if (product == null) {
            return null;
        }

        // Apply business logic - filter out inactive variants, sort variants, etc.
        if (product.getVariants() != null) {
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
                        System.out.println("1");
                        if (vav.getAttribute() == null || vav.getAttribute().getAttributeID() == 0) {
                            throw new IllegalArgumentException(
                                    "❌ Thiếu hoặc sai attribute ID trong VariantAttributeValue");
                        }
                        System.out.println("2");
                        int attrId = vav.getAttribute().getAttributeID();
                        Attribute managedAttr = em.getReference(Attribute.class, attrId);
                        vav.setAttribute(managedAttr);
                        vav.setVariant(variant);

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

                System.out.println("5");
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
            List<Product> products = productDAO.searchAndFilterProducts(searchQuery, brandId, typeId, minPrice,
                    maxPrice);
            if (products != null) {
                for (Product p : products) {
                    if (p.getVariants() == null) {
                        p.setVariants(new ArrayList<>());
                    }
                }
            }
            return products != null ? products : new ArrayList<>();
        } catch (Exception e) {
            System.err.println("Error in ProductService.searchAndFilterProducts: " + e.getMessage());
            return new ArrayList<>();
        }
    }

    /**
     * Tìm kiếm sản phẩm theo tên (dùng cho update product)
     */
    public List<Product> searchProductsByName(String productName) {
        if (productName == null || productName.trim().isEmpty()) {
            return new ArrayList<>();
        }
        // Có thể tối ưu bằng truy vấn DAO, nhưng nếu chưa có thì lọc từ getAllProducts
        List<Product> allProducts = getAllProducts();
        String lower = productName.trim().toLowerCase();
        return allProducts.stream()
                .filter(p -> p.getProductName() != null && p.getProductName().toLowerCase().contains(lower))
                .collect(Collectors.toList());
    }

    /**
     * Close resources
     */
    public void close() {
        if (productDAO != null) {
            productDAO.close();
        }
    }

    public boolean updateFullProduct(
            int productId,
            String productName,
            String description,
            String[] variantIds,
            String[] variantPrices,
            String[] variantQuantities,
            jakarta.servlet.http.HttpServletRequest request) {
        EntityManager em = EntityManagerFactoryProvider.getEntityManagerFactory().createEntityManager();
        EntityTransaction tx = em.getTransaction();

        try {
            tx.begin();

            // Lấy sản phẩm từ DB
            Product product = em.find(Product.class, productId);
            if (product == null)
                throw new IllegalArgumentException("Không tìm thấy sản phẩm!");

            // Cập nhật thông tin sản phẩm (KHÔNG cập nhật type, brand)
            product.setProductName(productName);
            product.setDescription(description);

            em.merge(product);

            // Cập nhật các biến thể
            for (int i = 0; i < variantIds.length; i++) {
                if (variantIds[i] == null || variantIds[i].isEmpty())
                    continue;
                int variantId = Integer.parseInt(variantIds[i]);
                double price = Double.parseDouble(variantPrices[i]);
                int quantity = Integer.parseInt(variantQuantities[i]);

                ProductVariant variant = em.find(ProductVariant.class, variantId);
                if (variant == null)
                    continue;

                variant.setPrice(price);
                variant.setQuantity(quantity);

                // Cập nhật thuộc tính biến thể
                String[] attrValues = request.getParameterValues("variantAttrValues_" + i);
                String[] attrIds = request.getParameterValues("variantAttrIds_" + i);

                if (attrValues != null && attrIds != null && attrValues.length == attrIds.length) {
                    List<VariantAttributeValue> vavList = variant.getAttributeValues();
                    for (int j = 0; j < attrIds.length; j++) {
                        int attrId = Integer.parseInt(attrIds[j]);
                        String value = attrValues[j];

                        // Tìm VariantAttributeValue tương ứng
                        VariantAttributeValue vav = null;
                        for (VariantAttributeValue item : vavList) {
                            if (item.getAttribute().getAttributeID() == attrId) {
                                vav = item;
                                break;
                            }
                        }
                        if (vav != null) {
                            vav.setValue(value);
                            em.merge(vav);
                        }
                    }
                }

                em.merge(variant);
            }

            tx.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            if (tx.isActive())
                tx.rollback();
            return false;
        } finally {
            em.close();
        }
    }
}
