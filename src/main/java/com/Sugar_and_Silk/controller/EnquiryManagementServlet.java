package com.Sugar_and_Silk.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.Sugar_and_Silk.dao.EnquiryDAO;
import com.Sugar_and_Silk.model.EnquiryModel;

/**
 * Servlet implementation class EnquiryManagementServlet
 */
@WebServlet("/enquiryManagement")
public class EnquiryManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final EnquiryDAO enquiryDAO = new EnquiryDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnquiryManagementServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try {
	            List<EnquiryModel> enquiryList = enquiryDAO.getAllEnquiries();
	            request.setAttribute("enquiryList", enquiryList);
	        } catch (Exception e) {
	            e.printStackTrace();
	            request.setAttribute("errorMessage", "Could not load enquiries.");
	        }
	 
	        request.getRequestDispatcher("/WEB-INF/pages/enquiryManagement.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
