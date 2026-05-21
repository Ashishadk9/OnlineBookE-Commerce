package com.uniquebooks.controller;

import com.uniquebooks.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/customers")
public class CustomersServlet extends HttpServlet {
    private final UserService userService= new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException{
        req.setAttribute("customers", userService.getAllUsers());
        // returns list of users with role='user'
        req.getRequestDispatcher("/WEB-INF/admin/customers.jsp").forward(req, resp);
    }
}
