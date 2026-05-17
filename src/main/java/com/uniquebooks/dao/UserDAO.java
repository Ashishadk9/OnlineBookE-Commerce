package com.uniquebooks.dao;

import com.uniquebooks.entity.User;
import com.uniquebooks.utils.DatabaseConnection;

import java.sql.Connection;
import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    public User findByEmail(String email) {
        String sql = "SELECT * FROM users WHERE email = ?";
        try (Connection conn = DatabaseConnection.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql)){
            ps.setString(1,email);
            ResultSet rs= ps.executeQuery();
            if (rs.next()) return extract(rs);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean save(User user) {
        String sql="INSERT INTO users (full_name, email, phone, password, role, status) VALUES (?,?,?,?,?,?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)){
            ps.setString(1, user.getFullName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getPassword());
            ps.setString(5,"user");
            ps.setString(6,"pending");
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
        }

        public List<User> findAllUsers() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM users WHERE role='user'";
        try (Connection conn = DatabaseConnection.getConnection();
        Statement st = conn.createStatement();
        ResultSet rs =st.executeQuery(sql)){
            while (rs.next()) list.add(extract(rs));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<User> findPendingUsers() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM users WHERE status='pending' AND role='user'";
        try (Connection conn = DatabaseConnection.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs =st.executeQuery(sql)){
            while (rs.next()) list.add(extract(rs));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean updateStatus(int userId, String status) {
        String sql = "UPDATE users SET status=? WHERE id=?";
        try (Connection conn = DatabaseConnection.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql)){
            ps.setString(1, status);
            ps.setInt(2, userId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

   public boolean updateProfile(User user) {
        String sql="UPDATE users SET full_name=?, phone=? WHERE id=?";
        try (Connection conn =DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)){
            ps.setString(1,user.getFullName());
            ps.setString(2,user.getPhone());
            ps.setInt(3,user.getId());
            return ps.executeUpdate() >0;
        } catch (SQLException e){
            e.printStackTrace();
        }
        return false;
   }

   public  int countPending(){
        String sql="SELECT count(*) FROM users WHERE status='pending' AND role='user'";
        try (Connection conn = DatabaseConnection.getConnection();
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(sql)){
            if (rs.next()) return rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
   }
   public long countTotal(){
        String sql="SELECT COUNT(*) FROM users";
        try (Connection conn = DatabaseConnection.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql)) {
            if (rs.next()) return rs.getLong(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
   }

   private  User extract(ResultSet rs) throws SQLException {
        User u = new User();
        u.setId(rs.getInt("id"));
        u.setFullName(rs.getString("full_name"));
       u.setEmail(rs.getString("email"));
       u.setPhone(rs.getString("phone"));
       u.setPassword(rs.getString("password"));
       u.setRole(rs.getString("role"));
       u.setStatus(rs.getString("status"));
       return u;
   }
}
