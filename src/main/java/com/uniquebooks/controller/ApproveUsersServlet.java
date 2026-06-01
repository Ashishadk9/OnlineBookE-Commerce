package com.uniquebooks.controller;

import com.uniquebooks.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/approve-users")
public class ApproveUsersServlet extends HttpServlet {
    private final UserService userService=new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException{
        String action=req.getParameter("action");
        if ("approve".equals(action)){
            int id=Integer.parseInt(req.getParameter("id"));
            userService.approveUser(id);
            resp.sendRedirect(req.getContextPath() + "/admin/approve-users");
        } else if("reject".equals(action)){
            int id=Integer.parseInt(req.getParameter("id"));
            userService.rejectUser(id);
            resp.sendRedirect(req.getContextPath() + "/admin/approve-users");
        } else {
            // Show pending users list
            req.setAttribute("pendingList",userService.getPendingUsers() );
            req.getRequestDispatcher("/WEB-INF/admin/approve-users.jsp").forward(req, resp);
        }
    }
}
