package model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.IdClass;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class OrderDetail {

    @EmbeddedId
    private OrderDetailKey id;

    @ManyToOne
    @MapsId("orderId")
    @JoinColumn(name = "orderID")
    private OrderTable order;

    @ManyToOne
    @MapsId("variantId")
    @JoinColumn(name = "variantID")
    private ProductVariant variant;

    private int orderQuantity;
}
