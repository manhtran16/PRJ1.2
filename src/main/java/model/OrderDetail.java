/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
@Entity
@IdClass(OrderDetailKey.class)
public class OrderDetail {
    @Id
    @ManyToOne
    @JoinColumn(name = "orderID")
    private OrderTable order;

    @Id
    @ManyToOne
    @JoinColumn(name = "variantID")
    private ProductVariant variant;

    private int orderQuantity;
}
