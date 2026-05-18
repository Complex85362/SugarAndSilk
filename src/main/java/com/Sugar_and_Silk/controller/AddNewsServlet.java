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
import java.util.HashMap;
import java.util.Map;

import com.Sugar_and_Silk.dao.NewsDAO;
import com.Sugar_and_Silk.model.NewsModel;
import com.Sugar_and_Silk.model.UserModel;
import com.Sugar_and_Silk.utils.FileUploadUtil;
import com.Sugar_and_Silk.utils.ValidationUtil;

/**
 * Servlet implementation class AddNewsServlet
 */
@WebServlet("/addNews")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2,  // 2 MB
	    maxFileSize       = 1024 * 1024 * 10, // 10 MB
	    maxRequestSize    = 1024 * 1024 * 50  // 50 MB
	)
public class AddNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private static final int NEWS_CATEGORY_ID = 5;   
	 private NewsDAO newsDAO = new NewsDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNewsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/pages/addNews.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Map<String, String> errors = new HashMap<>();
		 
	     	try {
	            String title   = request.getParameter("Title");
	            String content = request.getParameter("Content");
	            Part   filePart = request.getPart("Image_Path");
	 
	            // Front end validation similar to add product //
	 
	            if (ValidationUtil.isNullOrEmpty(title)) {
	                errors.put("title", "News title is required.");
	            } else if (title.trim().length() < 5) {
	                errors.put("title", "Title must be at least 5 characters.");
	            } else if (title.trim().length() > 255) {
	                errors.put("title", "Title must not exceed 255 characters.");
	            }
	 
	            if (ValidationUtil.isNullOrEmpty(content)) {
	                errors.put("content", "News content is required.");
	            } else if (content.trim().length() < 20) {
	                errors.put("content", "Content must be at least 20 characters.");
	            }
	 
	            if (filePart == null || filePart.getSize() == 0) {
	                errors.put("image", "A news image is required.");
	            } else if (!FileUploadUtil.isImage(filePart)) {
	                errors.put("image", "Only image files (jpg, png, gif…) are allowed.");
	            }
	 
	            //Re-display form if there are errors
	 
	            if (!errors.isEmpty()) {
	                request.setAttribute("errors",  errors);
	                request.setAttribute("title",   title);
	                request.setAttribute("content", content);
	                request.getRequestDispatcher("/WEB-INF/pages/addNews.jsp")
	                       .forward(request, response);
	                return;
	            }
	 
	            //Save image with same logic as AddProductServlet 
	 
	            String uploadDir = getServletContext().getRealPath("/images/");
	            String fileName  = FileUploadUtil.generateUniqueFileName(
	                                    title, filePart.getSubmittedFileName());
	            FileUploadUtil.saveFile(filePart, uploadDir, fileName);
	 
	            // Get admin's user ID from session
	 
	            HttpSession session = request.getSession(false);
	            int userId = 0;
	            UserModel loggedInUser = (UserModel) session.getAttribute("user");
	            if (loggedInUser != null) {
	                userId = loggedInUser.getUserId();
	            }
	            
	            
	            NewsModel news = new NewsModel();
	            news.setUserId(userId);
	            news.setCategoryId(NEWS_CATEGORY_ID);
	            news.setTitle(title.trim());
	            news.setContent(content.trim());
	            news.setImagePath(fileName);
	 
	            int rows = newsDAO.insertNews(news);
	 
	            if (rows > 0) {
	                response.sendRedirect(
	                    request.getContextPath() + "/addNews?success=true");
	            } else {
	                response.sendRedirect(
	                    request.getContextPath() + "/addNews?error=true");
	            }
	 
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendRedirect(
	                request.getContextPath() + "/addNews?error=true");
	        }
	}

}
