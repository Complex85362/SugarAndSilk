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
import java.util.HashMap;
import java.util.Map;

import com.Sugar_and_Silk.dao.ProductDAO;
import com.Sugar_and_Silk.model.AddProductModel;
import com.Sugar_and_Silk.service.InventoryService;
import com.Sugar_and_Silk.utils.FileUploadUtil;
import com.Sugar_and_Silk.utils.SessionUtil;
import com.Sugar_and_Silk.utils.ValidationUtil;

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
		
		Map<String, String> errors = new HashMap<>();
		
		try{
		String categoryStr = request.getParameter("Category_id");
		String name = request.getParameter("Product_Name");
		String description = request.getParameter("Product_description");
		String priceStr = request.getParameter("Product_price");
		String stockStr = request.getParameter("Stock_quantity");
			
        Part filePart = request.getPart("Product_Image");
        if (ValidationUtil.isNullOrEmpty(name)) {
            errors.put("name", "Product name is required.");
        } else if (!ValidationUtil.isValidProductName(name)) {
            errors.put("name", "Invalid product name.");
        }

        if (ValidationUtil.isNullOrEmpty(description)) {
            errors.put("description", "Description is required.");
        }

        if (ValidationUtil.isNullOrEmpty(categoryStr)) {
            errors.put("category", "Please select a category.");
        }

        if (ValidationUtil.isNullOrEmpty(priceStr)) {
            errors.put("price", "Price is required.");
        } else if (!ValidationUtil.isPositiveDouble(priceStr)) {
            errors.put("price", "Price must be greater than 0.");
        }

        if (ValidationUtil.isNullOrEmpty(stockStr)) {
            errors.put("stock", "Stock quantity is required.");
        } else if (!ValidationUtil.isPositiveInteger(stockStr)) {
            errors.put("stock", "Stock must be 0 or greater.");
        }

        if (filePart == null || filePart.getSize() == 0) {
            errors.put("image", "Product image is required.");
        } else if (!FileUploadUtil.isImage(filePart)) {
            errors.put("image", "Only image files are allowed.");
        }

        if (!errors.isEmpty()) {

            request.setAttribute("errors", errors);
            request.setAttribute("name", name);
            request.setAttribute("description", description);
            request.setAttribute("price", priceStr);
            request.setAttribute("stock", stockStr);
            request.setAttribute("category", categoryStr);

            request.getRequestDispatcher("WEB-INF/pages/addProduct.jsp").forward(request, response);

            return;
        }

        int categoryId = Integer.parseInt(categoryStr);
        double price = Double.parseDouble(priceStr);
        int stock = Integer.parseInt(stockStr);
        
        String uploadDir = getServletContext().getRealPath("/images/");
        String fileName = FileUploadUtil.generateUniqueFileName(name,filePart.getSubmittedFileName());
        
        FileUploadUtil.saveFile(filePart, uploadDir, fileName);

        AddProductModel product = new AddProductModel(categoryId,name,description,price,stock,fileName);

        int rowsAffected = productDAO.insertProduct(product);

        if (rowsAffected > 0) {
            response.sendRedirect(request.getContextPath() + "/addProduct?success=true");
        } else {
            response.sendRedirect(request.getContextPath() + "/addProduct?error=true");
        }

    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect(request.getContextPath() + "/addProduct?error=true");
    }
}
}


