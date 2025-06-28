package model;

import jakarta.persistence.*;

@Entity
public class VariantAttributeValue {

    @EmbeddedId
    private VariantAttributeKey id;

    @ManyToOne
    @MapsId("variantId")
    @JoinColumn(name = "variantID")
    private ProductVariant variant;

    @ManyToOne
    @MapsId("attributeId")
    @JoinColumn(name = "attributeID")
    private Attribute attribute;

    private String value;

    public VariantAttributeValue() {}

    public VariantAttributeValue(ProductVariant variant, Attribute attribute, String value) {
        this.variant = variant;
        this.attribute = attribute;
        this.value = value;
        if (variant != null && attribute != null) {
            this.id = new VariantAttributeKey(variant.getVariantID(), attribute.getAttributeID());
        }
    }

    public VariantAttributeKey getId() {
        return id;
    }

    public void setId(VariantAttributeKey id) {
        this.id = id;
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
