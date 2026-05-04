package com.Sugar_and_Silk.model;

public class UpdateProductModel {
	private int productId;
    private String productName;
    private int categoryId;
    private double productPrice;
    private int stockQuantity;
    private String productDescription;
    
    
    public UpdateProductModel() {}
    
    public UpdateProductModel(int productId, String productName, int categoryId, 
            double productPrice, int stockQuantity, String productDescription) {
			this.productId = productId;
			this.productName = productName;
			this.categoryId = categoryId;
			this.productPrice = productPrice;
			this.stockQuantity = stockQuantity;
			this.productDescription = productDescription;
}
    
    public int getProductId() {
    	return productId; 
    	}
    public void setProductId(int productId) {
    	this.productId = productId; 
    	}

    public String getProductName() {
    	return productName; 
    	}
    public void setProductName(String productName) {
    	this.productName = productName; 
    	}

    public int getCategoryId() {
    	return categoryId; 
    	}
    public void setCategoryId(int categoryId) {
    	this.categoryId = categoryId; 
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

    public String getProductDescription() {
    	return productDescription; 
    	}
    public void setProductDescription(String productDescription) {
    	this.productDescription = productDescription; 
    	}
}
