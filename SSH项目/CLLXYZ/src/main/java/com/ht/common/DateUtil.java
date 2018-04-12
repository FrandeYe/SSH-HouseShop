package com.ht.common;

import java.util.Calendar;

public class DateUtil {

    private static final Calendar instance = Calendar.getInstance();
    public static final int year = instance.get(Calendar.YEAR);
    public static final int month = instance.get(Calendar.MONTH) + 1;

    public static String getCurrentMonth() {
        return year + "年" + month + "月";
    }

    public static String getBeginDate() {
        return year + "-" + month + "-1";
    }

    public static String getEndDate() {
        return year + "-" + month + "-31";
    }

    public static String getBeginDate(String time) {
        int index = time.indexOf("年");
        String s1 = time.substring(0,index);
        String s2 = time.replaceAll("月", "");
        String s3 = s2.substring(index + 1);
        return s1 + "-" + s3 + "-1";
    }

    public static String getEndDate(String time) {
        int index = time.indexOf("年");
        String s1 = time.substring(0,index);
        String s2 = time.replaceAll("月", "");
        String s3 = s2.substring(index + 1);
        return s1 + "-" + s3 + "-31";
    }
}
