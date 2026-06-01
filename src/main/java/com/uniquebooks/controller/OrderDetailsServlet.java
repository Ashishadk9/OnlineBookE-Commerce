package com.uniquebooks.controller;

import com.uniquebooks.dao.OrderDAO;
import com.uniquebooks.entity.Order;
import com.uniquebooks.entity.OrderItem;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/order-details")
public class OrderDetailsServlet extends HttpServlet {
    private final OrderDAO orderDAO = new OrderDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
        String idParam = req.getParameter("id");
        if (idParam == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/orders");
            return;
        }
        int orderId = Integer.parseInt(idParam);
        Order order = orderDAO.findById(orderId);
        List<OrderItem> items=orderDAO.findOrderItems(orderId);
        req.setAttribute("order", order);
        req.setAttribute("items", items);
        req.getRequestDispatcher("/WEB-INF/admin/order-details.jsp").forward(req, resp);
    }
}
