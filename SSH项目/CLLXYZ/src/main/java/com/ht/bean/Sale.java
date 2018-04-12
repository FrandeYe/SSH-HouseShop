package com.ht.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by qm on 2017/8/23.
 * 销售记录
 */
public class Sale implements Serializable{

    private String id;//	varchar(36)	编号,UUID，主键
    private Date sale_time;//	datetime	销售时间
    private double unit_price;//	double	销售单价
    private double discount;//	double	销售折扣
    private double total_cost;//	double	销售总价
    private Date created_time;//	datetime	创建时间
    private short status;//	varchar(2)	状态，激活或冻结

    private Room room;//房号
    private Agency agency;//经销商
    private Customer customer;//客户
    private Employee employee;//员工

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getSale_time() {
        return sale_time;
    }

    public void setSale_time(Date sale_time) {
        this.sale_time = sale_time;
    }

    public double getUnit_price() {
        return unit_price;
    }

    public void setUnit_price(double unit_price) {
        this.unit_price = unit_price;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public double getTotal_cost() {
        return total_cost;
    }

    public void setTotal_cost(double total_cost) {
        this.total_cost = total_cost;
    }

    public Date getCreated_time() {
        return created_time;
    }

    public void setCreated_time(Date created_time) {
        this.created_time = created_time;
    }

    public short getStatus() {
        return status;
    }

    public void setStatus(short status) {
        this.status = status;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public Agency getAgency() {
        return agency;
    }

    public void setAgency(Agency agency) {
        this.agency = agency;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    @Override
    public String toString() {
        return "Sale{" +
                "id='" + id + '\'' +
                ", sale_time=" + sale_time +
                ", unit_price=" + unit_price +
                ", discount=" + discount +
                ", total_cost=" + total_cost +
                ", created_time=" + created_time +
                ", status=" + status +
                '}';
    }
}
