package com.Sugar_and_Silk.model;

public class AddProductModel {
	private int categoryId;
    private String productName;
    private String productDescription;
    private double productPrice;
    private int stockQuantity;
    private String productImage;
    
    public AddProductModel() {
    }
    
    public AddProductModel(int categoryId, String productName, String productDescription, 
            double productPrice, int stockQuantity, String productImage) {
		this.categoryId = categoryId;
		this.productName = productName;
		this.productDescription = productDescription;
		this.productPrice = productPrice;
		this.stockQuantity = stockQuantity;
		this.productImage = productImage;
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

    public String getProductImage() { 
    	return productImage; 
    	}
    public void setProductImage(String productImage) {
    	this.productImage = productImage; 
    	}
       
}
