package com.Sugar_and_Silk.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.Sugar_and_Silk.dao.ProductDAO;
import com.Sugar_and_Silk.dao.ReviewDAO;
import com.Sugar_and_Silk.model.ProductModel;
import com.Sugar_and_Silk.model.ReviewModel;

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
		 try {

		        int productId =
		                Integer.parseInt(request.getParameter("productId"));

		        ProductDAO productDAO = new ProductDAO();

		        ProductModel product =
		                productDAO.getProductById(productId);

		        ReviewDAO reviewDAO = new ReviewDAO();

		        List<ReviewModel> reviews =
		                reviewDAO.getReviewsByProductId(productId);

		        request.setAttribute("product", product);
		        request.setAttribute("reviews", reviews);

		        request.getRequestDispatcher("/WEB-INF/pages/productdetail.jsp")
		               .forward(request, response);

		    }
		    catch(Exception e) {

		        e.printStackTrace();

		        response.sendRedirect(
		                request.getContextPath() + "/product");
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
