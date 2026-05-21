package com.Sugar_and_Silk.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.Sugar_and_Silk.dao.ProductDAO;
import com.Sugar_and_Silk.model.ProductModel;

/**
 * Servlet implementation class ProductManagementServlet
 */
@WebServlet("/productManagement")
public class ProductManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO productDAO = new ProductDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductManagementServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
            List<ProductModel> productList = productDAO.getAllProducts();
            request.setAttribute("productList", productList);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Could not load products.");
        }
 
        request.getRequestDispatcher("/WEB-INF/pages/productManagement.jsp")
               .forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("_method");
		 
        if ("DELETE".equalsIgnoreCase(method)) {
            String idStr = request.getParameter("Product_ID");
 
            if (idStr != null && !idStr.isEmpty()) {
                try {
                    int productId = Integer.parseInt(idStr);
                    int rows = productDAO.deleteProduct(productId);
 
                    HttpSession session = request.getSession();
                    if (rows > 0) {
                        // Set success message in session (will be displayed once then cleared)
                        session.setAttribute("deleteSuccess", true);
                    } else {
                        // Product not found
                        session.setAttribute("deleteError", true);
                    }
                } catch (NumberFormatException e) {
                    HttpSession session = request.getSession();
                    session.setAttribute("deleteError", true);
                } catch (Exception e) {
                    e.printStackTrace();
                    HttpSession session = request.getSession();
                    session.setAttribute("deleteError", true);
                }
            }
 
            // Always redirect back to GET to reload the product list
            response.sendRedirect(request.getContextPath() + "/productManagement");
        } else {
            // If no _method=DELETE, reload the page via GET
            doGet(request, response);
        }
	}

}
