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

import com.Sugar_and_Silk.dao.ProductDAO;
import com.Sugar_and_Silk.model.AddProductModel;
import com.Sugar_and_Silk.service.InventoryService;
import com.Sugar_and_Silk.utils.FileUploadUtil;
import com.Sugar_and_Silk.utils.SessionUtil;

/**
 * Servlet implementation class AddProductServlet
 */
@WebServlet("/addProduct")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
	    maxFileSize = 1024 * 1024 * 10,      // 10MB
	    maxRequestSize = 1024 * 1024 * 50     // 50MB
	)
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIR = System.getProperty("user.home") + File.separator + "webapp_uploads";
	private ProductDAO productDAO = new ProductDAO();
	private InventoryService service = new InventoryService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProductServlet() {
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
		try{
			
			
			
		int categoryId = Integer.parseInt(request.getParameter("Category_id"));
        String name = request.getParameter("Product_Name");
        String description = request.getParameter("Product_description");
        double price = Double.parseDouble(request.getParameter("Product_price"));
        int stock = Integer.parseInt(request.getParameter("Stock_quantity"));

        Part filePart = request.getPart("Product_Image");
        String fileName = null;

        if (filePart != null && filePart.getSize() > 0) {
            if (FileUploadUtil.isImage(filePart)) {
                // Generate unique name
                fileName = FileUploadUtil.generateUniqueFileName(name, filePart.getSubmittedFileName());
                
                // Save physically to the local folder
                FileUploadUtil.saveFile(filePart, UPLOAD_DIR, fileName);
            }
        }

        // Save to Database using DAO
        AddProductModel product = new AddProductModel(categoryId, name, description, price, stock, fileName);
        int rowsAffected = productDAO.insertProduct(product);

        if (rowsAffected > 0) {
            response.sendRedirect(request.getContextPath() + "/addProduct?success=true");
        } else {
            response.sendRedirect(request.getContextPath() + "/addProduct?error=true");
        }

		}catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect(request.getContextPath() + "/addProduct");
		}
	}
}


