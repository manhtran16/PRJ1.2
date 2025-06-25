package model;

import jakarta.persistence.*;

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

    public OrderDetail() {
    }

    public OrderDetail(OrderTable order, ProductVariant variant, int orderQuantity) {
        this.order = order;
        this.variant = variant;
        this.orderQuantity = orderQuantity;
        this.id = new OrderDetailKey(order.getOrderID(), variant.getVariantID()); // getId() phải trả về int
    }

    public OrderDetailKey getId() {
        return id;
    }

    public void setId(OrderDetailKey id) {
        this.id = id;
    }

    public OrderTable getOrder() {
        return order;
    }

    public void setOrder(OrderTable order) {
        this.order = order;
    }

    public ProductVariant getVariant() {
        return variant;
    }

    public void setVariant(ProductVariant variant) {
        this.variant = variant;
    }

    public int getOrderQuantity() {
        return orderQuantity;
    }

    public void setOrderQuantity(int orderQuantity) {
        this.orderQuantity = orderQuantity;
    }
}
