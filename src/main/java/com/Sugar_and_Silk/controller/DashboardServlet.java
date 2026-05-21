package com.Sugar_and_Silk.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.Sugar_and_Silk.dao.DashboardDAO;
import com.Sugar_and_Silk.dao.UserDAO;
import com.Sugar_and_Silk.model.DashboardStatsModel;
import com.Sugar_and_Silk.model.UserModel;

/**
 * Servlet implementation class DashboardServlet
 */
@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO = new UserDAO();
	private DashboardDAO dashboardDAO = new DashboardDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DashboardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchIdParam = request.getParameter("searchId");
	    List<UserModel> userList;

	    try {
	        // Check if the parameter exists and isn't empty
	        if (searchIdParam != null && !searchIdParam.trim().isEmpty()) {
	            
	        	int id = Integer.parseInt(searchIdParam.trim());
	            userList = userDAO.searchUserById(id);
	        } else {
	            // If the search is empty, return the full list of users
	            userList = userDAO.getAllUsers();
	        }
	        DashboardStatsModel stats = dashboardDAO.getStats();
	        request.setAttribute("userList", userList);
	        request.setAttribute("stats", stats);
	        request.getRequestDispatcher("/WEB-INF/pages/dashboard.jsp").forward(request, response);
	        
	    } catch (NumberFormatException e) {
	        
	        response.sendRedirect(request.getContextPath() + "/dashboard");
	    } catch (Exception e) {
	        // Log the error for debugging and send to home
	        e.printStackTrace(); 
	        response.sendRedirect(request.getContextPath() + "/home");
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
