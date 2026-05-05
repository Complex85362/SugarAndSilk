package com.Sugar_and_Silk.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.Sugar_and_Silk.dao.UserDAO;
import com.Sugar_and_Silk.model.UserModel;
import com.Sugar_and_Silk.service.LoginService;
import com.Sugar_and_Silk.utils.CookieUtil;
import com.Sugar_and_Silk.utils.SessionUtil;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("WEB-INF/pages/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
        String password = request.getParameter("password");

        LoginService service = new LoginService();
        String status = service.authenticate(email, password);

        if ("Success".equals(status)) {
            try {
                UserDAO dao = new UserDAO();
                UserModel userData = dao.getUserByEmail(email);
                
                // Store user object in session
                SessionUtil.setAttribute(request, "user", userData, 3600);
                
                // Add login time cookie
                String loginTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd_HH:mm:ss"));
                CookieUtil.addCookie(response, "last_login", loginTime, 3600);
                String role = userData.getUserRole();
                
                if ("admin".equalsIgnoreCase(role)) {
                    response.sendRedirect(request.getContextPath() + "/dashboard");
                } else {
                    // Defaults to home for Customers or any other role
                    response.sendRedirect(request.getContextPath() + "/home");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("login?error=db");
            }
        } else {
            request.setAttribute("error", status);
            request.setAttribute("typedEmail", email); 
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
        }
    }
	}


