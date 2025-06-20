/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;

/**
 *
 * @author manht
 */
public class OrderDetailKey implements Serializable {
    private int order;
    private int variant;

    public OrderDetailKey() {
    }

    public OrderDetailKey(int order, int variant) {
        this.order = order;
        this.variant = variant;
    }

    public int getOrder() {
        return order;
    }

    public void setOrder(int order) {
        this.order = order;
    }

    public int getVariant() {
        return variant;
    }

    public void setVariant(int variant) {
        this.variant = variant;
    }

    
    // equals, hashCode (generated)

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 47 * hash + this.order;
        hash = 47 * hash + this.variant;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final OrderDetailKey other = (OrderDetailKey) obj;
        if (this.order != other.order) {
            return false;
        }
        return this.variant == other.variant;
    }
}
