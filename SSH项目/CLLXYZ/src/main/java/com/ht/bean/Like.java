package com.ht.bean;

import javax.sql.rowset.serial.SerialArray;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by qm on 2017/8/23.
 * 点赞记录
 */
public class Like implements Serializable{

    private String id;//	varchar(36)	编号,UUID，主键
    private Date created_time;//	datetime	点赞创建时间

    private Buildings buildings;//楼盘
    private User user;//用户

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getCreated_time() {
        return created_time;
    }

    public void setCreated_time(Date created_time) {
        this.created_time = created_time;
    }

    public Buildings getBuildings() {
        return buildings;
    }

    public void setBuildings(Buildings buildings) {
        this.buildings = buildings;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Like{" +
                "id='" + id + '\'' +
                ", created_time=" + created_time +
                '}';
    }
}
