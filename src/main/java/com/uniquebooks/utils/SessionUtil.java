package com.uniquebooks.utils;

import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServletRequest;

public class SessionUtil {
    public static void setAttribute(HttpServletRequest req, String key, Object value) {
        HttpSession session=req.getSession();
        session.setMaxInactiveInterval(30*60);
        session.setAttribute(key, value);
    }

    public static Object getAttribute(HttpServletRequest req, String key) {
        HttpSession session=req.getSession(false);
        return (session!=null)? session.getAttribute(key) :null;
    }

    public static void invalidate(HttpServletRequest req) {
        HttpSession session=req.getSession(false);
        if (session!=null) session.invalidate();
    }
}
