package com.Sugar_and_Silk.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.Sugar_and_Silk.dao.NewsDAO;
import com.Sugar_and_Silk.model.NewsModel;
import com.Sugar_and_Silk.utils.ValidationUtil;

/**
 * Servlet implementation class NewsDescriptionSerlvet
 */
@WebServlet("/newspage")
public class NewsDescriptionSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final NewsDAO newsDAO = new NewsDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsDescriptionSerlvet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idStr = request.getParameter("id");
		 
        if (ValidationUtil.isNullOrEmpty(idStr)) {
            // No ID given — redirect back to the news listing
            response.sendRedirect(request.getContextPath() + "/news");
            return;
        }
 
        try {
            int newsId = Integer.parseInt(idStr);
            NewsModel news = newsDAO.getNewsById(newsId);
 
            if (news == null) {
                // Article not found — redirect back
                response.sendRedirect(request.getContextPath() + "/news");
                return;
            }
 
            request.setAttribute("news", news);
            request.getRequestDispatcher("WEB-INF/pages/newsdescription.jsp").forward(request, response);
 
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/news");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/news");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
