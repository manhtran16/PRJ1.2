package repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import model.Brand;
import factory.EntityManagerFactoryProvider;

import java.util.List;

public class BrandDao {

    private EntityManager em;

    public BrandDao() {
        this.em = EntityManagerFactoryProvider.getEntityManagerFactory().createEntityManager();
    }

    // Lấy toàn bộ brand
    public List<Brand> getBrand() {
        try {
            TypedQuery<Brand> query = em.createQuery("SELECT b FROM Brand b", Brand.class);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // Lấy brand theo ID
    public Brand getBrandById(int brandId) {
        try {
            return em.find(Brand.class, brandId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // Đếm số lượng brand trong database
    public int countBrand() {
        try {
            Long count = em.createQuery("SELECT COUNT(b) FROM Brand b", Long.class).getSingleResult();
            return count.intValue();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    // Thêm brand mới
    public boolean createBrand(String brandName) {
        try {
            em.getTransaction().begin();
            Brand brand = new Brand();
            brand.setBrandName(brandName);
            em.persist(brand);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            if (em.getTransaction().isActive())
                em.getTransaction().rollback();
            e.printStackTrace();
            return false;
        }
    }

    // Xóa brand theo ID
    public void deleteBrand(int id) {
        try {
            em.getTransaction().begin();
            Brand brand = em.find(Brand.class, id);
            if (brand != null) {
                em.remove(brand);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive())
                em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    // Cập nhật tên brand
    public void updateBrand(int id, String newName) {
        try {
            em.getTransaction().begin();
            Brand brand = em.find(Brand.class, id);
            if (brand != null) {
                brand.setBrandName(newName);
                em.merge(brand);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive())
                em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public boolean getBrandByName(String brandName) {
        try {
            Long count = em.createQuery(
                "SELECT COUNT(b) FROM Brand b WHERE LOWER(b.brandName) = :name", Long.class)
                .setParameter("name", brandName.trim().toLowerCase())
                .getSingleResult();
            return count > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public void close() {
        if (em != null && em.isOpen()) {
            em.close();
        }
    }
}
