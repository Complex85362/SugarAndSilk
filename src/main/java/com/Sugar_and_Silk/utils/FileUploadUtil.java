package com.Sugar_and_Silk.utils;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import jakarta.servlet.http.Part;

public class FileUploadUtil {
    public static String getFileExtension(String fileName) {
        if (fileName == null || !fileName.contains(".")) {
            return "";
        }
        return fileName.substring(fileName.lastIndexOf("."));
    }

    
     
//Security check: Ensures only images are uploaded*/
  public static boolean isImage(Part part) {
      String contentType = part.getContentType();
      return contentType != null && contentType.startsWith("image/");}

    
     
//Logic for naming: productNametimestamp.extension 
  
  public static String generateUniqueFileName(String productName, String originalFileName) {
      String extension = getFileExtension(originalFileName);
      String cleanName = productName.trim().replaceAll("\s+", "").toLowerCase();
      return cleanName + "_" + System.currentTimeMillis() + extension;}

    /**
     
The core saving engine: Checks/Creates directory and saves the file*/
  public static void saveFile(Part part, String uploadDir, String fileName) throws IOException {
      Path uploadPath = Paths.get(uploadDir);

        // Create directory if it is not present
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        Path filePath = uploadPath.resolve(fileName);


        try (InputStream inputStream = part.getInputStream()) {
            Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
        }

}
}