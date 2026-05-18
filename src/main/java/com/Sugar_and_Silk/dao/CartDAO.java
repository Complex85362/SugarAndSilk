package com.Sugar_and_Silk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.Sugar_and_Silk.model.CartItemModel;
import com.Sugar_and_Silk.utils.DBconfig;

public class CartDAO {

    // 1. Add item or update quantity matching exact database column casing
    public boolean addToCart(int userId, int productId, int quantity) throws Exception {
        String checkSql = "SELECT Cart_ID, Quantity FROM cart_items WHERE User_ID = ? AND Product_ID = ?";
        String insertSql = "INSERT INTO cart_items (User_ID, Product_ID, Quantity) VALUES (?, ?, ?)";
        String updateSql = "UPDATE cart_items SET Quantity = ? WHERE Cart_ID = ?";
        
        try (Connection conn = DBconfig.getConnection()) {
            try (PreparedStatement psCheck = conn.prepareStatement(checkSql)) {
                psCheck.setInt(1, userId);
                psCheck.setInt(2, productId);
                try (ResultSet rs = psCheck.executeQuery()) {
                    if (rs.next()) {
                        int existingCartId = rs.getInt("Cart_ID");
                        int newQuantity = rs.getInt("Quantity") + quantity;
                        
                        try (PreparedStatement psUpdate = conn.prepareStatement(updateSql)) {
                            psUpdate.setInt(1, newQuantity);
                            psUpdate.setInt(2, existingCartId);
                            return psUpdate.executeUpdate() > 0;
                        }
                    }
                }
            }
            try (PreparedStatement psInsert = conn.prepareStatement(insertSql)) {
                psInsert.setInt(1, userId);
                psInsert.setInt(2, productId);
                psInsert.setInt(3, quantity);
                return psInsert.executeUpdate() > 0;
            }
        }
    }

    // 2. Query data matching exact column names from your database screenshot
    public List<CartItemModel> getCartByUser(int userId) throws Exception {
        List<CartItemModel> list = new ArrayList<>();
        
        // FIXED: Using consistent casing and columns matching your actual tables
        String query = "SELECT c.Cart_ID, c.User_ID, c.Product_ID, c.Quantity, " +
                       "p.Product_Name, p.Product_price, p.Product_Image " + 
                       "FROM cart_items c " +
                       "JOIN product p ON c.Product_ID = p.Product_ID " +
                       "WHERE c.User_ID = ?";
        
        // FIXED: Changed 'sql' to 'query' to resolve the Eclipse compiler error
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) { 
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    CartItemModel item = new CartItemModel();
                    item.setCartId(rs.getInt("Cart_ID"));
                    item.setUserId(rs.getInt("User_ID"));
                    item.setProductId(rs.getInt("Product_ID"));
                    item.setQuantity(rs.getInt("Quantity"));
                    item.setProductName(rs.getString("Product_Name"));
                    item.setProductPrice(rs.getDouble("Product_price"));
                    
                    // FIXED: Pulls Product_Image straight from the column to your model map
                    item.setImageUrl(rs.getString("Product_Image")); 
                    list.add(item);
                }
            }
        }
        return list;
    }

    public int getCartItemCount(int userId) throws Exception {
        String sql = "SELECT SUM(Quantity) AS total FROM cart_items WHERE User_ID = ?";
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("total");
                }
            }
        }
        return 0;
    }

    // 2. Overwrite quantity completely when modifying from the cart screen
    public boolean updateCartQuantity(int userId, int productId, int quantity) throws Exception {
        String sql = "UPDATE cart_items SET Quantity = ? WHERE User_ID = ? AND Product_ID = ?";
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, quantity);
            ps.setInt(2, userId);
            ps.setInt(3, productId);
            return ps.executeUpdate() > 0;
        }
    }

    // 3. Remove an item entirely from a user's cart
    public boolean deleteCartItem(int userId, int productId) throws Exception {
        String sql = "DELETE FROM cart_items WHERE User_ID = ? AND Product_ID = ?";
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            return ps.executeUpdate() > 0;
        }
    }
}