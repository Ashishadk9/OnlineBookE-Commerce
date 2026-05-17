package com.uniquebooks.utils;

import java.util.regex.Pattern;

public class ValidationUtil {

    public static boolean isNullOrEmpty(String value){
        return value == null || value.trim().isEmpty();
    }
    public static boolean isValidFullName(String name){
        return name != null && name.matches("^[a-zA-Z]+(?:[\\s.][a-zA-Z]+)*$");
    }

    public static boolean isValidPhone(String phone){
        return phone != null && phone.matches("^[0-9]{10}$");
    }

    public static boolean isValidEmail(String email){
        String emailRegex="^[\\w-\\.]+@([\\w-]+\\.)+[a-zA-Z]{2,4}$";
        return email != null && Pattern.matches(emailRegex, email);
    }

    public static boolean isValidPassword(String password){
        String passwordRegex="^[a-zA-Z]+$";
        return password != null && password.matches(passwordRegex);
    }

    public static boolean doPasswordMatch(String password,String confirmPassword){
        return password != null && password.equals(confirmPassword);
    }
}
