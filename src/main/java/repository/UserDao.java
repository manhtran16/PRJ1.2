package repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.NoResultException;
import java.util.List;
import model.User;
import factory.EntityManagerFactoryProvider;

public class UserDao {

    private EntityManager em;

    public UserDao() {
        em = EntityManagerFactoryProvider.getEntityManagerFactory().createEntityManager();
    }

    public List<User> getAllUsers() {
        try {
            TypedQuery<User> query = em.createQuery("SELECT u FROM User u", User.class);
            return query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public int checkLoginUser(String email, String password) {
        try {
            TypedQuery<String> query = em.createQuery(
                    "SELECT u.password FROM User u WHERE u.email = :email", String.class);
            query.setParameter("email", email);
            String storedPassword = query.getSingleResult();

            if (storedPassword.equals(password)) {
                return 0; // đúng
            } else {
                return 1; // sai mật khẩu
            }
        } catch (NoResultException e) {
            return 2; // không tồn tại
        } catch (Exception e) {
            e.printStackTrace();
            return -1; // lỗi
        }
    }

    public User getUserByUserName(String userName) {
        try {
            TypedQuery<User> query = em.createQuery(
                    "SELECT u FROM User u WHERE u.userName = :userName", User.class);
            query.setParameter("userName", userName);
            return query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public User getUserByEmail(String email) {
        try {
            TypedQuery<User> query = em.createQuery(
                    "SELECT u FROM User u WHERE u.email = :email", User.class);
            query.setParameter("email", email);
            return query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public void createUser(User user, String password) {
        try {
            em.getTransaction().begin();
            user.setPassword(password);
            em.persist(user);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive())
                em.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    public void close() {
        if (em != null && em.isOpen()) {
            em.close();
        }
    }
}
