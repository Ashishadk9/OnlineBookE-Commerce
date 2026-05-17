package com.uniquebooks.utils;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CookieUtil {
    public static void addCookie(HttpServletResponse resp,String name,
                                 String value, int maxAgeSeconds) {
        Cookie cookie = new Cookie(name, value);
        cookie.setMaxAge(maxAgeSeconds);
        cookie.setPath("/");
        cookie.setHttpOnly(true);
        resp.addCookie(cookie);
    }
    public static String getCookieValue(HttpServletRequest req,String name){
        Cookie[] cookies = req.getCookies();
        if(cookies != null){
            for (Cookie c: cookies){
                if(c.getName().equals(name)) return c.getValue();
            }
        }
        return null;
    }

    public static void deleteCookie(HttpServletResponse resp,String name){
        Cookie cookie = new Cookie(name, "");
        cookie.setMaxAge(0);
        cookie.setPath("/");
        resp.addCookie(cookie);
    }
}
