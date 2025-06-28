package dal;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.NoResultException;
import model.Rating;
import model.User;
import model.Product;
import factory.EntityManagerFactoryProvider;
import java.util.List;

public class RatingDao {
    
    private EntityManager em;

    public RatingDao() {
        em = EntityManagerFactoryProvider.getEntityManagerFactory().createEntityManager();
    }
    
    // Get all ratings for a specific product
    public List<Rating> getRatingsByProductId(int productId) {
        try {
            TypedQuery<Rating> query = em.createQuery(
                "SELECT r FROM Rating r WHERE r.product.productID = ? ORDER BY r.ratingId DESC", 
                Rating.class);
            query.setParameter(1, productId);
            return query.getResultList();
        } catch (Exception e) {
            System.out.println("Error getting ratings: " + e.getMessage());
            return null;
        }
    }
    
    // Get average rating for a product
    public Double getAverageRatingByProductId(int productId) {
        try {
            TypedQuery<Double> query = em.createQuery(
                "SELECT AVG(r.rate) FROM Rating r WHERE r.product.productID = ?", 
                Double.class);
            query.setParameter(1, productId);
            Double result = query.getSingleResult();
            return result != null ? result : 0.0;
        } catch (Exception e) {
            System.out.println("Error getting average rating: " + e.getMessage());
            return 0.0;
        }
    }
    
    // Get total number of ratings for a product
    public Long getTotalRatingsByProductId(int productId) {
        try {
            TypedQuery<Long> query = em.createQuery(
                "SELECT COUNT(r) FROM Rating r WHERE r.product.productID = ?", 
                Long.class);
            query.setParameter(1, productId);
            return query.getSingleResult();
        } catch (Exception e) {
            System.out.println("Error getting total ratings: " + e.getMessage());
            return 0L;
        }
    }
    
    // Check if user has already rated a product
    public boolean hasUserRatedProduct(int userId, int productId) {
        try {
            TypedQuery<Long> query = em.createQuery(
                "SELECT COUNT(r) FROM Rating r WHERE r.user.userID = ? AND r.product.productID = ?", 
                Long.class);
            query.setParameter(1, userId);
            query.setParameter(2, productId);
            return query.getSingleResult() > 0;
        } catch (Exception e) {
            System.out.println("Error checking user rating: " + e.getMessage());
            return false;
        }
    }
    
    // Add new rating
    public boolean addRating(int userId, int productId, int rate, String comment) {
        try {
            // Check if user has already rated this product
            if (hasUserRatedProduct(userId, productId)) {
                return false; // User has already rated this product
            }
            
            em.getTransaction().begin();
            
            // Get User and Product entities
            User user = em.find(User.class, userId);
            Product product = em.find(Product.class, productId);
            
            if (user == null || product == null) {
                em.getTransaction().rollback();
                return false;
            }
            
            Rating rating = new Rating(user, product, rate, comment);
            em.persist(rating);
            em.getTransaction().commit();
            
            return true;
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            System.out.println("Error adding rating: " + e.getMessage());
            return false;
        }
    }
    
    // Update existing rating
    public boolean updateRating(int userId, int productId, int rate, String comment) {
        try {
            em.getTransaction().begin();
            
            TypedQuery<Rating> query = em.createQuery(
                "SELECT r FROM Rating r WHERE r.user.userID = ? AND r.product.productID = ?", 
                Rating.class);
            query.setParameter(1, userId);
            query.setParameter(2, productId);
            
            Rating rating = query.getSingleResult();
            rating.setRate(rate);
            rating.setComment(comment);
            
            em.merge(rating);
            em.getTransaction().commit();
            
            return true;
        } catch (NoResultException e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            return false;
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            System.out.println("Error updating rating: " + e.getMessage());
            return false;
        }
    }
    
    // Get user's rating for a specific product
    public Rating getUserRatingForProduct(int userId, int productId) {
        try {
            TypedQuery<Rating> query = em.createQuery(
                "SELECT r FROM Rating r WHERE r.user.userID = ? AND r.product.productID = ?", 
                Rating.class);
            query.setParameter(1, userId);
            query.setParameter(2, productId);
            return query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        } catch (Exception e) {
            System.out.println("Error getting user rating: " + e.getMessage());
            return null;
        }
    }
}
