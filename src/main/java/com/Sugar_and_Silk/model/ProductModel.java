package com.Sugar_and_Silk.model;
import java.sql.Timestamp;
public class ProductModel {
	private int productId;
	private int categoryId;
	private String productName;
	private String productDescription;
	private double productPrice;
	private int stockQuantity;
	private Timestamp productCreationDate;
	private String productImage;
    
    public ProductModel() {}
    
    public ProductModel(int productId, int categoryId, String productName,
            String productDescription, double productPrice,
            int stockQuantity, Timestamp productCreationDate,
            String productImage) {

			this.productId = productId;
			this.categoryId = categoryId;
			this.productName = productName;
			this.productDescription = productDescription;
			this.productPrice = productPrice;
			this.stockQuantity = stockQuantity;
			this.productCreationDate = productCreationDate;
			this.productImage = productImage;
}
 // Getters and Setters
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public Timestamp getProductCreationDate() {
        return productCreationDate;
    }

    public void setProductCreationDate(Timestamp productCreationDate) {
        this.productCreationDate = productCreationDate;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }
}