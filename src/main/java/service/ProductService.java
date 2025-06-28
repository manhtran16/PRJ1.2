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

            // Lưu sản phẩm
            em.persist(product);
            
            System.out.println("1");
            for (ProductVariant variant : variants) {
                variant.setProduct(product);
                System.out.println(variant);
                em.persist(variant); // sinh ID
                
                System.out.println("2");
                // Lưu các giá trị thuộc tính (variant-attribute-value)
                int count=0;
                if (variant.getAttributeValues() != null) {
                    for (VariantAttributeValue vav : variant.getAttributeValues()) {
                        // Lấy attribute managed từ DB
                        System.out.println(count);
                        if (vav.getAttribute() != null && vav.getAttribute().getAttributeID() != 0) {
                            Attribute managedAttribute = em.find(Attribute.class, vav.getAttribute().getAttributeID());
                            
                            vav.setAttribute(managedAttribute); // Đảm bảo attribute là managed
                        } else {
                            throw new IllegalArgumentException("Thiếu attribute ID trong VariantAttributeValue");
                        }

                        vav.setVariant(variant);

                        // Đảm bảo id không null và có đủ giá trị
                        if (vav.getId() == null) {
                            vav.setId(new VariantAttributeKey(
                                variant.getVariantID(),
                                vav.getAttribute().getAttributeID()
                            ));
                        } else {
                            vav.getId().setVariantId(variant.getVariantID());
                            vav.getId().setAttributeId(vav.getAttribute().getAttributeID());
                        }
                        count ++;
                        em.persist(vav); // Chỉ persist vav, KHÔNG persist attribute!
                    }
                }

                // Lưu các ảnh
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
            if (tx.isActive()) tx.rollback();
            return false;
        } finally {
            em.close();
        }
    }
}
