package com.Sugar_and_Silk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Sugar_and_Silk.model.DashboardStatsModel;
import com.Sugar_and_Silk.utils.DBconfig;

public class DashboardDAO {
	public DashboardStatsModel getStats() {
        DashboardStatsModel stats = new DashboardStatsModel();
 
        stats.setTotalProducts(runCount("SELECT COUNT(*) FROM product"));
        stats.setTotalCustomers(runCount("SELECT COUNT(*) FROM user WHERE User_Role = 'customer'"));
        stats.setTotalEnquiries(runCount("SELECT COUNT(*) FROM enquiry"));
 
        return stats;
    }
 
    // Helper: COUNT query and return the integer result 
    private int runCount(String sql) {
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
 
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;  
    }
}
