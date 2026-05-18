package com.Sugar_and_Silk.dao;
import com.Sugar_and_Silk.model.AddProductModel;
import com.Sugar_and_Silk.model.ProductModel;
import com.Sugar_and_Silk.model.UpdateProductModel;
import com.Sugar_and_Silk.utils.DBconfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class ProductDAO {
	public List<ProductModel> getAllProducts() {
	    List<ProductModel> productList = new ArrayList<>();
	    String query = "SELECT * FROM product";

	    try (Connection conn = DBconfig.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query);
	         ResultSet rs = ps.executeQuery()) {

	        while (rs.next()) {
	            ProductModel product = new ProductModel();

	            product.setProductId(rs.getInt("Product_ID"));
	            product.setCategoryId(rs.getInt("Category_id"));
	            product.setProductName(rs.getString("Product_Name"));
	            product.setProductDescription(rs.getString("Product_description"));
	            product.setProductPrice(rs.getDouble("Product_price"));
	            product.setStockQuantity(rs.getInt("Stock_quantity"));
	            product.setProductCreationDate(rs.getTimestamp("Product_creation_date"));
	            product.setProductImage(rs.getString("Product_Image"));

	            productList.add(product);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return productList;
	}
	
	public ProductModel getProductById(int productId) {

	    ProductModel product = null;

	    String sql = "SELECT * FROM product WHERE Product_ID = ?";

	    try {
	    	Connection conn = DBconfig.getConnection();
	        PreparedStatement ps = conn.prepareStatement(sql);

	        ps.setInt(1, productId);

	        ResultSet rs = ps.executeQuery();

	        if(rs.next()) {

	            product = new ProductModel();

	            product.setProductId(rs.getInt("Product_ID"));
	            product.setProductName(rs.getString("Product_Name"));
	            product.setProductDescription(rs.getString("Product_Description"));
	            product.setProductPrice(rs.getDouble("Product_Price"));
	            product.setStockQuantity(rs.getInt("Stock_Quantity"));
	            product.setProductImage(rs.getString("Product_Image"));
	        }

	    }
	    catch(Exception e) {
	        e.printStackTrace();
	    }

	    return product;
	}
	
	
	public int insertProduct(AddProductModel product) throws SQLException {
        String query = "INSERT INTO product (Category_id, Product_Name, Product_description, "
                     + "Product_price, Stock_quantity, Product_Image) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setInt(1, product.getCategoryId());
            ps.setString(2, product.getProductName());
            ps.setString(3, product.getProductDescription());
            ps.setDouble(4, product.getProductPrice());
            ps.setInt(5, product.getStockQuantity());
            
            // This handles the unique filename 
            ps.setString(6, product.getProductImage());

            return ps.executeUpdate(); 
        } catch (SQLException e) {
       
            System.err.println("Error inserting product: " + e.getMessage());
            throw e; 
        }
    }
	public int deleteProduct(int productId) throws SQLException {
	    String sql = "DELETE FROM product WHERE Product_ID = ?";
	    try (Connection conn = DBconfig.getConnection(); //
	         PreparedStatement ps = conn.prepareStatement(sql)) {
	        
	        ps.setInt(1, productId);
	        return ps.executeUpdate();
	    }
	}
	
	public int updateProduct(UpdateProductModel product) throws SQLException {
	    String sql = "UPDATE product SET Category_id = ?, Product_Name = ?, Product_description = ?, "
	               + "Product_price = ?, Stock_quantity = ? WHERE Product_ID = ?";
	    
	    try (Connection conn = DBconfig.getConnection(); 
	         PreparedStatement ps = conn.prepareStatement(sql)) {
	        
	        ps.setInt(1, product.getCategoryId());
	        ps.setString(2, product.getProductName());
	        ps.setString(3, product.getProductDescription());
	        ps.setDouble(4, product.getProductPrice());
	        ps.setInt(5, product.getStockQuantity());
	        ps.setInt(6, product.getProductId()); 
	        
	        return ps.executeUpdate();
	    }
	}
	
	
}
