package com.Sugar_and_Silk.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.Sugar_and_Silk.dao.NewsDAO;
import com.Sugar_and_Silk.model.NewsModel;

/**
 * Servlet implementation class NewsManagementServlet
 */
@WebServlet("/newsManagement")
public class NewsManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NewsDAO newsDAO = new NewsDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsManagementServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
            List<NewsModel> newsList = newsDAO.getAllNews();
            request.setAttribute("newsList", newsList);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Could not load news articles.");
        }
 
        request.getRequestDispatcher("/WEB-INF/pages/newsManagement.jsp")
               .forward(request, response);
    }
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("_method");
		 
        if ("DELETE".equalsIgnoreCase(method)) {
            String idStr = request.getParameter("News_id");
            HttpSession session = request.getSession();
 
            if (idStr != null && !idStr.isEmpty()) {
                try {
                    int newsId = Integer.parseInt(idStr);
                    int rows = newsDAO.deleteNews(newsId);
 
                    if (rows > 0) {
                        session.setAttribute("deleteNewsSuccess", true);
                    } else {
                        session.setAttribute("deleteNewsError", true);
                    }
                } catch (NumberFormatException e) {
                    session.setAttribute("deleteNewsError", true);
                } catch (Exception e) {
                    e.printStackTrace();
                    session.setAttribute("deleteNewsError", true);
                }
            }
 
            response.sendRedirect(
                request.getContextPath() + "/newsManagement");
 
        } else {
            doGet(request, response);
        }
	}

}
