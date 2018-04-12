package com.ht.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by qm on 2017/8/23.
 *
 */
public class Ads implements Serializable{
    private String id;//	varchar(36)	编号,UUID，主键
    private String title;//	varchar(50)	广告标题,not null
    private String content;//	varchar(50)	广告描述,not null
    private String logo	;//varchar(500)	广告图片路径
    private String ad_url;//	varchar(500)	广告URL路径，可链接到单独的广告页面
    private short show_status;//	tinyint	是否显示
    private int show_order;//	int	显示顺序，按照主页，详情页的从左到右，从上到下的顺序规定广告位置
    private Date created_time;//	datetime	创建时间
    private short status;//	tinyint	状态，激活或冻结

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

    public String getAd_url() {
        return ad_url;
    }

    public void setAd_url(String ad_url) {
        this.ad_url = ad_url;
    }

    public short getShow_status() {
        return show_status;
    }

    public void setShow_status(short show_status) {
        this.show_status = show_status;
    }

    public int getShow_order() {
        return show_order;
    }

    public void setShow_order(int show_order) {
        this.show_order = show_order;
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

    @Override
    public String toString() {
        return "Ads{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", logo='" + logo + '\'' +
                ", ad_url='" + ad_url + '\'' +
                ", show_status=" + show_status +
                ", show_order=" + show_order +
                ", created_time=" + created_time +
                ", status=" + status +
                '}';
    }
}
