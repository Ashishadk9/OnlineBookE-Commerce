package com.uniquebooks.dao;

import com.uniquebooks.utils.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class BookRequestDAO {
    public boolean requestBook(int userId, int bookId){
        String sql = "INSERT INTO book_requests (user_id,book_id, status) VALUES (?,?, 'pending')";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)){
            ps.setInt(1,userId);
            ps.setInt(2,bookId);
            return ps.executeUpdate() >0;

        } catch (SQLException e){
            e.printStackTrace();
            return false;
        }
    }
}
