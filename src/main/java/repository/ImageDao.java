/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repository;

import factory.EntityManagerFactoryProvider;
import jakarta.persistence.EntityManager;
import model.Image;

/**
 *
 * @author manht
 */
public class ImageDao {

    private EntityManager em;

    public ImageDao() {
        this.em = EntityManagerFactoryProvider.getEntityManagerFactory().createEntityManager();
    }

    public void add(Image image) {
        em.getTransaction().begin();
        em.persist(image);
        em.getTransaction().commit();
    }
}
