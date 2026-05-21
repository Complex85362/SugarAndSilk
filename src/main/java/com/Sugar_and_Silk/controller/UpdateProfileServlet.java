package com.Sugar_and_Silk.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;

import com.Sugar_and_Silk.dao.UserDAO;
import com.Sugar_and_Silk.model.UserModel;
import com.Sugar_and_Silk.utils.FileUploadUtil;

/**
 * Servlet implementation class UpdateProfileServlet
 */
@WebServlet("/updateProfile")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2,   // 2 MB
	    maxFileSize       = 1024 * 1024 * 10,  // 10 MB
	    maxRequestSize    = 1024 * 1024 * 50   // 50 MB
	)
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession(false);
	        if (session != null && session.getAttribute("user") != null) {
	            response.sendRedirect(request.getContextPath() + "/profile");
	        } else {
	            response.sendRedirect(request.getContextPath() + "/login");
	        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		 
        // Must be logged in
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
 
        UserModel currentUser = (UserModel) session.getAttribute("user");
 
        //  Read form fields 
        String firstName = trim(request.getParameter("firstName"));
        String lastName = trim(request.getParameter("lastName"));
        String address = trim(request.getParameter("address"));
 
        //  Basic validation
        if (firstName.isEmpty() || lastName.isEmpty()) {
            session.setAttribute("profileError", "First name and last name are required.");
            response.sendRedirect(request.getContextPath() + "/profile");
            return;
        }
 
        //  Handle optional profile image upload 
        String newImageFileName = null;
        Part imagePart = request.getPart("profileImage");
 
        if (imagePart != null && imagePart.getSize() > 0) {
            // Validate an image
            if (!FileUploadUtil.isImage(imagePart)) {
                session.setAttribute("profileError", "Only image files (JPG, PNG, etc.) are allowed.");
                response.sendRedirect(request.getContextPath() + "/profile");
                return;
            }
 
            // Build a unique filename: username_timestamp.ext
            String originalName = imagePart.getSubmittedFileName();
            String ext = originalName.contains(".")
                    ? originalName.substring(originalName.lastIndexOf("."))
                    : ".jpg";
            newImageFileName = currentUser.getUsername() + "_" + System.currentTimeMillis() + ext;
 
            // Save to deployed /images/ folder
            String uploadDir = getServletContext().getRealPath("/images/");
            FileUploadUtil.saveFile(imagePart, uploadDir, newImageFileName);
        }
 
       
        try {
            UserDAO dao = new UserDAO();
            boolean updated = dao.updateProfile(
                    currentUser.getUserId(),
                    firstName,
                    lastName,
                    address,
                    newImageFileName  
            );
 
            if (updated) {
                // Refresh the session user object so the header/profile reflect changes immediately
                UserModel refreshed = dao.getUserByEmail(currentUser.getEmail());
                if (refreshed != null) {
                    session.setAttribute("user", refreshed);
                    session.setAttribute("userRole", refreshed.getUserRole() != null
                            ? refreshed.getUserRole().toLowerCase().trim()
                            : "customer");
                }
                session.setAttribute("profileSuccess", "Profile updated successfully.");
            } else {
                session.setAttribute("profileError", "No changes were saved. Please try again.");
            }
 
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("profileError", "A server error occurred. Please try again.");
        }
 
      
        response.sendRedirect(request.getContextPath() + "/profile");
    }
 
    private String trim(String s) {
        return (s == null) ? "" : s.trim();
    }
}


