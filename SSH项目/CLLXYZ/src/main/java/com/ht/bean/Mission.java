package com.ht.bean;

import java.io.Serializable;

/**
 * Created by qm on 2017/8/23.
 * 绩效
 */
public class Mission implements Serializable{

    private String id;//	varchar(36)	编号,UUID，主键
    private int quantity;//	int	员工任务量
    private int saleCount;// 员工当月已销售量
    private String monthes;//	int	月份
    private double bonus_percent;//	double	销售提成百分比
    private double basicSalary; //员工基本工资
    private double realSalary; //员工实际工资
    private Employee employee;
    private Agency agency;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getSaleCount() {
        return saleCount;
    }

    public void setSaleCount(int saleCount) {
        this.saleCount = saleCount;
    }

    public String getMonthes() {
        return monthes;
    }

    public void setMonthes(String monthes) {
        this.monthes = monthes;
    }

    public double getBonus_percent() {
        return bonus_percent;
    }

    public void setBonus_percent(double bonus_percent) {
        this.bonus_percent = bonus_percent;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Agency getAgency() {
        return agency;
    }

    public void setAgency(Agency agency) {
        this.agency = agency;
    }

    public double getBasicSalary() {
        return basicSalary;
    }

    public void setBasicSalary(double basicSalary) {
        this.basicSalary = basicSalary;
    }

    public double getRealSalary() {
        return realSalary;
    }

    public void setRealSalary(double realSalary) {
        this.realSalary = realSalary;
    }

    @Override
    public String toString() {
        return "Mission{" +
                "id='" + id + '\'' +
                ", quantity=" + quantity +
                ", saleCount=" + saleCount +
                ", monthes='" + monthes + '\'' +
                ", bonus_percent=" + bonus_percent +
                ", basicSalary=" + basicSalary +
                ", realSalary=" + realSalary +
                '}';
    }

}
