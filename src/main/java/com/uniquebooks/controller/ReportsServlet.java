package com.uniquebooks.controller;

import com.uniquebooks.dao.BookDAO;
import com.uniquebooks.dao.OrderDAO;
import com.uniquebooks.dao.UserDAO;
import com.uniquebooks.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/reports")
public class ReportsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException{
        BookDAO bookDAO = new BookDAO();
        OrderDAO orderDAO = new OrderDAO();
        UserDAO userDAO = new UserDAO();

        req.setAttribute("totalBooks", bookDAO.countBooks());
        req.setAttribute("totalOrders", orderDAO.countOrders());
        req.setAttribute("revenue", orderDAO.getTotalRevenue());
        req.setAttribute("pendingUsers", userDAO.countPending());
        req.setAttribute("orders",orderDAO.findAll());  //for detailed report table

        req.getRequestDispatcher("/WEB-INF/admin/reports.jsp").forward(req, resp);
    }
}
