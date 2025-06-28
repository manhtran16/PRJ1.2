package model;

import jakarta.persistence.*;

@Entity
public class Image {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int imageID;

    private String url;

    @ManyToOne
    @JoinColumn(name = "variantID")
    private ProductVariant variant;

    public Image() {
    }

    public Image(String url) {
        this.url = url;
    }

    public Image(String url, ProductVariant variant) {
        this.url = url;
        this.variant = variant;
    }

    // Getters & Setters
    public int getImageID() {
        return imageID;
    }

    public void setImageID(int imageID) {
        this.imageID = imageID;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public ProductVariant getVariant() {
        return variant;
    }

    public void setVariant(ProductVariant variant) {
        this.variant = variant;
    }

    @Override
    public String toString() {
        return "Image{" +
                "imageID=" + imageID +
                ", url='" + url + '\'' +
                '}';
    }
}
