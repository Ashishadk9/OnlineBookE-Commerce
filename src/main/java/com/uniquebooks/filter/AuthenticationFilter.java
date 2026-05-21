package com.uniquebooks.filter;

import com.uniquebooks.utils.CookieUtil;
import com.uniquebooks.utils.SessionUtil;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.*;

import java.io.IOException;
import jakarta.servlet.Filter;

@WebFilter("/*")
public class AuthenticationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        String uri = request.getRequestURI();
        String contextPath = request.getContextPath();
        String path = request.getServletPath();

        // allow static resource and public pages
        if (path.startsWith("/static") || path.equals("/login") || path.equals("/register")
        || path.equals("/home") || path.equals("/product") || path.equals("/about")) {
            chain.doFilter(req, resp);
            return;
        }

        Object user= SessionUtil.getAttribute(request, "user");
        String role = (String) SessionUtil.getAttribute(request, "role");

        if (user == null) {
            // Try remember-me cookie
            String email = CookieUtil.getCookieValue(request,"remember-email");
            if (email != null && !email.isEmpty()) {
                // auto-login: you could fetch user from DB and set session here
            }
            response.sendRedirect(contextPath + "/login");
            return;
        }

        // Block non-admin from accessing /admin/*
        if (path.startsWith("/admin") && !"admin".equals(role)) {
            response.sendError(403, "Access Denied");
            return;
        }
        chain.doFilter(req, resp);
    }

}
