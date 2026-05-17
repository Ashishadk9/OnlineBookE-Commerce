package com.uniquebooks.service;

import com.uniquebooks.dao.BookRequestDAO;

public class BookRequestService {
    private final BookRequestDAO dao = new BookRequestDAO();

    public boolean requestBook(int userId, int bookId){
        return dao.requestBook(userId,bookId);
    }
}
