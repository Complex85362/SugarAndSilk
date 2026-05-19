package com.Sugar_and_Silk.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.Sugar_and_Silk.dao.EnquiryDAO;
import com.Sugar_and_Silk.model.EnquiryModel;

/**
 * Servlet implementation class ContactUsServlet
 */
@WebServlet("/contactus")
public class ContactUsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final EnquiryDAO enquiryDAO = new EnquiryDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactUsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("WEB-INF/pages/contactus.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	String firstName = trim(request.getParameter("firstName"));
	        String lastName = trim(request.getParameter("lastName"));
	        String email = trim(request.getParameter("email"));
	        String phone = trim(request.getParameter("phone"));
	        String subject = trim(request.getParameter("subject"));
	        String message = trim(request.getParameter("message"));
	 
	        // --- Basic validation ---
	        if (firstName.isEmpty() || lastName.isEmpty() || email.isEmpty() || message.isEmpty()) {
	            request.setAttribute("errorMessage", "Please fill in all required fields.");
	            request.getRequestDispatcher("WEB-INF/pages/contactus.jsp").forward(request, response);
	            return;
	        }
	 
	        // --- Build model ---
	        EnquiryModel enquiry = new EnquiryModel();
	        enquiry.setFirstName(firstName);
	        enquiry.setLastName(lastName);
	        enquiry.setEmail(email);
	        enquiry.setPhone(phone.isEmpty() ? null : phone);
	        enquiry.setSubject(subject.isEmpty() ? null : subject);
	        enquiry.setMessage(message);
	 
	        // --- Attach User_ID if logged in ---
	        HttpSession session = request.getSession(false);
	        if (session != null && session.getAttribute("userId") != null) {
	            enquiry.setUserId((Integer) session.getAttribute("userId"));
	        } else {
	            enquiry.setUserId(null);   // guest
	        }
	 
	        try {
	            enquiryDAO.insertEnquiry(enquiry);
	            // Use session flash so message survives the redirect
	            request.getSession(true).setAttribute("contactSuccess", true);
	        } catch (Exception e) {
	            e.printStackTrace();
	            request.getSession(true).setAttribute("contactError", true);
	        }
	 
	        //redirect to GET to prevent double-submit on refresh
	        response.sendRedirect(request.getContextPath() + "/contactus");
	    }
	 
	    //Helper
	    private String trim(String s) {
	        return (s == null) ? "" : s.trim();
	}

}
