package com.Sugar_and_Silk.model;

import java.sql.Timestamp;

public class EnquiryModel {
	private int enquiryId;
    private Integer userId;     
    private String firstName;
    private String lastName;
    private String email;
    private String phone;
    private String subject;
    private String message;
    private Timestamp submittedAt;
 
    // Getters & Setters 
 
    public int getEnquiryId(){
    	return enquiryId; 
    	}
    public void setEnquiryId(int enquiryId){
    	this.enquiryId = enquiryId; 
    	}
 
    public Integer getUserId(){
    	return userId; 
    	}
    public void setUserId(Integer userId){
    	this.userId = userId; }
 
    public String getFirstName(){ 
    	return firstName; 
    	}
    public void setFirstName(String firstName){ 
    	this.firstName = firstName; 
    	}
 
    public String getLastName(){ 
    	return lastName; 
    	}
    public void setLastName(String lastName){
    	this.lastName = lastName; 
    	}
 
    public String getEmail(){ 
    	return email; 
    	}
    public void setEmail(String email){
    	this.email = email; 
    	}
 
    public String getPhone(){ 
    	return phone; 
    	}
    public void setPhone(String phone){ 
    	this.phone = phone; 
    	}
 
    public String getSubject(){ 
    	return subject; 
    	}
    public void setSubject(String subject){
    	this.subject = subject; 
    	}
 
    public String getMessage(){ 
    	return message; 
    	}
    public void setMessage(String message){ 
    	this.message = message; 
    	}
 
    public Timestamp getSubmittedAt(){ 
    	return submittedAt; 
    	}
    public void setSubmittedAt(Timestamp submittedAt){ 
    	this.submittedAt = submittedAt; 
    	}
}
