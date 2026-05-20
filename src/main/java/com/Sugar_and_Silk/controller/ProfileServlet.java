package com.Sugar_and_Silk.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

import com.Sugar_and_Silk.dao.UserDAO;
import com.Sugar_and_Silk.model.UserModel;
import com.Sugar_and_Silk.utils.SessionUtil;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
           
    public ProfileServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        UserModel userObj = (UserModel) session.getAttribute("user");

        if (userObj != null) {
            try {
                // Refresh the user profile data explicitly from your database
                UserDAO dao = new UserDAO();
                UserModel dbUser = dao.getUserByEmail(userObj.getEmail());
                
                if (dbUser != null) {
                    session.setAttribute("user", dbUser);
                    session.setAttribute("userRole", dbUser.getUserRole() != null ? dbUser.getUserRole().toLowerCase().trim() : "customer");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            request.getRequestDispatcher("/WEB-INF/pages/profile.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Please login to view your profile");
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}