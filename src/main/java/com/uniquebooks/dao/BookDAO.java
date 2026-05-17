package com.uniquebooks.dao;

import com.uniquebooks.entity.Book;
import com.uniquebooks.utils.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BookDAO {
    public List<Book> findAll() {
        List<Book> books = new ArrayList<>();
        String sql="SELECT * FROM books ORDER By id";
        try (Connection conn= DatabaseConnection.getConnection();
             Statement st= conn.createStatement();
             ResultSet rs = st.executeQuery(sql)){
            while (rs.next()) {
                books.add(extract(rs));
            }
        } catch (SQLException e){}
        return books;
    }

    public Book findById(int id) {
        String sql="SELECT * FROM books WHERE id=?";
        try (Connection conn=DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)){
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return extract(rs);

        }catch (SQLException e){}
        return null;
    }
    public boolean save(Book b) {
        String sql="INSERT INTO books(title,isbn,genre,author,published_date,price,stock,description,image_path) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
        try(Connection conn= DatabaseConnection.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1,b.getTitle());
            ps.setString(2,b.getIsbn());
            ps.setString(3,b.getGenre());
            ps.setString(4,b.getAuthor());
            ps.setDate(5, convertToSqlDate(b.getPublishedDate()));
            ps.setDouble(6,b.getPrice());
            ps.setInt(7,b.getStock());
            ps.setString(8,b.getDescription());
            ps.setString(9,b.getImagePath());
            return ps.executeUpdate() >0;
        } catch (SQLException e) {}
        return  false;
    }

    public boolean update(Book b) {
        String sql="UPDATE books SET title=?,isbn=?,genre=?,author=?,published_date=?,price=?,stock=?,description=?,image_path=? WHERE id=?";
        try (Connection conn=DatabaseConnection.getConnection();

        PreparedStatement ps = conn.prepareStatement(sql)){
            ps.setString(1,b.getTitle());
            ps.setString(2,b.getIsbn());
            ps.setString(3,b.getGenre());
            ps.setString(4,b.getAuthor());
            ps.setDate(5,convertToSqlDate(b.getPublishedDate()));
            ps.setDouble(6,b.getPrice());
            ps.setInt(7,b.getStock());
            ps.setString(8,b.getDescription());
            ps.setString(9,b.getImagePath());
            ps.setInt(10,b.getId());
            return ps.executeUpdate()>0;
        } catch (SQLException e){}
        return false;
    }
    private Book extract(ResultSet rs) throws SQLException {
        Book b = new Book();
        b.setId(rs.getInt("id"));
        b.setTitle(rs.getString("title"));
        b.setIsbn(rs.getString("isbn"));
        b.setGenre(rs.getString("genre"));
        b.setAuthor(rs.getString("author"));

        Date sqlDate = rs.getDate("published_date");
        b.setPublishedDate(sqlDate !=null ? sqlDate.toString():null);

        b.setPrice (rs.getDouble("price"));
        b.setStock(rs.getInt("stock"));
        b.setDescription(rs.getString("description"));
        b.setImagePath(rs.getString("image_path"));
        return b;
    }

    private java.sql.Date convertToSqlDate(String date) {
        if (date == null || date.trim().isEmpty()){
            return null;
        }
        try {
            return java.sql.Date.valueOf(date);
        } catch (IllegalArgumentException e){
            return null;
        }
    }

    public long countBooks(){
        String sql="SELECT COUNT(*) FROM books";
        try (Connection conn=DatabaseConnection.getConnection();
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(sql)) {
            if (rs.next()) return rs.getInt(1);
        } catch (SQLException e) {}
        return 0;
    }
    public boolean delete(int id) {
        String sql="DELETE FROM books WHERE id=?";
        try (Connection conn = DatabaseConnection.getConnection();
        PreparedStatement ps =conn.prepareStatement(sql)){
            ps.setInt(1,id);
            return ps.executeUpdate() >0;
        }catch (SQLException e){
            e.printStackTrace();
            return false;
        }
    }
}
