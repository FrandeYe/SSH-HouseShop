package com.ht.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by qm on 2017/8/23.
 * 活动
 */
public class Activity implements Serializable {

    private String id;//	varchar(36)	编号,UUID，主键
    private String title;//	varchar(50)	活动标题,not null
    private Date start_time;//	datetime	开始时间
    private Date end_time;//	datetime	结束时间
    private String address;//	varchar(100)	活动地址
    private String content;//	text	活动内容
    private String logo;//	varchar(500)	活动图片
    private Short status;

    private Agency agency;//经销商
    private Buildings buildings;//楼盘

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getStart_time() {
        return start_time;
    }

    public void setStart_time(Date start_time) {
        this.start_time = start_time;
    }

    public Date getEnd_time() {
        return end_time;
    }

    public void setEnd_time(Date end_time) {
        this.end_time = end_time;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public Agency getAgency() {
        return agency;
    }

    public void setAgency(Agency agency) {
        this.agency = agency;
    }

    public Buildings getBuildings() {
        return buildings;
    }

    public void setBuildings(Buildings buildings) {
        this.buildings = buildings;
    }

    public Short getStatus() {
        return status;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Activity{" +
                "title='" + title + '\'' +
                ", start_time=" + start_time +
                ", end_time=" + end_time +
                ", address='" + address + '\'' +
                ", content='" + content + '\'' +
                ", logo='" + logo + '\'' +
                ", status=" + status +
                '}';
    }
}
