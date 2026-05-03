package com.Sugar_and_Silk.controller;

import java.io.IOException;
import java.util.List;

import com.Sugar_and_Silk.model.ProductModel;
import com.Sugar_and_Silk.service.ProductService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("/product")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductService service = new ProductService();
	    
	    try {
	        List<ProductModel> productList = service.fetchAll();
	        request.setAttribute("productList", productList);
	    } catch (Exception e) {
	        // Handle the exception your teacher's method might throw
	        e.printStackTrace();
	        request.setAttribute("errorMessage", "Could not load products.");
	    }

	    request.getRequestDispatcher("/WEB-INF/pages/product.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
