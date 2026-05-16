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
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
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
                
                // FIX: Look at the integer flag directly! 
                // If getActive() returns 0, the account is inactive.
                if (userData != null && userData.getActive() == 0) {
                    request.setAttribute("showInactiveModal", "true"); // Passed as a strong request flag
                    request.setAttribute("typedEmail", email); 
                    request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
                    return; // Halt route propagation immediately
                }
                
                // Store user object in session
                SessionUtil.setAttribute(request, "user", userData, 3600);
                
                // Add login time cookie
                String loginTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd_HH:mm:ss"));
                CookieUtil.addCookie(response, "last_login", loginTime, 3600);
                
                String role = userData.getUserRole();
                if ("admin".equalsIgnoreCase(role)) {
                    response.sendRedirect(request.getContextPath() + "/dashboard");
                } else {
                    response.sendRedirect(request.getContextPath() + "/home");
                }
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Database interaction error occurred.");
                request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
            }
		} else {
			request.setAttribute("errorMessage", status);
			request.setAttribute("typedEmail", email);
			request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
		}
	}
    }
