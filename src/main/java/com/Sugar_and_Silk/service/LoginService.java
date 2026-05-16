package com.Sugar_and_Silk.service;

import com.Sugar_and_Silk.dao.UserDAO;
import com.Sugar_and_Silk.model.UserModel;
import com.Sugar_and_Silk.utils.PasswordUtil;

public class LoginService {
    public String authenticate(String email, String password) {
        if (email == null || email.trim().isEmpty()) return "Email is required";
        if (password == null || password.isEmpty()) return "Password is required";
        
        try {
            UserDAO userDAO = new UserDAO();
            UserModel user = userDAO.getUserByEmail(email);

            if (user == null) {
                return "Incorrect email";
            }

            if (PasswordUtil.checkPassword(password, user.getPassword())) {
                return "Success";
            } else {
                return "Incorrect password";
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            return "Database Error";
        }
    }
}