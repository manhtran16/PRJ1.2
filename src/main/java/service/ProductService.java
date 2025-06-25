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

            // Thêm sản phẩm
            em.persist(product);

            for (ProductVariant variant : variants) {
                variant.setProduct(product);
                em.persist(variant); // persist để lấy được variantID

                // Thêm thuộc tính (size, màu)
                if (variant.getAttributeValues() != null) {
                    for (VariantAttributeValue vav : variant.getAttributeValues()) {
                        vav.setVariant(variant);
                        vav.setId(new VariantAttributeKey(
                                variant.getVariantID(),
                                vav.getAttribute().getAttributeID()
                        ));
                        em.persist(vav);
                    }
                }

                // Thêm ảnh nếu có
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
            if (tx.isActive()) tx.rollback();
            return false;
        } finally {
            em.close();
        }
    }
}
