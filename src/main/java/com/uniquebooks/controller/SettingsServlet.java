package com.uniquebooks.controller;

import com.uniquebooks.entity.User;
import com.uniquebooks.service.UserService;
import com.uniquebooks.utils.PasswordUtil;
import com.uniquebooks.utils.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/settings")
public class SettingsServlet extends HttpServlet {
    private final UserService userService= new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException{
        User admin=(User) SessionUtil.getAttribute(req, "user");
        req.setAttribute("admin",admin);
        req.getRequestDispatcher("/WEB-INF/views/admin/settings.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException{
        User admin=(User) SessionUtil.getAttribute(req, "user");
        String fullName=req.getParameter("fullName");
        String phone=req.getParameter("phone");
        String newPassword=req.getParameter("newPassword");
        String confirmPassword=req.getParameter("confirmPassword");


    admin.setFullName(fullName);
    admin.setPhone(phone);

    if(newPassword !=null && !newPassword.isEmpty()){
        if (newPassword.equals(confirmPassword)){
            admin.setPassword(PasswordUtil.hash(newPassword));
        }else {
            req.setAttribute("error", "Password do not match");
            req.getRequestDispatcher("/WEB-INF/views/admin/settings.jsp"). forward(req, resp);
            return;
        }
    }

    if (userService.updateProfile(admin)){
        SessionUtil.setAttribute(req, "user",admin); //update session
        req.setAttribute("message", "Settings updated successfully");
    } else{
        req.setAttribute("error", "Failed to update settings.");
    }
    req.setAttribute("admin", admin);
    req.getRequestDispatcher("/WEB-INF/views/admin/settings.jsp") .forward(req, resp);
  }
}
