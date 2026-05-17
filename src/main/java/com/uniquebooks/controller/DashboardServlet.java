package com.uniquebooks.controller;

import com.uniquebooks.dao.BookDAO;
import com.uniquebooks.dao.OrderDAO;
import com.uniquebooks.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/dashboard")
public class DashboardServlet  extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        BookDAO bookDAO = new BookDAO();
        OrderDAO orderDAO = new OrderDAO();
        UserDAO userDAO = new UserDAO();

        req.setAttribute("totalBooks", bookDAO.countBooks());
        req.setAttribute("totalOrders", orderDAO.countOrders());
        req.setAttribute("revenue", orderDAO.getTotalRevenue());
        req.setAttribute("pendingUsers", userDAO.countPending());
        req.setAttribute("recentOrders", orderDAO.findRecent(4));

        req.getRequestDispatcher("/WEB-INF/views/admin/dashboard.jsp").forward(req, resp);
    }
}
