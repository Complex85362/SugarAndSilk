package com.Sugar_and_Silk.service;

import jakarta.servlet.http.Part;
import com.Sugar_and_Silk.dao.UserDAO;
import com.Sugar_and_Silk.utils.PasswordUtil;

public class RegisterService {
    
    private UserDAO dao = new UserDAO();
    
    public boolean isUsernameTaken(String username) {
        try {
            return dao.checkUsernameExists(username);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean isEmailTaken(String email) {
        try {
            return dao.checkEmailExists(email);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean registerUser(String firstName, String lastName, String username, String gender, 
            String address, String email, String password, Part imagePart, String uploadDir) {
try {
String filename = (imagePart != null && imagePart.getSize() > 0) ? imagePart.getSubmittedFileName() : "default.png";

// Hash the plain text password using your utility before saving it
String hashedPassword = PasswordUtil.getHashPassword(password); 

// Pass the secured hashed password to your DAO instead of the raw text
return dao.insertUser(firstName, lastName, username, gender, address, email, hashedPassword, filename);
} catch (Exception e) {
e.printStackTrace();
return false;
}
}
}