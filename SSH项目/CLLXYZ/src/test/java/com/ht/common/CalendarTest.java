package com.ht.common;

import org.junit.Test;

import javax.xml.crypto.Data;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class CalendarTest {

    @Test
    public void testCalendar() {
        Calendar instance = Calendar.getInstance();
        System.out.println(instance.get(Calendar.YEAR));
        System.out.println(instance.get(Calendar.MONTH) + 1);
        Date date = Calendar.getInstance().getTime();
        date.getYear();
    }

    @Test
    public void testDate() {
        SimpleDateFormat dateFormater = new SimpleDateFormat("yyyy-MM-dd");
        Date date=new Date();
        System.out.print(dateFormater.format(date));
    }

    @Test
    public void testTimeToData() {
        DateUtil.getBeginDate("2017年8月");
    }
}
