package com.uniquebooks.controller;

import com.uniquebooks.utils.CookieUtil;
import com.uniquebooks.utils.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        SessionUtil.invalidate(req);
        CookieUtil.deleteCookie(resp,"remember_email");
        resp.sendRedirect(req.getContextPath()+"/login");
    }
}
