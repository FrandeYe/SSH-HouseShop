package com.ht.vo;

import java.io.Serializable;

public class BuildingsIndexVO implements Serializable {

    private String id;
    private String agencyId;
    private String logo;
    private String name;
    private String houseName;
    private String agencyName;
    private String saleStatus;
    private String address;
    private String area;
    private String tel;
    private String building_area;

    private int viewCount;
    private int commentCount;
    private int pictureCount;
    private int likeCount;

    private double longitude;
    private double latitude;
    private double beginPrice;
    private double meanPrice;

    private short booleanLike;

    public String getBuilding_area() {
        return building_area;
    }

    public void setBuilding_area(String building_area) {
        this.building_area = building_area;
    }

    public String getLongitudeLatitude() {
        return "longitude=" + longitude + "&latitude=" + latitude;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAgencyId() {
        return agencyId;
    }

    public void setAgencyId(String agencyId) {
        this.agencyId = agencyId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHouseName() {
        return houseName;
    }

    public String getAgencyName() {
        return agencyName;
    }

    public void setAgencyName(String agencyName) {
        this.agencyName = agencyName;
    }

    public void setHouseName(String houseName) {
        this.houseName = houseName;
    }

    public String getSaleStatus() {
        return saleStatus;
    }

    public void setSaleStatus(String saleStatus) {
        this.saleStatus = saleStatus;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public int getViewCount() {
        return viewCount;
    }

    public void setViewCount(int viewCount) {
        this.viewCount = viewCount;
    }

    public int getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(int commentCount) {
        this.commentCount = commentCount;
    }

    public int getPictureCount() {
        return pictureCount;
    }

    public void setPictureCount(int pictureCount) {
        this.pictureCount = pictureCount;
    }

    public double getBeginPrice() {
        return beginPrice;
    }

    public void setBeginPrice(double beginPrice) {
        this.beginPrice = beginPrice;
    }

    public double getMeanPrice() {
        return meanPrice;
    }

    public void setMeanPrice(double meanPrice) {
        this.meanPrice = meanPrice;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public int getLikeCount() {
        return likeCount;
    }

    public void setLikeCount(int likeCount) {
        this.likeCount = likeCount;
    }

    public short getBooleanLike() {
        return booleanLike;
    }

    public void setBooleanLike(short booleanLike) {
        this.booleanLike = booleanLike;
    }

    @Override
    public String toString() {
        return "BuildingsIndexVO{" +
                "id='" + id + '\'' +
                ", agencyId='" + agencyId + '\'' +
                ", name='" + name + '\'' +
                ", houseName='" + houseName + '\'' +
                ", agencyName='" + agencyName + '\'' +
                ", saleStatus='" + saleStatus + '\'' +
                ", address='" + address + '\'' +
                ", area='" + area + '\'' +
                ", tel='" + tel + '\'' +
                ", viewCount=" + viewCount +
                ", commentCount=" + commentCount +
                ", pictureCount=" + pictureCount +
                ", beginPrice=" + beginPrice +
                ", meanPrice=" + meanPrice +
                ", longitude=" + longitude +
                ", latitude=" + latitude +
                '}';
    }
}
