package com.Sugar_and_Silk.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.Sugar_and_Silk.dao.ProductDAO;

/**
 * Servlet implementation class DeleteProductServlet
 */
@WebServlet("/DeleteProduct")
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO productDAO = new ProductDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("WEB-INF/pages/addProduct.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String idStr = request.getParameter("Product_ID"); 

        if (idStr != null && !idStr.isEmpty()) {
            try {
                int productId = Integer.parseInt(idStr);
                
                // Call the DAO method created earlier
                int rowsAffected = productDAO.deleteProduct(productId);

                if (rowsAffected > 0) {
                    // Success:
                    response.sendRedirect(request.getContextPath() + "/addProduct?deleteSuccess=true");
                } else {
                    // ID not found
                    response.sendRedirect(request.getContextPath() + "/addProduct?deleteError=true");
                }
                
            } catch (Exception e) {
                e.printStackTrace();
                
                response.sendRedirect(request.getContextPath() + "/addProduct?deleteError=true");
            }
        } else {
            // No ID provided, just go back
            response.sendRedirect(request.getContextPath() + "/addProduct");
        }
    }
	}


