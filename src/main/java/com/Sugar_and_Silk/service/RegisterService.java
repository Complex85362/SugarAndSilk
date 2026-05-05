package com.Sugar_and_Silk.service;

import com.Sugar_and_Silk.dao.UserDAO;
import com.Sugar_and_Silk.utils.FileSaveUtil;
import com.Sugar_and_Silk.utils.FileUploadUtil;
import com.Sugar_and_Silk.utils.PasswordUtil;
import com.Sugar_and_Silk.utils.ValidationUtil;

import jakarta.servlet.http.Part;

public class RegisterService {
	UserDAO dao = new UserDAO();

    public boolean registerUser(String firstname, String lastname, String username, 
                                String gender, String address, String email, 
                                String password, Part imagePart, String uploadDir) throws Exception {
    	if (!ValidationUtil.isValidEmail(email)) {
            return false;
        }
        
        
        // Check Uniqueness
        if (dao.isUsernameOrEmailTaken(username, email)) {
            return false;
        }
        // Hash the password for security
        String hashedPassword = PasswordUtil.getHashPassword(password); 
        
        // Handle the Image Upload
        String fileName = "profile_placeholder.png"; // Fallback image
        
        if (imagePart != null && imagePart.getSize() > 0 ) {
        	if (FileUploadUtil.isImage(imagePart)) {
                // Get the extension (e.g., .jpg, .png)
                String extension = FileUploadUtil.getFileExtension(imagePart.getSubmittedFileName());
                
                // Name the file after the username
                fileName = username + extension;
                
                // Save it to the physical device folder
                FileUploadUtil.saveFile(imagePart, uploadDir, fileName);
            }
        }

        // Send the prepared data to the DAO
        return dao.insertUser(firstname, lastname, username, gender, address, email, hashedPassword, fileName);
    }
}
