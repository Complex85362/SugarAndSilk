package com.Sugar_and_Silk.utils;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import jakarta.servlet.http.Part;

public class FileSaveUtil {
    public static String getFileExtension(String fileName) {
        if (fileName == null || !fileName.contains(".")) {
            return "";
        }
        return fileName.substring(fileName.lastIndexOf("."));
    }

    /**
     * Validates if the uploaded part is actually an image based on MIME type
     */
    public static boolean isImage(Part part) {
        String contentType = part.getContentType(); // e.g., "image/jpeg"
        return contentType != null && contentType.startsWith("image/");
    }

    /**
     * Builds the final filename: uniqueID + extension
     */
    public static String buildFileName(String identifier, String extension) {
        return identifier + extension;
    }

    /**
     * Handles the physical saving of the file to the disk
     */
    public static void saveFile(Part part, String uploadDir, String fileName) throws IOException {
        // Convert String path to Path object
        Path uploadPath = Paths.get(uploadDir);

        // Create directory if it doesn't exist
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        // Resolve the full path (root_path + filename)
        Path filePath = uploadPath.resolve(fileName);

        // Save the file (Overwrite if it already exists)
        try (InputStream inputStream = part.getInputStream()) {
            Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
        }
    }
}