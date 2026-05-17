package com.uniquebooks.controller;

import com.uniquebooks.dao.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/orders")
public class OrdersServlet  extends HttpServlet {
    private final OrderDAO orderDAO = new OrderDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException{
        req.setAttribute("orders", orderDAO.findAll());
        req.getRequestDispatcher("/WEB-INF/views/admin/orders.jsp") .forward(req, resp);

    }
}
