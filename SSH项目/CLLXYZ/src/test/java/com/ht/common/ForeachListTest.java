package com.ht.common;

import com.ht.bean.Mission;
import com.ht.bean.Sale;
import org.junit.Test;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class ForeachListTest {

    @Test
    public void testForeachList() {
        List<Mission> missions = new ArrayList<>();
        Mission m1 = new Mission();
        m1.setId("1");
        Mission m2 = new Mission();
        m2.setId("2");
        Mission m3 = new Mission();
        m3.setId("3");
        missions.add(m1);
        missions.add(m2);
        missions.add(m3);
        for (Mission m : missions) {
            m.setId("4");
        }
        for (Mission m : missions) {
            System.out.println(m.getId());
        }
    }

    @Test
    public void testArrayList() {
        List<Double> doubles = new ArrayList<>();
        for (int i = 0; i < 12; i++) {
            doubles.add(i + 0.0);
        }
        List<Sale> sales = new ArrayList<>();
        for (int i = 0; i < 5; i++) {
            Sale sale = new Sale();
            sale.setTotal_cost(10000);

        }
        for (Sale s : sales) {
            int month = s.getCreated_time().getMonth() + 1;
            for (int i = 0; i < 12; i++) {
                if (month == (i + 1)) {
                    doubles.set(i, s.getTotal_cost() + doubles.get(i));
                }
            }
        }
    }
}
