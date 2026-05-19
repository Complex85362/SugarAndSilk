package com.Sugar_and_Silk.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.Sugar_and_Silk.dao.ProductDAO;
import com.Sugar_and_Silk.model.ProductModel;
import com.Sugar_and_Silk.model.UpdateProductModel;
import com.Sugar_and_Silk.utils.FileUploadUtil;
import com.Sugar_and_Silk.utils.ValidationUtil;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/updateProduct")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2,  // 2 MB
	    maxFileSize       = 1024 * 1024 * 10, // 10 MB
	    maxRequestSize    = 1024 * 1024 * 50  // 50 MB
	)
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
		HttpSession session = request.getSession();
        Object productIdObj = session.getAttribute("productId");
 
        if (productIdObj == null) {
            // No product ID in session = redirect to product management
            response.sendRedirect(request.getContextPath() + "/productManagement");
            return;
        }
 
        try {
            int productId = (Integer) productIdObj;
            ProductModel product = productDAO.getProductById(productId);
 
            if (product == null) {
                // Product not found in DB
                session.setAttribute("notFound", true);
                response.sendRedirect(request.getContextPath() + "/productManagement");
                return;
            }
 
            // Pre-fill the form with the product data
            request.setAttribute("product", product);
            request.getRequestDispatcher("/WEB-INF/pages/updateProductForm.jsp").forward(request, response);
 
        } catch (ClassCastException e) {
            // productId in session is not an Integer
            session.removeAttribute("productId");
            response.sendRedirect(request.getContextPath() + "/productManagement");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", true);
            response.sendRedirect(request.getContextPath() + "/productManagement");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		
		String setSessionIdStr = request.getParameter("setSessionId");
        if (setSessionIdStr != null && !setSessionIdStr.isEmpty()) {
            try {
                // Parse the ID and store it in the session
                int pId = Integer.parseInt(setSessionIdStr);
                session.setAttribute("productId", pId);
                
                // Redirect back to this same servlet, but as a GET request 
                // so it triggers doGet() and loads the updateProductForm.jsp
                response.sendRedirect(request.getContextPath() + "/updateProduct");
                return; 
            } catch (NumberFormatException e) {
                session.setAttribute("error", true);
                response.sendRedirect(request.getContextPath() + "/productManagement");
                return;
            }
        }
        Object productIdObj = session.getAttribute("productId");
 
        if (productIdObj == null) {
            session.setAttribute("error", true);
            response.sendRedirect(request.getContextPath() + "/productManagement");
            return;
        }
 
        String name = request.getParameter("Product_Name");
        String categoryIdStr = request.getParameter("Category_id");
        String priceStr = request.getParameter("Product_price");
        String stockStr = request.getParameter("Stock_quantity");
        String description = request.getParameter("Product_description");
        Part imagePart = request.getPart("Product_Image");
 
        Map<String, String> errors = new HashMap<>();
 
        // Backend Validation 
 
        if (ValidationUtil.isNullOrEmpty(name)) {
            errors.put("name", "Product name is required.");
        } else if (!ValidationUtil.isValidProductName(name)) {
            errors.put("name", "Invalid product name. Use letters, numbers, spaces, &, ', . , - only.");
        }
 
        if (ValidationUtil.isNullOrEmpty(categoryIdStr)) {
            errors.put("category", "Please select a category.");
        }
 
        if (ValidationUtil.isNullOrEmpty(priceStr)) {
            errors.put("price", "Price is required.");
        } else if (!ValidationUtil.isPositiveDouble(priceStr)) {
            errors.put("price", "Price must be a number greater than 0.");
        }
 
        if (ValidationUtil.isNullOrEmpty(stockStr)) {
            errors.put("stock", "Stock quantity is required.");
        } else if (!ValidationUtil.isPositiveInteger(stockStr)) {
            errors.put("stock", "Stock must be a whole number of 0 or more.");
        }
 
        // Image is optional on update
        boolean hasNewImage = (imagePart != null && imagePart.getSize() > 0);
        if (hasNewImage && !FileUploadUtil.isImage(imagePart)) {
            errors.put("image", "Only image files (JPG, PNG, GIF, etc.) are allowed.");
        }
 
        // ── If validation failed, stay on the form with errors ──
 
        if (!errors.isEmpty()) {
            try {
                int productId = (Integer) productIdObj;
                ProductModel product = productDAO.getProductById(productId);
                request.setAttribute("product", product);
            } catch (Exception ignored) {}
 
            request.setAttribute("errors", errors);
            // Echo back user-typed values
            request.setAttribute("typedName", name);
            request.setAttribute("typedCategory", categoryIdStr);
            request.setAttribute("typedPrice", priceStr);
            request.setAttribute("typedStock", stockStr);
            request.setAttribute("typedDescription", description);
 
            request.getRequestDispatcher("/WEB-INF/pages/updateProductForm.jsp")
                   .forward(request, response);
            return;
        }
 
        //Parse validated values and save 
 
        try {
            int productId  = (Integer) productIdObj;
            int categoryId = Integer.parseInt(categoryIdStr);
            double price = Double.parseDouble(priceStr);
            int stock = Integer.parseInt(stockStr);
 
            UpdateProductModel product = new UpdateProductModel(productId, name, categoryId, price, stock, description);
 
            // Handle optional image replacement
            if (hasNewImage) {
                String uniqueFileName = FileUploadUtil.generateUniqueFileName(name, imagePart.getSubmittedFileName());
                String uploadDir = getServletContext().getRealPath("/images/");
                FileUploadUtil.saveFile(imagePart, uploadDir, uniqueFileName);
                product.setProductImage(uniqueFileName);
            }
 
            int rowsAffected = productDAO.updateProduct(product);
 
            if (rowsAffected > 0) {
                // Clear the session attribute to not stay in "edit mode"
                session.removeAttribute("productId");
                session.setAttribute("updateSuccess", true);
                response.sendRedirect(request.getContextPath() + "/productManagement");
            } else {
                session.setAttribute("error", true);
                response.sendRedirect(request.getContextPath() + "/productManagement");
            }
 
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", true);
            response.sendRedirect(request.getContextPath() + "/productManagement");
        }
    }
	

}
