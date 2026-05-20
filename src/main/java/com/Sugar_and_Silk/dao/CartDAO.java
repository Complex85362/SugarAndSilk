package com.Sugar_and_Silk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Sugar_and_Silk.model.CartItemModel;
import com.Sugar_and_Silk.utils.DBconfig;


public class CartDAO {

    //  Internal helper: get or create an 'active' cart for a user 
    private int getOrCreateCart(Connection conn, int userId) throws SQLException {
        // 1. Look for an existing open cart
        String selectSql = "SELECT Cart_ID FROM cart WHERE User_ID = ? AND Cart_status = 'active' LIMIT 1";
        try (PreparedStatement ps = conn.prepareStatement(selectSql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("Cart_ID");
                }
            }
        }
        // 2. None found — create one
        String insertSql = "INSERT INTO cart (User_ID, Cart_status) VALUES (?, 'active')";
        try (PreparedStatement ps = conn.prepareStatement(insertSql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, userId);
            ps.executeUpdate();
            try (ResultSet keys = ps.getGeneratedKeys()) {
                if (keys.next()) {
                    return keys.getInt(1);
                }
            }
        }
        throw new SQLException("Could not create cart for user " + userId);
    }

    //  Add item (or increment quantity if already present) 
    public boolean addToCart(int userId, int productId, int quantity) throws Exception {
        try (Connection conn = DBconfig.getConnection()) {
            int cartId = getOrCreateCart(conn, userId);

            // Check whether this product is already in the cart
            String checkSql = "SELECT Quantity FROM cart_items WHERE Cart_ID = ? AND Product_ID = ?";
            try (PreparedStatement ps = conn.prepareStatement(checkSql)) {
                ps.setInt(1, cartId);
                ps.setInt(2, productId);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        // Already there — increment
                        int newQty = rs.getInt("Quantity") + quantity;
                        String updateSql = "UPDATE cart_items SET Quantity = ? WHERE Cart_ID = ? AND Product_ID = ?";
                        try (PreparedStatement upd = conn.prepareStatement(updateSql)) {
                            upd.setInt(1, newQty);
                            upd.setInt(2, cartId);
                            upd.setInt(3, productId);
                            return upd.executeUpdate() > 0;
                        }
                    }
                }
            }

            // Not there yet — insert
            String insertSql = "INSERT INTO cart_items (Cart_ID, Product_ID, Quantity) VALUES (?, ?, ?)";
            try (PreparedStatement ps = conn.prepareStatement(insertSql)) {
                ps.setInt(1, cartId);
                ps.setInt(2, productId);
                ps.setInt(3, quantity);
                return ps.executeUpdate() > 0;
            }
        }
    }

    // ── Fetch all items for a user's active cart ──────────────────────────────
    public List<CartItemModel> getCartByUser(int userId) throws Exception {
        List<CartItemModel> list = new ArrayList<>();

        String sql =
            "SELECT ci.Cart_ID, ci.Product_ID, ci.Quantity, " +
            "       p.Product_Name, p.Product_price, p.Product_Image " +
            "FROM   cart c " +
            "JOIN   cart_items ci ON c.Cart_ID = ci.Cart_ID " +
            "JOIN   product    p  ON ci.Product_ID = p.Product_ID " +
            "WHERE  c.User_ID = ? AND c.Cart_status = 'active'";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    CartItemModel item = new CartItemModel();
                    item.setCartId(rs.getInt("Cart_ID"));
                    item.setUserId(userId);
                    item.setProductId(rs.getInt("Product_ID"));
                    item.setQuantity(rs.getInt("Quantity"));
                    item.setProductName(rs.getString("Product_Name"));
                    item.setProductPrice(rs.getDouble("Product_price"));
                    item.setImageUrl(rs.getString("Product_Image"));
                    list.add(item);
                }
            }
        }
        return list;
    }

    // ── Total quantity badge count for the header ─────────────────────────────
    public int getCartItemCount(int userId) throws Exception {
        String sql =
            "SELECT COALESCE(SUM(ci.Quantity), 0) AS total " +
            "FROM   cart c " +
            "JOIN   cart_items ci ON c.Cart_ID = ci.Cart_ID " +
            "WHERE  c.User_ID = ? AND c.Cart_status = 'active'";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return rs.getInt("total");
            }
        }
        return 0;
    }

    //Update quantity for one product in the user's active cart
    public boolean updateCartQuantity(int userId, int productId, int quantity) throws Exception {
        String sql =
            "UPDATE cart_items ci " +
            "JOIN   cart c ON ci.Cart_ID = c.Cart_ID " +
            "SET    ci.Quantity = ? " +
            "WHERE  c.User_ID = ? AND ci.Product_ID = ? AND c.Cart_status = 'active'";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, quantity);
            ps.setInt(2, userId);
            ps.setInt(3, productId);
            return ps.executeUpdate() > 0;
        }
    }

    // Remove one product from the user's active cart 
    public boolean deleteCartItem(int userId, int productId) throws Exception {
        String sql =
            "DELETE ci FROM cart_items ci " +
            "JOIN   cart c ON ci.Cart_ID = c.Cart_ID " +
            "WHERE  c.User_ID = ? AND ci.Product_ID = ? AND c.Cart_status = 'active'";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            return ps.executeUpdate() > 0;
        }
    }
}