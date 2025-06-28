package model;

import jakarta.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class VariantAttributeKey implements Serializable {
    private int variantId;
    private int attributeId;

    public VariantAttributeKey() {}

    public VariantAttributeKey(int variantId, int attributeId) {
        this.variantId = variantId;
        this.attributeId = attributeId;
    }

    public int getVariantId() {
        return variantId;
    }

    public void setVariantId(int variantId) {
        this.variantId = variantId;
    }

    public int getAttributeId() {
        return attributeId;
    }

    public void setAttributeId(int attributeId) {
        this.attributeId = attributeId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof VariantAttributeKey)) return false;
        VariantAttributeKey that = (VariantAttributeKey) o;
        return variantId == that.variantId && attributeId == that.attributeId;
    }

    @Override
    public int hashCode() {
        return Objects.hash(variantId, attributeId);
    }
}
