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
@IdClass(VariantAttributeKey.class)
public class VariantAttributeValue {
    @Id
    @ManyToOne
    @JoinColumn(name = "variantID")
    private ProductVariant variant;

    @Id
    @ManyToOne
    @JoinColumn(name = "attributeID")
    private Attribute attribute;

    private String value;

    public VariantAttributeValue() {
    }

    public VariantAttributeValue(ProductVariant variant, Attribute attribute, String value) {
        this.variant = variant;
        this.attribute = attribute;
        this.value = value;
    }

    public ProductVariant getVariant() {
        return variant;
    }

    public void setVariant(ProductVariant variant) {
        this.variant = variant;
    }

    public Attribute getAttribute() {
        return attribute;
    }

    public void setAttribute(Attribute attribute) {
        this.attribute = attribute;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
    
    
}