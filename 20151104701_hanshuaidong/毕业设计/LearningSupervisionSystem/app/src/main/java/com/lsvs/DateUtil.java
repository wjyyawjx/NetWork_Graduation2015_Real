package com.lsvs;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

    public static String formatDateString(String date) {
        long dateLong = Long.valueOf(date);
        return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(dateLong));
    }

    public static Date decodeDateString(String date) {
        try {
            return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date);
        } catch (ParseException e) {
            return new Date();
        }
    }
}
