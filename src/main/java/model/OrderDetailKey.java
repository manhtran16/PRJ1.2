package model;

import jakarta.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class OrderDetailKey implements Serializable {

    private int orderId;
    private int variantId;

    public OrderDetailKey() {
    }

    public OrderDetailKey(int orderId, int variantId) {
        this.orderId = orderId;
        this.variantId = variantId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getVariantId() {
        return variantId;
    }

    public void setVariantId(int variantId) {
        this.variantId = variantId;
    }

    @Override
    public int hashCode() {
        return Objects.hash(orderId, variantId);
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (!(obj instanceof OrderDetailKey)) return false;
        OrderDetailKey other = (OrderDetailKey) obj;
        return orderId == other.orderId && variantId == other.variantId;
    }
}
