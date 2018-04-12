package com.ht.bean;

import java.io.Serializable;

/**
 * Created by qm on 2017/8/23.
 * 房号
 */
public class Room implements Serializable{

    private String id;//	varchar(36)	编号,UUID，主键
    private String name;//	varchar(50)	房号名称
    private String sale_status;//	varchar(20)	销售状态，not null，默认为待售中

    private Building building;//楼栋
    private House house;//户型
    private Sale sale;//销售记录

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

    public String getSale_status() {
        return sale_status;
    }

    public void setSale_status(String sale_status) {
        this.sale_status = sale_status;
    }

    public Building getBuilding() {
        return building;
    }

    public void setBuilding(Building building) {
        this.building = building;
    }

    public House getHouse() {
        return house;
    }

    public void setHouse(House house) {
        this.house = house;
    }

    public Sale getSale() {
        return sale;
    }

    public void setSale(Sale sale) {
        this.sale = sale;
    }

    @Override
    public String toString() {
        return "Room{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", sale_status='" + sale_status + '\'' +
                '}';
    }
}
