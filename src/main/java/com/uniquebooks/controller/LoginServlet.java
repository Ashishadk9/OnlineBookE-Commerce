package com.uniquebooks.controller;

import com.uniquebooks.entity.User;
import com.uniquebooks.service.UserService;
import com.uniquebooks.utils.CookieUtil;
import com.uniquebooks.utils.PasswordUtil;
import com.uniquebooks.utils.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private final UserService userService =new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException{
        // Check for remember-me cookie
        String email= CookieUtil.getCookieValue(req, "remember_email");
        if (email!=null && !email.isEmpty()) {
            req.setAttribute("email", email);
        }
        req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException{
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String remember=req.getParameter("remember");

        User user = userService.findByEmail(email);
        if (user != null && PasswordUtil.check(password, user.getPassword()) && "approved".equals(user.getStatus())){
            SessionUtil.setAttribute(req,"user",user);
            SessionUtil.setAttribute(req,"role", user.getRole());
            SessionUtil.setAttribute(req,"userId", user.getId());
            SessionUtil.setAttribute(req,"fullName", user.getFullName());

            if ("on".equals(remember)) {
                CookieUtil.addCookie(resp,"remember_email",user.getEmail(), 7*24*60*60);
            }

            if ("admin".equals(user.getRole()))
                resp.sendRedirect(req.getContextPath()+"/admin/dashboard");
            else
                resp.sendRedirect(req.getContextPath()+"/home");
        }else {
            req.setAttribute("error","Invalid credentials or pending approval");
            req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
        }
    }
}
