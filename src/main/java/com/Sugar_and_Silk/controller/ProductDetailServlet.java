package com.Sugar_and_Silk.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.Sugar_and_Silk.dao.ProductDAO;
import com.Sugar_and_Silk.model.ProductModel;

/**
 * Servlet implementation class ProjectDetailServlet
 */
@WebServlet("/detail")
public class ProductDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO productDAO = new ProductDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String idStr = request.getParameter("id");
		 
	        // If no ID is provided, send the user back to the product listing.
	        if (idStr == null || idStr.trim().isEmpty()) {
	            response.sendRedirect(request.getContextPath() + "/product");
	            return;
	        }
	 
	        try {
	            int productId = Integer.parseInt(idStr.trim());
	            ProductModel product = productDAO.getProductById(productId);
	 
	            // If the product does not exist in the database, redirect back.
	            if (product == null) {
	                response.sendRedirect(request.getContextPath() + "/product");
	                return;
	            }
	 
	            // Put the product on the request so the JSP can read it via EL.
	            request.setAttribute("product", product);
	            request.getRequestDispatcher("/WEB-INF/pages/productdetail.jsp")
	                   .forward(request, response);
	 
	        } catch (NumberFormatException e) {
	            // ?id= was not a valid integer.
	            response.sendRedirect(request.getContextPath() + "/product");
	        } catch (Exception e) {
	            e.printStackTrace();
	            request.setAttribute("errorMessage", "Could not load product details.");
	            request.getRequestDispatcher("/WEB-INF/pages/productdetail.jsp")
	                   .forward(request, response);
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
