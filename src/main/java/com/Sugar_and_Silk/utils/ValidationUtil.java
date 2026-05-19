package com.Sugar_and_Silk.utils;

import java.util.regex.Pattern;

public class ValidationUtil {
	private static final String EMAIL_REGEX = "^[A-Za-z0-9+_.-]+@(.+)$";
    
    private static final String PHONE_REGEX = "^[0-9]{10}$";

    public static boolean isValidEmail(String email) {
        return Pattern.compile(EMAIL_REGEX).matcher(email).matches();
    }

    public static boolean isValidPhone(String phone) {
        return Pattern.compile(PHONE_REGEX).matcher(phone).matches();
    }
    
    public static boolean isValidRating(int rating) {
        return rating >= 1 && rating <= 5;
    }

    public static boolean isValidComment(String comment) {

        if (comment == null) {
            return false;
        }

        comment = comment.trim();

        return !comment.isEmpty() && comment.length() <= 500;
    }
}
