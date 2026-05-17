package com.uniquebooks.dao;

import com.uniquebooks.entity.Order;
import com.uniquebooks.utils.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
    public List<Order> findAll(){
        List<Order> list = new ArrayList<>();
        String sql="SELECT o.*, u.full_name AS customerName FROM orders o JOIN users u ON o.user_id = u.id ORDER BY o.order_date DESC";
        try (Connection conn= DatabaseConnection.getConnection();
             Statement st= conn.createStatement();
             ResultSet rs= st.executeQuery(sql)){
            while (rs.next()){
                Order o = new Order();
                o.setId(rs.getInt("id"));
                o.setOrderNumber(rs.getString("order_number"));
                o.setUserId(rs.getInt("user_id"));
                o.setOrderDate(rs.getDate("order_date"));
                o.setTotalAmount(rs.getDouble("total_amount"));
                o.setStatus(rs.getString("status"));
                o.setCustomerName(rs.getString("customerName"));
                list.add(o);
            }
        }catch (SQLException e){}
        return list;
    }

    public List<Order>findRecent(int limit){
        List<Order> list = new ArrayList<>();
        String sql="SELECT o.*, u.full_name AS customerName FROM orders o JOIN users u ON o.user_id = u.id ORDER BY o.order_date DESC LIMIT ?";
        try (Connection conn =DatabaseConnection.getConnection();
             PreparedStatement ps= conn.prepareStatement(sql)){
            ps.setInt(1,limit);
            ResultSet rs =ps.executeQuery();
            while (rs.next()){
                Order o = new Order();
                o.setOrderNumber(rs.getString("order_number"));
                o.setCustomerName(rs.getString("customerName"));
                o.setOrderDate(rs.getDate("order_date"));
                o.setTotalAmount(rs.getDouble("total_amount"));
                o.setStatus(rs.getString("status"));
                list.add(o);
            }
        } catch (SQLException e){}
        return list;
    }

    public double getTotalRevenue(){
        String sql="SELECT SUM(total_amount) FROM orders WHERE status IN ('delivered','shipped')";
        try (Connection conn = DatabaseConnection.getConnection();
        Statement st= conn.createStatement();
        ResultSet rs=st.executeQuery(sql)){
            if (rs.next()) return rs.getDouble(1);
        }catch (SQLException e){}
        return 0;
    }
    public long countOrders(){
        String sql="SELECT COUNT(*) FROM orders";
        try (Connection conn = DatabaseConnection.getConnection();
             Statement st= conn.createStatement();
             ResultSet rs=st.executeQuery(sql)){
            if (rs.next()) return rs.getInt(1);
        } catch (SQLException e){}
        return 0;
    }
}
