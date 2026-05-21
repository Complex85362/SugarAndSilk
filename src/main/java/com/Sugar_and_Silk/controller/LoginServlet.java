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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
           
    public LoginServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        LoginService service = new LoginService();
        String status = service.authenticate(email, password);

        if ("Success".equals(status)) {
            try {
                UserDAO dao = new UserDAO();
                UserModel userData = dao.getUserByEmail(email);
                
                if (userData != null && userData.getActive() == 0) {
                    request.setAttribute("showInactiveModal", "true"); 
                    request.setAttribute("typedEmail", email); 
                    request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
                    return; 
                }
                
                // Store user object in session
                SessionUtil.setAttribute(request, "user", userData, 3600);
                
             
                String role = userData.getUserRole();
                request.getSession().setAttribute("userRole", role != null ? role.toLowerCase().trim() : "customer");
                
                // Add login time cookie
                String loginTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd_HH:mm:ss"));
                CookieUtil.addCookie(response, "last_login", loginTime, 3600);
                
                String role1 = userData.getUserRole();
                response.sendRedirect(request.getContextPath() + "/home");
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