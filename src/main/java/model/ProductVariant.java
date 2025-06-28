package model;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import java.util.ArrayList;
import java.util.List;

@Entity
public class ProductVariant {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int variantID;

    @ManyToOne
    @JoinColumn(name = "productID")
    private Product product;

    private double price;
    private int quantity;

    @OneToMany(mappedBy = "variant", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<VariantAttributeValue> attributeValues = new ArrayList<>();

    @OneToMany(mappedBy = "variant", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<OrderDetail> orderDetails = new ArrayList<>();

    @OneToMany(mappedBy = "variant", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Image> images = new ArrayList<>();

    public ProductVariant() {
    }

    public ProductVariant(Product product, double price, int quantity) {
        this.product = product;
        this.price = price;
        this.quantity = quantity;
    }

    public int getVariantID() {
        return variantID;
    }

    public void setVariantID(int variantID) {
        this.variantID = variantID;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public List<VariantAttributeValue> getAttributeValues() {
        return attributeValues;
    }

    public void setAttributeValues(List<VariantAttributeValue> attributeValues) {
        this.attributeValues = attributeValues;
    }

    public List<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }

    public List<Image> getImages() {
        return images;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }

    @Override
    public String toString() {
        return "ProductVariant{" +
                "variantID=" + variantID +
                ", product=" + (product != null ? product.getProductName() : "null") +
                ", price=" + price +
                ", quantity=" + quantity +
                '}';
    }
}
