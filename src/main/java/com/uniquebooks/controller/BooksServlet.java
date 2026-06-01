package com.uniquebooks.controller;

import com.uniquebooks.entity.Book;
import com.uniquebooks.service.BookService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet("/admin/books")
public class BooksServlet extends HttpServlet {
    private final BookService bookService=new BookService();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action=req.getParameter("action");

        if ("edit".equals(action)) {
            int id=Integer.parseInt(req.getParameter("id"));
            req.setAttribute("book", bookService.findById(id));
            req.getRequestDispatcher("/WEB-INF/admin/edit-books.jsp").forward(req, resp);
        } else if ("view".equals(action)) {
            int id=Integer.parseInt(req.getParameter("id"));
            req.setAttribute("book", bookService.findById(id));
            req.getRequestDispatcher("/WEB-INF/admin/view-book.jsp").forward(req, resp);
        } else if ("delete".equals(action)) {
            int id=Integer.parseInt(req.getParameter("id"));
            bookService.deleteBook(id);
            resp.sendRedirect(req.getContextPath()+"/admin/books");
        }else if ("add".equals(action)) {
            req.getRequestDispatcher("/WEB-INF/admin/edit-books.jsp").forward(req, resp);
        } else {
            req.setAttribute("books", bookService.findAll());
            req.getRequestDispatcher("/WEB-INF/admin/manage-books.jsp").forward(req, resp);
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action=req.getParameter("action");

        Book book=new Book();
        book.setTitle(req.getParameter("title"));
        book.setIsbn(req.getParameter("isbn"));
        book.setGenre(req.getParameter("genre"));
        book.setAuthor(req.getParameter("author"));
        book.setPublishedDate(req.getParameter("publishedDate"));
        book.setPrice(Double.parseDouble(req.getParameter("price")));
        book.setStock(Integer.parseInt(req.getParameter("stock")));
        book.setDescription(req.getParameter("description"));
        book.setImagePath(req.getParameter("imagePath"));

        if ("add".equals(action)) {
            bookService.addBook(book);
        } else if ("update".equals(action)) {
            book.setId(Integer.parseInt(req.getParameter("id")));
            bookService.updateBook(book);
        }
        resp.sendRedirect(req.getContextPath()+"/admin/books");
    }
}
