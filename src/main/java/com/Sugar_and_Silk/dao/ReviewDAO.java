package com.Sugar_and_Silk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import com.Sugar_and_Silk.model.ReviewModel;
import com.Sugar_and_Silk.utils.DBconfig;

public class ReviewDAO {

	private Connection conn;

	public ReviewDAO() {

		try {
			conn = DBconfig.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public boolean addReview(ReviewModel review) {

		boolean isAdded = false;

		String sql = "INSERT INTO review " + "(User_ID, Product_ID, Rating, Comment) " + "VALUES (?, ?, ?, ?)";

		try {

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, review.getUserId());
			ps.setInt(2, review.getProductId());
			ps.setInt(3, review.getRating());
			ps.setString(4, review.getComment());

			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
				isAdded = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return isAdded;
	}

	public List<ReviewModel> getReviewsByProductId(int productId) {

		List<ReviewModel> reviews = new ArrayList<>();

		String sql = "SELECT r.*, u.Username " + "FROM review r " + "JOIN user u ON r.User_ID = u.User_ID "
				+ "WHERE r.Product_ID = ? " + "ORDER BY r.Review_date DESC";

		try {

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, productId);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				ReviewModel review = new ReviewModel();

				review.setReviewId(rs.getInt("Review_ID"));
				review.setUserId(rs.getInt("User_ID"));
				review.setProductId(rs.getInt("Product_ID"));
				review.setRating(rs.getInt("Rating"));
				review.setComment(rs.getString("Comment"));
				review.setReviewDate(rs.getTimestamp("Review_date"));
				review.setUsername(rs.getString("Username"));

				reviews.add(review);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return reviews;
	}
}
