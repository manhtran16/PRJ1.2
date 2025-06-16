package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Product {
	private int productID;
	private String productName;
	private int quantity;
	private String description;
	private double price;
	private int brandID;
	private double avgRate; // not available when creating new object, deafault 0
	private int quantitySold; // not available when creating new object, deafault 0
	private List<String> productType; // list này chứa tên type không phải id
	private List<SpecProduct> specProducts;
	private List<String> imageProduct;

	public Product() {
	}

	public Product(int productID, String productName, int quantity, String description, double price, int brandID) {
		this.productID = productID;
		this.productName = productName;
		this.quantity = quantity;
		this.description = description;
		this.price = price;
		this.brandID = brandID;
	}

	// Used for the function that prints out all information related to the product
	public Product(
                int productID, 
                String productName, 
                int productQuantity, 
                String description, 
                double price,
		int brandID, 
                double avgRate, 
                int quantitySold, 
                List<String> productType, 
                List<SpecProduct> specProducts,
		List<String> imageProduct
        ) 
        {
		this.productID = productID;
		this.productName = productName;
		this.quantity = productQuantity;
		this.description = description;
		this.price = price;
		this.brandID = brandID;
		this.avgRate = avgRate;
		this.quantitySold = quantitySold;
		this.productType = productType;
		this.specProducts = specProducts;
		this.imageProduct = imageProduct;
	}

	// Used for the function that created product without
	// id,avgRate,quantitySold,typeProduct
	public Product(String productName, int productQuantity, String description, double price, int brandID,
			List<SpecProduct> specProducts, List<String> imageProduct) {
		this.productName = productName;
		this.quantity = productQuantity;
		this.description = description;
		this.price = price;
		this.brandID = brandID;
		this.avgRate = 0;
		this.quantitySold = 0;
		this.specProducts = specProducts;
		this.imageProduct = imageProduct;
	}

	// get information for cart
	public Product(int productID, String productName, int productQuantity, double price, List<String> imageProduct) {
		this.productID = productID;
		this.productName = productName;
		this.quantity = productQuantity;
		this.price = price;
		this.imageProduct = imageProduct;
	}

	public int getProductID() {
		return productID;
	}

	public String getProductName() {
		return productName;
	}

	public int getQuantity() {
		return quantity;
	}

	public String getDescription() {
		return description;
	}

	public double getPrice() {
		return price;
	}

	public int getBrandID() {
		return brandID;
	}

	public double getAvgRate() {
		return avgRate;
	}

	public int getQuantitySold() {
		return quantitySold;
	}

	public List<String> getProductType() {
		return productType;
	}

	public List<SpecProduct> getSpecProducts() {
		return specProducts;
	}

	public List<String> getImageProduct() {
		return imageProduct;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public void setBrandID(int brandID) {
		this.brandID = brandID;
	}

	public void setAvgRate(double avgRate) {
		this.avgRate = avgRate;
	}

	public void setQuantitySold(int quantitySold) {
		this.quantitySold = quantitySold;
	}

	public void setProductType(List<String> productType) {
		this.productType = productType;
	}

	public void setSpecProducts(List<SpecProduct> specProducts) {
		this.specProducts = specProducts;
	}

	public void setImageProduct(List<String> imageProduct) {
		this.imageProduct = imageProduct;
	}

	public static List<Map<Integer, Integer>> getProductQuantityList(List<Integer> productIdList,
			List<Integer> productQuantityList) {
		List<Map<Integer, Integer>> productQuantityListResult = new ArrayList<>();

		if (productIdList == null || productQuantityList == null
				|| productIdList.size() != productQuantityList.size()) {
			throw new IllegalArgumentException("Id list and quantity list do not have same size");
		}

		for (int i = 0; i < productIdList.size(); i++) {
			Map<Integer, Integer> map = new HashMap<>();
			map.put(productIdList.get(i), productQuantityList.get(i));
			productQuantityListResult.add(map);
		}

		return productQuantityListResult;
	}

}
