package com.Sugar_and_Silk.service;

import com.Sugar_and_Silk.dao.ProductDAO;
import com.Sugar_and_Silk.model.AddProductModel;
import com.Sugar_and_Silk.utils.FileUploadUtil;

import jakarta.servlet.http.Part;

public class InventoryService {
	private ProductDAO dao = new ProductDAO();

    public boolean saveFullProduct(AddProductModel model, Part imagePart, String uploadDir) {
        try {
            // Security Check: Ensure it is an image before processing
            if (imagePart == null || !FileUploadUtil.isImage(imagePart)) {
                return false; 
            }

            // Generate the unique filename 
            String originalFileName = imagePart.getSubmittedFileName();
            String uniqueFileName = FileUploadUtil.generateUniqueFileName(model.getProductName(), originalFileName);

            // Save the file to disk 
            FileUploadUtil.saveFile(imagePart, uploadDir, uniqueFileName);

            // Update the model with the generated filename to be saved in DB
            model.setProductImage(uniqueFileName);

            // Save the product details into the Database via DAO
            return dao.insertProduct(model) > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
