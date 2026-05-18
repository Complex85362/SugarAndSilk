package com.Sugar_and_Silk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Date;
import com.Sugar_and_Silk.utils.DBconfig; // Adjust based on your actual config location

public class OrderDAO {

    public boolean processCheckout(int userId, double totalAmount) throws Exception {
        String insertPaymentSQL = "INSERT INTO payment (Payment_amount, Payment_date, Payment_method, Payment_status) VALUES (?, ?, ?, ?)";
        String insertOrderSQL = "INSERT INTO `order` (Payment_ID, Order_date, Order_status, Total_amount) VALUES (?, ?, ?, ?)";
        String clearCartSQL = "DELETE FROM cart_items WHERE User_ID = ?";
        
        Connection conn = null;
        PreparedStatement psPayment = null;
        PreparedStatement psOrder = null;
        PreparedStatement psClearCart = null;
        ResultSet generatedKeys = null;

        try {
            conn = DBconfig.getConnection();
            conn.setAutoCommit(false); // CRITICAL: Turn off autocommit to run as a single safe transaction

            // 1. Insert into Payment Table
            psPayment = conn.prepareStatement(insertPaymentSQL, Statement.RETURN_GENERATED_KEYS);
            psPayment.setDouble(1, totalAmount);
            psPayment.setDate(2, new Date(System.currentTimeMillis()));
            psPayment.setString(3, "COD"); // Cash on Delivery default for local delivery optimization
            psPayment.setString(4, "Pending");
            psPayment.executeUpdate();

            // Retrieve the newly generated Payment_ID
            generatedKeys = psPayment.getGeneratedKeys();
            int paymentId = 0;
            if (generatedKeys.next()) {
                paymentId = generatedKeys.getInt(1);
            } else {
                throw new Exception("Creating payment failed, no ID obtained.");
            }

            // 2. Insert into Order Table using that brand new Payment_ID
            psOrder = conn.prepareStatement(insertOrderSQL);
            psOrder.setInt(1, paymentId);
            psOrder.setDate(2, new Date(System.currentTimeMillis()));
            psOrder.setString(3, "Processing");
            psOrder.setDouble(4, totalAmount);
            psOrder.executeUpdate();

            // 3. Clear the user's shopping cart records
            psClearCart = conn.prepareStatement(clearCartSQL);
            psClearCart.setInt(1, userId);
            psClearCart.executeUpdate();

            // If all operations succeeded flawlessly, commit the transaction together
            conn.commit();
            return true;

        } catch (Exception e) {
            if (conn != null) {
                try { conn.rollback(); } catch (Exception ex) { ex.printStackTrace(); }
            }
            e.printStackTrace();
            throw e;
        } finally {
            if (generatedKeys != null) generatedKeys.close();
            if (psPayment != null) psPayment.close();
            if (psOrder != null) psOrder.close();
            if (psClearCart != null) psClearCart.close();
            if (conn != null) conn.close();
        }
    }
}