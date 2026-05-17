package com.uniquebooks.controller;

import com.uniquebooks.entity.User;
import com.uniquebooks.service.UserService;
import com.uniquebooks.utils.PasswordUtil;
import com.uniquebooks.utils.ValidationUtil;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/register.jsp") .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
        String fullName = req.getParameter("fullName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");

        // Validation using the utility class
        if (ValidationUtil.isNullOrEmpty(fullName) || !ValidationUtil.isValidFullName(fullName)) {
            req.setAttribute("error", "Full Name is invalid.");
            req.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(req, resp);
            return;
        }

        if (!ValidationUtil.isValidEmail(email)) {
            req.setAttribute("error", "Email is invalid.");
            req.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(req, resp);
            return;
        }

        if (!ValidationUtil.isValidPhone(phone)) {
            req.setAttribute("error", "Phone number must be 10 digits.");
            req.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(req, resp);
            return;
        }

        if (!ValidationUtil.isValidPassword(password)) {
            req.setAttribute("error", "Password must be at least 8 characters long.");
            req.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(req, resp);
            return;
        }

        if (!ValidationUtil.doPasswordMatch(password, confirmPassword)) {
            req.setAttribute("error", "Passwords do not match.");
            req.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(req, resp);
            return;
        }

        //Check if email already exists
        User existing =userService.findByEmail(email);
        if (existing != null) {
            req.setAttribute("error", "Email already exists.");
            req.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(req, resp);
            return;
        }

        // create new user
        User user = new User();
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPhone(phone);
        user.setPassword(PasswordUtil.hash(password)); // Hash with Bcrypt

        boolean success = userService.register(user);
        if (success) {
            req.setAttribute("message", "Register successful. Wait for approval.");
            req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
        } else {
            req.setAttribute("error", "Register failed. Please try again.");
            req.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(req, resp);
        }
    }
}
