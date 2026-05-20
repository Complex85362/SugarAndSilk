package com.Sugar_and_Silk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Sugar_and_Silk.model.UserModel;
import com.Sugar_and_Silk.utils.DBconfig;

public class UserDAO {
	public List<UserModel> getAllUsers() throws SQLException {
        List<UserModel> users = new ArrayList<>();
        String sql = "SELECT User_ID, Username, Email, User_Role, is_active FROM user";
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                users.add(mapRow(rs));
            }
        }
        return users;
    }


public List<UserModel> searchUserById(int userId) throws SQLException {
    List<UserModel> users = new ArrayList<>();
    String sql = "SELECT User_ID, Username, Email, User_Role, is_active FROM user WHERE User_ID = ?";
    try (Connection conn = DBconfig.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, userId);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                users.add(mapRow(rs));
            }
        }
    }
    return users;
}
public boolean updateUserStatus(int userId, int status) throws SQLException {
    String sql = "UPDATE user SET is_active = ? WHERE User_ID = ?";
    try (Connection conn = DBconfig.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, status); // Sets 0 or 1
        ps.setInt(2, userId);
        return ps.executeUpdate() > 0;
    }
}

private UserModel mapRow(ResultSet rs) throws SQLException {
    UserModel user = new UserModel();
    user.setUserId(rs.getInt("User_ID"));
    user.setUsername(rs.getString("Username"));
    user.setEmail(rs.getString("Email"));
    user.setUserRole(rs.getString("User_Role"));
    user.setActive(rs.getInt("is_active")); 
    return user;
}

public boolean insertUser(String firstname, String lastname, String username, 
        String gender, String address, String email, 
        String password, String profileImageName) throws Exception {

		Connection con = DBconfig.getConnection();
		boolean isSuccess = false;
		
		String sql = "INSERT INTO user (Firstname, Lastname, Username, Gender, Address, Email, Password, Profile_Image, is_active, User_Role) "
		+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, 1, 'customer')";
		
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setString(1, firstname);
		pst.setString(2, lastname);
		pst.setString(3, username);
		pst.setString(4, gender);
		pst.setString(5, address);
		pst.setString(6, email);
		pst.setString(7, password);
		pst.setString(8, profileImageName); // We save the filename here
		
		int rowsAffected = pst.executeUpdate();
		if (rowsAffected > 0) {
		isSuccess = true;
		}
		
		pst.close();
		con.close();
		return isSuccess;
}

public boolean isUsernameOrEmailTaken(String username, String email) throws Exception {
    Connection con = DBconfig.getConnection();
    String sql = "SELECT COUNT(*) FROM user WHERE Username = ? OR Email = ?";
    PreparedStatement pst = con.prepareStatement(sql);
    pst.setString(1, username);
    pst.setString(2, email);
    
    ResultSet rs = pst.executeQuery();
    if (rs.next()) {
        int count = rs.getInt(1);
        return count > 0; // Returns true if found
    }
    
    con.close();
    return false;
}
public UserModel getUserByEmail(String email) throws Exception {
    UserModel user = null;
    Connection con = DBconfig.getConnection();
    
   
    String sql = "SELECT * FROM user WHERE Email = ?";
    PreparedStatement pst = con.prepareStatement(sql);
    pst.setString(1, email);
    
    ResultSet rs = pst.executeQuery();

    if (rs.next()) {
        user = new UserModel();
        user.setUserId(rs.getInt("User_ID"));
        user.setFirstName(rs.getString("Firstname"));
        user.setLastName(rs.getString("Lastname"));
        user.setUsername(rs.getString("Username"));
        user.setEmail(rs.getString("Email"));
        user.setPassword(rs.getString("Password")); // The hashed password
        user.setUserRole(rs.getString("User_Role"));
        user.setProfileImage(rs.getString("Profile_Image"));
        user.setActive(rs.getInt("is_active"));
        user.setAddress(rs.getString("Address"));
    }

    rs.close();
    pst.close();
    con.close();
    return user;
}
public boolean checkUsernameExists(String username) throws Exception {
    boolean exists = false;
    String sql = "SELECT COUNT(*) FROM user WHERE Username = ?";
    
    try (Connection con = DBconfig.getConnection();
         PreparedStatement pst = con.prepareStatement(sql)) {
        
        pst.setString(1, username);
        try (ResultSet rs = pst.executeQuery()) {
            if (rs.next() && rs.getInt(1) > 0) {
                exists = true;
            }
        }
    }
    return exists;
}

public boolean checkEmailExists(String email) throws Exception {
    boolean exists = false;
    String sql = "SELECT COUNT(*) FROM user WHERE Email = ?";
    
    try (Connection con = DBconfig.getConnection();
         PreparedStatement pst = con.prepareStatement(sql)) {
        
        pst.setString(1, email);
        try (ResultSet rs = pst.executeQuery()) {
            if (rs.next() && rs.getInt(1) > 0) {
                exists = true;
            }
        }
    }
    return exists;
}
public boolean updateProfile(int userId, String firstName, String lastName,
        String address, String profileImage) throws Exception {
// Build SQL dynamically — only update profileImage column if a new one was uploaded
String sql;
if (profileImage != null) {
sql = "UPDATE user SET Firstname = ?, Lastname = ?, Address = ?, Profile_Image = ? WHERE User_ID = ?";
} else {
sql = "UPDATE user SET Firstname = ?, Lastname = ?, Address = ? WHERE User_ID = ?";
}

try (Connection con = DBconfig.getConnection();
PreparedStatement pst = con.prepareStatement(sql)) {

pst.setString(1, firstName);
pst.setString(2, lastName);
pst.setString(3, address);

if (profileImage != null) {
pst.setString(4, profileImage);
pst.setInt(5, userId);
} else {
pst.setInt(4, userId);
}

return pst.executeUpdate() > 0;
}
}
}