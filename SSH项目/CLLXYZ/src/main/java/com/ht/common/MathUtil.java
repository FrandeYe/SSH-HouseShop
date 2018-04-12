package com.ht.common;

public class MathUtil {

    /**
     * 计算员工每销售一套房子的提成。
     * @param bonus_percent 销售提成
     * @param total_cost 销售总价
     * @return
     */
    public static double getRealSalary(double bonus_percent, double total_cost) {
        return bonus_percent * total_cost;
    }
}
