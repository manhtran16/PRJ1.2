/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

// File: VariantAttributeKey.java

import java.io.Serializable;

public class VariantAttributeKey implements Serializable {
    private int variant;
    private int attribute;

    public VariantAttributeKey() {
    }

    public VariantAttributeKey(int variant, int attribute) {
        this.variant = variant;
        this.attribute = attribute;
    }

    public int getVariant() {
        return variant;
    }

    public void setVariant(int variant) {
        this.variant = variant;
    }

    public int getAttribute() {
        return attribute;
    }

    public void setAttribute(int attribute) {
        this.attribute = attribute;
    }

    
    // equals, hashCode (generated)

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 97 * hash + this.variant;
        hash = 97 * hash + this.attribute;
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
        final VariantAttributeKey other = (VariantAttributeKey) obj;
        if (this.variant != other.variant) {
            return false;
        }
        return this.attribute == other.attribute;
    }
    
}
