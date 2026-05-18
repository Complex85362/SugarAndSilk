package com.Sugar_and_Silk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Sugar_and_Silk.model.NewsModel;
import com.Sugar_and_Silk.utils.DBconfig;

public class NewsDAO {
	public List<NewsModel> getAllNews() {
        List<NewsModel> newsList = new ArrayList<>();
        String query = "SELECT * FROM news ORDER BY Publish_Date DESC";
 
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
 
            while (rs.next()) {
                newsList.add(mapRow(rs));
            }
 
        } catch (SQLException e) {
            e.printStackTrace();
        }
 
        return newsList;
    }
	
	
	public NewsModel getNewsById(int newsId) throws SQLException {
        String query = "SELECT * FROM news WHERE News_id = ?";
 
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
 
            ps.setInt(1, newsId);
 
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapRow(rs);
                }
            }
        }
 
        return null; // not found
    }
	
	public int insertNews(NewsModel news) throws SQLException {
        String query = "INSERT INTO news (User_ID, Category_id, Title, Content, Image_Path) "
                     + "VALUES (?, ?, ?, ?, ?)";
 
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
 
            ps.setInt(1, news.getUserId());
            ps.setInt(2, news.getCategoryId());
            ps.setString(3, news.getTitle());
            ps.setString(4, news.getContent());
            ps.setString(5, news.getImagePath());
 
            return ps.executeUpdate();
 
        } catch (SQLException e) {
            System.err.println("Error inserting news: " + e.getMessage());
            throw e;
        }
    }
	
	
	public int updateNews(NewsModel news) throws SQLException {
        String sql;
 
        if (news.getImagePath() != null) {
            sql = "UPDATE news SET Title = ?, Content = ?, Image_Path = ? "
                + "WHERE News_id = ?";
        } else {
            sql = "UPDATE news SET Title = ?, Content = ? "
                + "WHERE News_id = ?";
        }
 
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
 
            ps.setString(1, news.getTitle());
            ps.setString(2, news.getContent());
 
            if (news.getImagePath() != null) {
                ps.setString(3, news.getImagePath());
                ps.setInt(4, news.getNewsId());
            } else {
                ps.setInt(3, news.getNewsId());
            }
 
            return ps.executeUpdate();
        }
    }
	
	 public int deleteNews(int newsId) throws SQLException {
	        String sql = "DELETE FROM news WHERE News_id = ?";
	 
	        try (Connection conn = DBconfig.getConnection();
	             PreparedStatement ps = conn.prepareStatement(sql)) {
	 
	            ps.setInt(1, newsId);
	            return ps.executeUpdate();
	        }
	    }
	
	 
	 private NewsModel mapRow(ResultSet rs) throws SQLException {
	        NewsModel news = new NewsModel();
	        news.setNewsId(rs.getInt("News_id"));
	        news.setUserId(rs.getInt("User_ID"));
	        news.setCategoryId(rs.getInt("Category_id"));
	        news.setTitle(rs.getString("Title"));
	        news.setContent(rs.getString("Content"));
	        news.setImagePath(rs.getString("Image_Path"));
	        news.setPublishDate(rs.getTimestamp("Publish_Date"));
	        return news;
	    }
}
