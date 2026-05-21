package com.Sugar_and_Silk.model;

public class UserModel {
	private int userId;
	private String firstName;
    private String lastName;
    private String password;
    private String profileImage;
    private String username;
    private String email;
    private String userRole;
    private int active;
    private String address;     
    private String phoneNumber; 
    public int getUserId() { 
    	return userId; 
    	}
    public void setUserId(int userId) {
    	this.userId = userId; 
    	}
    public String getUsername() {
    	return username; 
    	}
    public void setUsername(String username) {
    	this.username = username; 
    	}
    public String getEmail() {
    	return email; 
    	}
    public void setEmail(String email) {
    	this.email = email; 
    	}
    public String getUserRole() {
    	return userRole; 
    	}
    public void setUserRole(String userRole) {
    	this.userRole = userRole; 
    	}
    public int getActive() {
    	return active; 
    	}
    public void setActive(int active) {
    	this.active = active; 
    	}
    public String getPassword() { 
    	return password; }
    
    public void setPassword(String password) { 
    	this.password = password;
    	}
    public String getFirstName() { 
    	return firstName; }
    
    public void setFirstName(String firstName) { 
    	this.firstName = firstName;
    	}
    public String getLastName() { 
    	return lastName; }
    
    public void setLastName(String lastName) { 
    	this.lastName = lastName;
    	}
    public String getProfileImage() { 
    	return profileImage; }
    
    public void setProfileImage(String profileImage) { 
    	this.profileImage = profileImage;
    	}

    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    
    public String getPhoneNumber() {
        return phoneNumber;
    }
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    

    public String getStatus() {
        return null;
    }
    public void setStatus(String status) {
        
    }
}
    
