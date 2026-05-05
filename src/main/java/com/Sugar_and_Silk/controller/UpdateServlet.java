package com.Sugar_and_Silk.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.Sugar_and_Silk.dao.ProductDAO;
import com.Sugar_and_Silk.model.ProductModel;
import com.Sugar_and_Silk.model.UpdateProductModel;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/updateProduct")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO productDAO = new ProductDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("WEB-INF/pages/Update.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idStr = request.getParameter("Product_ID");
        String name = request.getParameter("Product_Name");
        String categoryIdStr = request.getParameter("Category_id");
        String priceStr = request.getParameter("Product_price");
        String stockStr = request.getParameter("Stock_quantity");
        String description = request.getParameter("Product_description");

        try {
            // Validation: Ensure ID is provided
        	if (idStr == null || idStr.isEmpty() || name == null || name.isEmpty() || categoryIdStr == null || priceStr == null || stockStr == null) {
                    response.sendRedirect(request.getContextPath() + "/updateProduct?error=true");
                    return;
                }
        	
        	
            int productId = Integer.parseInt(idStr);
            int categoryId = Integer.parseInt(categoryIdStr);
            double price = Double.parseDouble(priceStr);
            int stock = Integer.parseInt(stockStr);
            // Create Model Object
            UpdateProductModel product = new UpdateProductModel(productId, name, categoryId, price, stock, description);
            

            //  Call DAO to execute update
            int rowsAffected = productDAO.updateProduct(product);

            if (rowsAffected > 0) {
                // Success: Redirect with a success flag
                response.sendRedirect("updateProduct?success=true");
            } else {
                // Failure: ID might not exist in the database
                response.sendRedirect("updateProduct?error=true");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("updateProduct?error=true");
        }
    }
	

}
