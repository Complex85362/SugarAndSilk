package com.Sugar_and_Silk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import com.Sugar_and_Silk.model.EnquiryModel;
import com.Sugar_and_Silk.utils.DBconfig;

public class EnquiryDAO {
	 public int insertEnquiry(EnquiryModel enquiry) throws SQLException {
	        String sql = "INSERT INTO enquiry "
	                   + "(User_ID, First_Name, Last_Name, Email, Phone, Subject, Message) "
	                   + "VALUES (?, ?, ?, ?, ?, ?, ?)";
	 
	        try (Connection conn = DBconfig.getConnection();
	             PreparedStatement ps = conn.prepareStatement(sql)) {
	 
	            // User_ID can be null for guests
	            if (enquiry.getUserId() != null) {
	                ps.setInt(1, enquiry.getUserId());
	            } else {
	                ps.setNull(1, Types.INTEGER);
	            }
	 
	            ps.setString(2, enquiry.getFirstName());
	            ps.setString(3, enquiry.getLastName());
	            ps.setString(4, enquiry.getEmail());
	            ps.setString(5, enquiry.getPhone());
	            ps.setString(6, enquiry.getSubject());
	            ps.setString(7, enquiry.getMessage());
	 
	            return ps.executeUpdate();
	 
	        } catch (SQLException e) {
	            System.err.println("Error inserting enquiry: " + e.getMessage());
	            throw e;
	        }
	    }
	 
	    //Retrieve all enquiries
	 
	    public List<EnquiryModel> getAllEnquiries() {
	        List<EnquiryModel> list = new ArrayList<>();
	        String sql = "SELECT * FROM enquiry ORDER BY Submitted_At DESC";
	 
	        try (Connection conn = DBconfig.getConnection();
	             PreparedStatement ps = conn.prepareStatement(sql);
	             ResultSet rs = ps.executeQuery()) {
	 
	            while (rs.next()) {
	                list.add(mapRow(rs));
	            }
	 
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	 
	        return list;
	    }
	 
	    //Helper: map one ResultSet row - EnquiryModel
	 
	    private EnquiryModel mapRow(ResultSet rs) throws SQLException {
	        EnquiryModel e = new EnquiryModel();
	        e.setEnquiryId(rs.getInt("Enquiry_ID"));
	 
	        int userId = rs.getInt("User_ID");
	        e.setUserId(rs.wasNull() ? null : userId);   
	 
	        e.setFirstName(rs.getString("First_Name"));
	        e.setLastName(rs.getString("Last_Name"));
	        e.setEmail(rs.getString("Email"));
	        e.setPhone(rs.getString("Phone"));
	        e.setSubject(rs.getString("Subject"));
	        e.setMessage(rs.getString("Message"));
	        e.setSubmittedAt(rs.getTimestamp("Submitted_At"));
	        return e;
	    }
}
