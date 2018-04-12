package com.ht.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by qm on 2017/8/23.
 * 留言
 */
public class Message implements Serializable{
    private String id;//	varchar(36)	编号,UUID，主键
    private String content;//	text	留言内容
    private String reply;//	text	回复内容
    private Date leave_time;//datetime	留言时间
    private Date reply_time;//	datetime	回复时间
    private short status;//	tinyint	状态，激活或冻结

    private Buildings buildings;//楼盘
    private User user;//用户
    private Agency agency;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public Date getLeave_time() {
        return leave_time;
    }

    public void setLeave_time(Date leave_time) {
        this.leave_time = leave_time;
    }

    public Date getReply_time() {
        return reply_time;
    }

    public void setReply_time(Date reply_time) {
        this.reply_time = reply_time;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Agency getAgency() {
        return agency;
    }

    public void setAgency(Agency agency) {
        this.agency = agency;
    }

    @Override
    public String toString() {
        return "Message{" +
                "id='" + id + '\'' +
                ", content='" + content + '\'' +
                ", reply='" + reply + '\'' +
                ", leave_time=" + leave_time +
                ", reply_time=" + reply_time +
                ", status=" + status +
                '}';
    }
}
