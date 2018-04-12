package com.ht.vo;

public class GlobalSearchVO {

    private String name;
    private String id;
    private String type;
    private String logo;
    private String href;

    public String getHref() {
        if ("经销商".equals(type)) {
            href = "/employee/showAgencyDetailIndex?id=" + id;
        } else if ("楼盘".equals(type)) {
            href = "/buildings/showBuildingsInfo?id=" + id;
        } else if ("活动".equals(type)) {
            href = "/activity/showActivityInfo?id=" + id;
        } else if ("资讯".equals(type)) {
            href = "/article/showArticleInfo?id=" + id;
        }
        return href;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }
}
