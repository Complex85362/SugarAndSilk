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

    /**
     * Security check: Ensures only images are uploaded
     */
    public static boolean isImage(Part part) {
        String contentType = part.getContentType();
        return contentType != null && contentType.startsWith("image/");
    }

    /**
     * Logic for naming: productName_timestamp.extension 
     */
    public static String generateUniqueFileName(String productName, String originalFileName) {
        String extension = getFileExtension(originalFileName);
        String cleanName = productName.trim().replaceAll("\\s+", "_").toLowerCase();
        return cleanName + "_" + System.currentTimeMillis() + extension;
    }


    /**
     * Saves the uploaded file to the primary upload directory (the deployed
     * webapp's /images/ folder resolved by getRealPath).
     *
     * After saving, it also attempts to copy the file into the Maven project's
     * src/main/webapp/images/ source folder.
     */
    public static void saveFile(Part part, String uploadDir, String fileName) throws IOException {
    	Path deployedDir = Paths.get(uploadDir);
        if (!Files.exists(deployedDir)) {
            Files.createDirectories(deployedDir);
        }
        Path deployedFile = deployedDir.resolve(fileName);
        try (InputStream inputStream = part.getInputStream()) {
            Files.copy(inputStream, deployedFile, StandardCopyOption.REPLACE_EXISTING);
        }
        
        try {
            String classesLocation = FileUploadUtil.class.getProtectionDomain().getCodeSource().getLocation().toURI().getPath();
            Path sourceImagesDir = Paths.get(classesLocation).getParent().getParent().resolve("src/main/webapp/images");
 
            if (Files.exists(sourceImagesDir)) {
                Files.copy(deployedFile, sourceImagesDir.resolve(fileName),StandardCopyOption.REPLACE_EXISTING);
            }
        } catch (Exception e) {
            System.out.println("Note: Could not copy image to source webapp folder. " + e.getMessage());
        }

}
}
