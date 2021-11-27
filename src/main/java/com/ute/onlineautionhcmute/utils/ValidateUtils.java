package com.ute.onlineautionhcmute.utils;

public class ValidateUtils {
    public static boolean isValidEmail (String email)
    {
        String regex = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
        return email.matches(regex);
    }
}
