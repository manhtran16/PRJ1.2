/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repository;

import factory.EntityManagerFactoryProvider;
import jakarta.persistence.EntityManager;
import model.ProductVariant;

/**
 *
 * @author manht
 */
public class ProductVariantDao {
    private EntityManager em;

    public ProductVariantDao() {
        this.em = EntityManagerFactoryProvider.getEntityManagerFactory().createEntityManager();
    }

    public void add(ProductVariant variant) {
        em.getTransaction().begin();
        em.persist(variant);
        em.getTransaction().commit();
    }
}
