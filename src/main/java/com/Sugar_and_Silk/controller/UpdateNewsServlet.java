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
import com.Sugar_and_Silk.utils.FileUploadUtil;
import com.Sugar_and_Silk.utils.ValidationUtil;

/**
 * Servlet implementation class UpdateNewsServlet
 */
@WebServlet("/updateNews")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2,
	    maxFileSize       = 1024 * 1024 * 10,
	    maxRequestSize    = 1024 * 1024 * 50
	)
public class UpdateNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NewsDAO newsDAO = new NewsDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateNewsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idStr = request.getParameter("id");
		 
        if (ValidationUtil.isNullOrEmpty(idStr)) {
            response.sendRedirect(
                request.getContextPath() + "/newsManagement");
            return;
        }
 
        try {
            int newsId = Integer.parseInt(idStr);
            NewsModel news = newsDAO.getNewsById(newsId);
 
            if (news == null) {
                response.sendRedirect(request.getContextPath() + "/newsManagement");
                return;
            }
 
            request.setAttribute("news", news);
            request.getRequestDispatcher("/WEB-INF/pages/updateNewsForm.jsp").forward(request, response);
 
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/newsManagement");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/newsManagement");
	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> errors = new HashMap<>();
		 
        try {
            String idStr = request.getParameter("News_id");
            String title = request.getParameter("Title");
            String content = request.getParameter("Content");
            Part filePart = request.getPart("Image_Path");
 
            //Validate ID
            if (ValidationUtil.isNullOrEmpty(idStr)) {
                response.sendRedirect(request.getContextPath() + "/newsManagement");
                return;
            }
            int newsId = Integer.parseInt(idStr);
 
            //Validate fields
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
 
            // Image is optional on update — only validate if one was chosen
            boolean newImageProvided = filePart != null && filePart.getSize() > 0;
            if (newImageProvided && !FileUploadUtil.isImage(filePart)) {
                errors.put("image", "Only image files (jpg, png, gif…) are allowed.");
            }
 
            //Re-display form on errors
            if (!errors.isEmpty()) {
                // Re-load the full news object so the form still has current data
                NewsModel existing = newsDAO.getNewsById(newsId);
                request.setAttribute("news", existing);
                request.setAttribute("errors", errors);
                request.setAttribute("title", title);
                request.setAttribute("content", content);
                request.getRequestDispatcher("/WEB-INF/pages/updateNewsForm.jsp").forward(request, response);
                return;
            }
 
            //Optionally save new image
            String newFileName = null;
            if (newImageProvided) {
                String uploadDir = getServletContext().getRealPath("/images/");
                newFileName = FileUploadUtil.generateUniqueFileName(title, filePart.getSubmittedFileName());
                FileUploadUtil.saveFile(filePart, uploadDir, newFileName);
            }
 
            //Build model and update
            NewsModel news = new NewsModel();
            news.setNewsId(newsId);
            news.setTitle(title.trim());
            news.setContent(content.trim());
            news.setImagePath(newFileName); // null = keep existing in DAO
 
            int rows = newsDAO.updateNews(news);
 
            HttpSession session = request.getSession();
            if (rows > 0) {
                session.setAttribute("updateNewsSuccess", true);
            } else {
                session.setAttribute("updateNewsError", true);
            }
 
            response.sendRedirect(request.getContextPath() + "/newsManagement");
 
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/newsManagement");
        }
	}

}
