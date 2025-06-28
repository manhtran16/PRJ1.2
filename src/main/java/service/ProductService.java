package service;

import factory.EntityManagerFactoryProvider;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import model.*;

import java.util.List;

public class ProductService {

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
                        System.out.println("3");
                        // Tạo khóa chính composite (không được null!)
                        VariantAttributeKey key = new VariantAttributeKey(
                                variant.getVariantID(),
                                managedAttr.getAttributeID()
                        );
                        vav.setId(key);

                        System.out.println("4");
                        System.out.println("=== DEBUG ===");
                        System.out.println("Variant ID: " + variant.getVariantID());
                        System.out.println("Attribute ID: " + vav.getAttribute().getAttributeID());
                        System.out.println("VAV ID before persist: " + vav.getId());
                        System.out.println("VAV Attribute: " + vav.getAttribute());
                        System.out.println("VAV Variant: " + vav.getVariant());
                        em.persist(vav);

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
            e.printStackTrace();
            System.err.println("❌ Lỗi khi thêm sản phẩm: " + e.getMessage());
            for (Throwable t = e; t != null; t = t.getCause()) {
                System.err.println("❌ Nguyên nhân: " + t.getClass().getName() + ": " + t.getMessage());
            }
            if (tx.isActive()) {
                tx.rollback();
            }
            return false;
        } finally {
            em.close();
        }
    }

}
