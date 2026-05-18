package com.Sugar_and_Silk.model;

import java.sql.Timestamp;

public class NewsModel {
	private int newsId;
    private int userId;
    private int categoryId;
    private String title;
    private String content;
    private String imagePath;
    private Timestamp publishDate;
    
    public NewsModel() {}
    public NewsModel(int newsId, int userId, int categoryId, String title, String content, String imagePath, Timestamp publishDate) {
			this.newsId = newsId;
			this.userId = userId;
			this.categoryId = categoryId;
			this.title = title;
			this.content = content;
			this.imagePath = imagePath;
			this.publishDate = publishDate;
    }
    
    
    public int getNewsId() { 
    	return newsId; 
    	}
    public void setNewsId(int newsId) {
    	this.newsId = newsId; 
    	}
 
    public int getUserId() {
    	return userId; 
    	}
    public void setUserId(int userId) {
    	this.userId = userId; 
    	}
 
    public int getCategoryId() {
    	return categoryId; 
    	}
    public void setCategoryId(int categoryId) {
    	this.categoryId = categoryId; 
    	}
 
    public String getTitle() {
    	return title; 
    	}
    public void setTitle(String title) {
    	this.title = title; 
    	}
 
    public String getContent() {
    	return content; 
    	}
    public void setContent(String content) {
    	this.content = content; 
    	}
 
    public String getImagePath() {
    	return imagePath; 
    	}
    public void setImagePath(String imagePath) {
    	this.imagePath = imagePath; 
    	}
 
    public Timestamp getPublishDate() {
    	return publishDate; 
    	}
    public void setPublishDate(Timestamp publishDate) {
    	this.publishDate = publishDate; 
    	}
    
}
