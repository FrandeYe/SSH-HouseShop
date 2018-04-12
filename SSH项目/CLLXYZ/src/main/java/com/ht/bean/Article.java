package com.ht.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by qm on 2017/8/23.
 * 文章
 */
public class Article implements Serializable{

    private String id;//	varchar(36)	编号,UUID，主键
    private String title;//	varchar(50)	文章标题,not null
    private String abstracts;//	varchar(100)	文章摘要,not null
    private String content;//	text	文章内容，not null
    private String logo;//	varchar(500)	文章图片路径
    private Date created_time;//	datetime	创建时间
    private short status;//	varchar(2)	状态，激活或冻结

    private ArticleType articleType;//文章类别

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

    public String getAbstracts() {
        return abstracts;
    }

    public void setAbstracts(String abstracts) {
        this.abstracts = abstracts;
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

    public ArticleType getArticleType() {
        return articleType;
    }

    public void setArticleType(ArticleType articleType) {
        this.articleType = articleType;
    }

    @Override
    public String toString() {
        return "Article{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", abstracts='" + abstracts + '\'' +
                ", content='" + content + '\'' +
                ", logo='" + logo + '\'' +
                ", created_time=" + created_time +
                ", status=" + status +
                '}';
    }
}
