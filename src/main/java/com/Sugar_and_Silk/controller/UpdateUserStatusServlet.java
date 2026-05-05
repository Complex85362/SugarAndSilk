package com.Sugar_and_Silk.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.Sugar_and_Silk.dao.UserDAO;

/**
 * Servlet implementation class UpdateUserStatusServlet
 */
@WebServlet("/UpdateUserStatusServlet")
public class UpdateUserStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO = new UserDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("WEB-INF/pages/dashboard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
            int userId = Integer.parseInt(request.getParameter("userId"));
            int status = Integer.parseInt(request.getParameter("status")); // 0 or 1
            userDAO.updateUserStatus(userId, status);
            response.sendRedirect(request.getContextPath() + "/dashboard");
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/dashboard?error=true");
        }
	}

}
