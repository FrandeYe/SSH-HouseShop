package com.ht.bean;

import org.apache.struts2.json.annotations.JSON;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

/**
 * Created by qm on 2017/8/23.
 * 户型
 */
public class House implements Serializable{

    private String id;//	varchar(36)	编号,UUID，主键
    private String name;//	varchar(50)	户型名称
    private String logo;//	varchar(500)	户型图片，default
    private String intro;//	varchar(500)	简介
    private double area;//	double	面积，not null
    private double unit_price;//	double	参考单价，not null
    private Date created_time;//	datetime	创建时间
    private short status;//	tinyint	状态，激活或冻结

    private Buildings buildings;//楼盘
    private Agency agency;
    private Set<Room> rooms;//房号
    private Set<Appointment> appointments;//预约

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public double getUnit_price() {
        return unit_price;
    }

    public void setUnit_price(double unit_price) {
        this.unit_price = unit_price;
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

    public Buildings getBuildings() {
        return buildings;
    }

    public void setBuildings(Buildings buildings) {
        this.buildings = buildings;
    }

    public Agency getAgency() {
        return agency;
    }

    public void setAgency(Agency agency) {
        this.agency = agency;
    }

    @JSON(serialize = false)
    public Set<Room> getRooms() {
        return rooms;
    }

    public void setRooms(Set<Room> rooms) {
        this.rooms = rooms;
    }

    @JSON(serialize = false)
    public Set<Appointment> getAppointments() {
        return appointments;
    }

    public void setAppointments(Set<Appointment> appointments) {
        this.appointments = appointments;
    }

    @Override
    public String toString() {
        return "House{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", logo='" + logo + '\'' +
                ", intro='" + intro + '\'' +
                ", area=" + area +
                ", unit_price=" + unit_price +
                ", created_time=" + created_time +
                ", status=" + status +
                '}';
    }
}
