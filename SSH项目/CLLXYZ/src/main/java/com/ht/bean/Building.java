package com.ht.bean;

import org.apache.struts2.json.annotations.JSON;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

/**
 * Created by qm on 2017/8/23.
 * 楼栋
 */
public class Building implements Serializable{

    private String id;//	varchar(36)	编号,UUID，主键
    private String name	;//varchar(50)	楼栋名称
    private int total_floor;//	int	总层数,not null
    private int total_lift;//	int	电梯数,not null
    private int floor_rooms;//	int	每层多少户,not null
    private int total_room;//	int	总户数,not null
    private Date created_time;//	datetime	创建时间
    private short status;//	tinyint	状态，激活或冻结
    private short room_status;

    private Buildings buildings;//楼盘
    private Set<Room> rooms;//房号
    private Agency agency;//经销商

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

    public int getTotal_floor() {
        return total_floor;
    }

    public void setTotal_floor(int total_floor) {
        this.total_floor = total_floor;
    }

    public int getTotal_lift() {
        return total_lift;
    }

    public void setTotal_lift(int total_lift) {
        this.total_lift = total_lift;
    }

    public int getFloor_rooms() {
        return floor_rooms;
    }

    public void setFloor_rooms(int floor_rooms) {
        this.floor_rooms = floor_rooms;
    }

    public int getTotal_room() {
        return total_room;
    }

    public void setTotal_room(int total_room) {
        this.total_room = total_room;
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

    @JSON(serialize = false)
    public Set<Room> getRooms() {
        return rooms;
    }

    public void setRooms(Set<Room> rooms) {
        this.rooms = rooms;
    }

    public Agency getAgency() {
        return agency;
    }

    public void setAgency(Agency agency) {
        this.agency = agency;
    }

    public short getRoom_status() {
        return room_status;
    }

    public void setRoom_status(short room_status) {
        this.room_status = room_status;
    }

    @Override
    public String toString() {
        return "Building{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", total_floor=" + total_floor +
                ", total_lift=" + total_lift +
                ", floor_rooms=" + floor_rooms +
                ", total_room=" + total_room +
                ", created_time=" + created_time +
                ", status=" + status +
                ", room_status=" + room_status +
                '}';
    }
}
