package com.ht.bean;

import org.apache.struts2.json.annotations.JSON;

import java.io.Serializable;
import java.util.Set;

/**
 * Created by qm on 2017/8/23.
 * 文章类别
 */
public class ArticleType implements Serializable{

    private String id;//	varchar(36)	编号,UUID，主键
    private String name;//varchar(50)	类别名称，uniquue,not null
    private String des;//	varchar(500)	类别描述
    private short status;

    private Set<Article> articles;

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

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    @JSON(serialize = false)
    public Set<Article> getArticles() {
        return articles;
    }

    public void setArticles(Set<Article> articles) {
        this.articles = articles;
    }

    public short getStatus() {
        return status;
    }

    public void setStatus(short status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "ArticleType{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", des='" + des + '\'' +
                ", status='" + status + '\'' +
                ", articles=" + articles +
                '}';
    }
}
