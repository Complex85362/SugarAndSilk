package com.Sugar_and_Silk.dao;
import com.Sugar_and_Silk.model.ProductModel;
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
}
