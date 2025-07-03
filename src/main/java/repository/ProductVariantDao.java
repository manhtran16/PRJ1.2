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
 * @author admin
 */
public class ProductVariantDAO {
    private EntityManager em;

    public ProductVariantDAO() {
        this.em = EntityManagerFactoryProvider.getEntityManagerFactory().createEntityManager();
    }

    public void add(ProductVariant variant) {
        em.getTransaction().begin();
        em.persist(variant);
        em.getTransaction().commit();
    }

    /**
     * Update stock quantity for a product variant
     * 
     * @param variantId The variant ID
     * @param quantity  The quantity to subtract from stock
     * @return true if successful, false otherwise
     */
    public boolean updateStock(int variantId, int quantity) {
        System.out.println("=== ProductVariantDAO.updateStock called ===");
        System.out.println("Variant ID: " + variantId);
        System.out.println("Quantity to subtract: " + quantity);

        try {
            System.out.println("Starting transaction...");
            em.getTransaction().begin();

            ProductVariant variant = em.find(ProductVariant.class, variantId);
            if (variant == null) {
                em.getTransaction().rollback();
                System.err.println("ProductVariant not found: " + variantId);
                return false;
            }

            int currentStock = variant.getQuantity();
            System.out.println("Current stock found: " + currentStock);

            if (currentStock < quantity) {
                em.getTransaction().rollback();
                System.err.println("Insufficient stock. Current: " + currentStock + ", Required: " + quantity);
                return false;
            }

            int newStock = currentStock - quantity;
            System.out.println("Setting new stock: " + newStock);
            variant.setQuantity(newStock);

            System.out.println("Merging entity...");
            em.merge(variant);

            System.out.println("Committing transaction...");
            em.getTransaction().commit();

            System.out.println(
                    "SUCCESS: Stock updated for variant " + variantId + ": " + currentStock + " -> " + newStock);
            return true;

        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            System.err.println("ERROR updating stock: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }


    public ProductVariant getById(int variantId) {
        try {
            em.clear();
            return em.find(ProductVariant.class, variantId);
        } catch (Exception e) {
            System.err.println("Error getting variant: " + e.getMessage());
            return null;
        }
    }

    public void close() {
        if (em != null && em.isOpen()) {
            em.close();
        }
    }
}
