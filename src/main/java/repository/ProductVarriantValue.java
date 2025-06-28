package repository;

import jakarta.persistence.EntityManager;
import factory.EntityManagerFactoryProvider;

public class ProductVarriantValue {
    private EntityManager em;

    public ProductVarriantValue() {
        this.em = EntityManagerFactoryProvider.getEntityManagerFactory().createEntityManager();
    }

    public void add(ProductVarriantValue value) {
        em.getTransaction().begin();
        em.persist(value);
        em.getTransaction().commit();
    }

    public void close() {
        if (em != null && em.isOpen()) {
            em.close();
        }
    }
}
