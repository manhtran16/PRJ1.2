package model;

public class ProductSpecification {
    private int specID;
    private String specProduct;
    private double specValue;
    private int productID;
    
    public ProductSpecification() {
    }
    
    public ProductSpecification(int specID, String specProduct, double specValue, int productID) {
        this.specID = specID;
        this.specProduct = specProduct;
        this.specValue = specValue;
        this.productID = productID;
    }
    
    // Getters and Setters
    public int getSpecID() {
        return specID;
    }
    
    public void setSpecID(int specID) {
        this.specID = specID;
    }
    
    public String getSpecProduct() {
        return specProduct;
    }
    
    public void setSpecProduct(String specProduct) {
        this.specProduct = specProduct;
    }
    
    public double getSpecValue() {
        return specValue;
    }
    
    public void setSpecValue(double specValue) {
        this.specValue = specValue;
    }
    
    public int getProductID() {
        return productID;
    }
    
    public void setProductID(int productID) {
        this.productID = productID;
    }
} 