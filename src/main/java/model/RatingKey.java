/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;

public class RatingKey implements Serializable {
    private int user;
    private int product;

    public RatingKey() {
    }

    public RatingKey(int user, int product) {
        this.user = user;
        this.product = product;
    }

    public int getUser() {
        return user;
    }

    public void setUser(int user) {
        this.user = user;
    }

    public int getProduct() {
        return product;
    }

    public void setProduct(int product) {
        this.product = product;
    }

    
    // equals, hashCode (generated)

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 71 * hash + this.user;
        hash = 71 * hash + this.product;
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
        final RatingKey other = (RatingKey) obj;
        if (this.user != other.user) {
            return false;
        }
        return this.product == other.product;
    }
}
