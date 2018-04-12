package com.ht.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by qm on 2017/8/23.
 * 楼盘图片
 */
public class BuildingsImg implements Serializable{

    private String id;//	varchar(36)	编号,UUID，主键
    private String img_path;//	varchar(500)	图片路径，not null
    private String img_des;//	varchar(50)	图片简单描述
    private Date created_time;//	datetime	创建时间

    private Buildings buildings;//楼盘

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getImg_path() {
        return img_path;
    }

    public void setImg_path(String img_path) {
        this.img_path = img_path;
    }

    public String getImg_des() {
        return img_des;
    }

    public void setImg_des(String img_des) {
        this.img_des = img_des;
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

    @Override
    public String toString() {
        return "BuildingsImgDAO{" +
                "id='" + id + '\'' +
                ", img_path='" + img_path + '\'' +
                ", img_des='" + img_des + '\'' +
                ", created_time=" + created_time +
                '}';
    }
}
