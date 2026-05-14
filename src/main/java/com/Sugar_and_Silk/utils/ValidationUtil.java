package com.Sugar_and_Silk.utils;

import java.util.regex.Pattern;

public class ValidationUtil {
	private static final String EMAIL_REGEX = "^[A-Za-z0-9+_.-]+@(.+)$";
    
    private static final String PHONE_REGEX = "^[0-9]{10}$";
    
    private static final String PRODUCT_NAME_REGEX = "^[A-Za-z0-9\\s&'.,-]{3,100}$";

    public static boolean isValidEmail(String email) {
        return Pattern.compile(EMAIL_REGEX).matcher(email).matches();
    }

    public static boolean isValidPhone(String phone) {
        return Pattern.compile(PHONE_REGEX).matcher(phone).matches();
    }
    public static boolean isNullOrEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }

    public static boolean isValidProductName(String name) {
        return name != null &&
               Pattern.compile(PRODUCT_NAME_REGEX)
                      .matcher(name)
                      .matches();
    }

    public static boolean isPositiveDouble(String value) {

        try {
            double number = Double.parseDouble(value);
            return number > 0;

        } catch (NumberFormatException e) {
            return false;
        }
    }

    public static boolean isPositiveInteger(String value) {

        try {
            int number = Integer.parseInt(value);
            return number >= 0;

        } catch (NumberFormatException e) {
            return false;
        }
    }
}
