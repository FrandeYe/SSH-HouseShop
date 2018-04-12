package com.ht.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by qm on 2017/8/23.
 * 购房预约
 */
public class Appointment implements Serializable{
    private String id;//	varchar(36)	编号,UUID，主键
    private Date app_arrive_time	;//datetime	预约看房时间
    private Date arrive_time	;//datetime	真实看房时间
    private String app_status;//	varchar(20)	预约状态
    private Date created_time	;//datetime	创建时间
    private short status;//	tinyint	状态，激活或冻结

    private User user;//用户
    private House house;//户型
    private Employee employee;//员工
    private Agency agency;//经销商


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getApp_arrive_time() {
        return app_arrive_time;
    }

    public void setApp_arrive_time(Date app_arrive_time) {
        this.app_arrive_time = app_arrive_time;
    }

    public Date getArrive_time() {
        return arrive_time;
    }

    public void setArrive_time(Date arrive_time) {
        this.arrive_time = arrive_time;
    }

    public String getApp_status() {
        return app_status;
    }

    public void setApp_status(String app_status) {
        this.app_status = app_status;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public House getHouse() {
        return house;
    }

    public void setHouse(House house) {
        this.house = house;
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

    @Override
    public String toString() {
        return "Appointment{" +
                "id='" + id + '\'' +
                ", app_arrive_time=" + app_arrive_time +
                ", arrive_time=" + arrive_time +
                ", app_status='" + app_status + '\'' +
                ", created_time=" + created_time +
                ", status=" + status +
                '}';
    }
}
