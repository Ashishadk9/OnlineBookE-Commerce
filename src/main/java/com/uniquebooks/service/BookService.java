package com.uniquebooks.service;

import com.uniquebooks.dao.BookDAO;
import com.uniquebooks.entity.Book;

import java.util.List;

public class BookService {
    private final BookDAO dao=new BookDAO();

    public List<Book> findAll() {
        return dao.findAll();
    }
    public Book findById(int id) {
        return dao.findById(id);
    }
    public boolean addBook(Book b) {
        return dao.save(b);
    }
    public boolean updateBook(Book b) {
        return dao.update(b);
    }
    public boolean deleteBook(int id) {
        return dao.delete(id);
    }
    public long countBooks() {
        return dao.countBooks();
    }
}
