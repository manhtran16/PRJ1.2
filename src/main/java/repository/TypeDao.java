package repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import model.Type;
import factory.EntityManagerFactoryProvider;

import java.util.List;

public class TypeDAO {

    private EntityManager em;

    public TypeDAO() {
        this.em = EntityManagerFactoryProvider.getEntityManagerFactory().createEntityManager();
    }

    // Lấy toàn bộ loại sản phẩm
    public List<Type> getType() {
        try {
            TypedQuery<Type> query = em.createQuery("SELECT t FROM Type t", Type.class);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // Đếm số lượng loại sản phẩm
    public int countType() {
        try {
            Long count = em.createQuery("SELECT COUNT(t) FROM Type t", Long.class).getSingleResult();
            return count.intValue();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    // Tạo mới một loại
    public boolean createType(String typeName) {
        try {
            em.getTransaction().begin();
            Type newType = new Type();
            newType.setTypeName(typeName);
            em.persist(newType);
            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            return false;
        }
    }

    // Xoá loại theo ID
    public void deleteType(int id) {
        try {
            em.getTransaction().begin();
            Type type = em.find(Type.class, id);
            if (type != null) {
                em.remove(type);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
        }
    }

    // Cập nhật tên loại
    public void updateType(int id, String newName) {
        try {
            em.getTransaction().begin();
            Type type = em.find(Type.class, id);
            if (type != null) {
                type.setTypeName(newName);
                em.merge(type);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
        }
    }

    public boolean getTypeByName(String typeName) {
        try {
            Long count = em.createQuery(
                    "SELECT COUNT(b) FROM Brand b WHERE LOWER(b.brandName) = :name", Long.class)
                    .setParameter("name", typeName.trim().toLowerCase())
                    .getSingleResult();
            return count > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Lấy loại sản phẩm theo ID
    public Type getTypeByID(int id) {
        try {
            return em.find(Type.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public void close() {
        if (em != null && em.isOpen()) {
            em.close();

        }
    }
}
