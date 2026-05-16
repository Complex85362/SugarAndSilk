package com.Sugar_and_Silk.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.util.regex.Pattern;

import com.Sugar_and_Silk.service.RegisterService;

@WebServlet("/register")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = System.getProperty("user.home") + File.separator + "webapp_uploads";
       
    public RegisterServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/pages/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String username = request.getParameter("uname");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        try {
            Part imagePart = request.getPart("profileImage");

            // 1. Generic Backend Validation
            if (firstName == null || firstName.trim().isEmpty() ||
                lastName == null || lastName.trim().isEmpty() ||
                gender == null || gender.trim().isEmpty() ||
                address == null || address.trim().isEmpty() ||
                password == null || password.trim().isEmpty()) {
                
                sendErrorResponse(request, response, "All required fields must be filled out!", firstName, lastName, username, gender, address, email);
                return;
            }

            // 2. Specific Validation: Username Field Presence
            if (username == null || username.trim().isEmpty()) {
                sendErrorResponse(request, response, "Username field cannot be left blank!", firstName, lastName, username, gender, address, email);
                return;
            }

            // 3. Specific Validation: Email Presence and Format Check
            if (email == null || email.trim().isEmpty()) {
                sendErrorResponse(request, response, "Email field cannot be left blank!", firstName, lastName, username, gender, address, email);
                return;
            }
            
            String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
            Pattern pattern = Pattern.compile(emailRegex);
            if (!pattern.matcher(email).matches()) {
                sendErrorResponse(request, response, "Invalid email format! Please use format: name@domain.com", firstName, lastName, username, gender, address, email);
                return;
            }

            RegisterService service = new RegisterService();

            // 4. Specific Database Uniqueness Checks
            if (service.isUsernameTaken(username)) {
                sendErrorResponse(request, response, "Registration failed. That Username is already registered!", firstName, lastName, username, gender, address, email);
                return;
            }

            if (service.isEmailTaken(email)) {
                sendErrorResponse(request, response, "Registration failed. That Email is already registered!", firstName, lastName, username, gender, address, email);
                return;
            }

            // 5. Run standard insertion sequence
            boolean isRegistered = service.registerUser(firstName, lastName, username, gender, address, email, password, imagePart, UPLOAD_DIR);
            
            if (isRegistered) {
                response.sendRedirect(request.getContextPath() + "/login?registration=success");
            } else {
                sendErrorResponse(request, response, "Registration failed due to a database error. Please try again.", firstName, lastName, username, gender, address, email);
            }

        } catch (Exception e) {
            e.printStackTrace();
            sendErrorResponse(request, response, "Server Error: " + e.getMessage(), firstName, lastName, username, gender, address, email);
        }
    }

    private void sendErrorResponse(HttpServletRequest request, HttpServletResponse response, String errorMsg, 
                                   String firstName, String lastName, String username, String gender, String address, String email) 
                                   throws ServletException, IOException {
        
        request.setAttribute("errorMessage", errorMsg);
        
        request.setAttribute("savedFirstname", firstName);
        request.setAttribute("savedLastname", lastName);
        request.setAttribute("savedUname", username);
        request.setAttribute("savedGender", gender);
        request.setAttribute("savedAddress", address);
        request.setAttribute("savedEmail", email);
        
        request.getRequestDispatcher("WEB-INF/pages/register.jsp").forward(request, response);
    }
}