package com.ht.vo;

import java.io.Serializable;
import java.util.Date;

public class BuildingsIndexInfoVO implements Serializable {

    private String id;//	varchar(36)	编号,UUID，主键
    private String name	;//varchar(50)	楼盘名称
    private String area	;//varchar(50)	所属区域
    private String address;//	varchar(100)	地址
    private double floor_area;//	double	占地面积
    private double building_area;//	double	建筑面积
    private String house_type;//	varchar(20）	房源类型，如商业，住宅
    private String building_type;//	varchar(20)	建筑类型，如塔楼，板楼
    private double longitude;//	double	经度，not null
    private double latitude;//	double	纬度,not null
    private double avg_price;//	double	楼盘均价，not null
    private String company;//	varchar(100)	开发公司
    private int total_rooms;//	int	总套数
    private String reception_address;//	varchar(100)	接待地址, not null
    private String tel;//	varchar(11)	楼盘售楼电话,not null
    private double green_ratio	;//double	绿化率
    private double plot_ratio;//	double	容积率
    private String property_company;//	varchar(100)	物业公司
    private double property_fee;//	double	物业费
    private int car_station;//	int	车位数
    private String traffic;//	text	交通状况
    private String equipments;//	text	周边配套
    private String logo	;//varchar(500)	楼盘封面，default
    private String intro;//	varchar(500)	简介
    private Date created_time;//	datetime	创建时间

    private String agencyId;
    private String agencyName;
    private String houseName;
    private String saleStatus;
    private int viewCount;
    private int commentCount;
    private int messageCount;
    private int imgCount;
    private int likeCount;
    private double beginPrice;
    private short booleanLike;

    public String getLongitudeLatitude() {
        return "longitude=" + longitude + "&latitude=" + latitude;
    }

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

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getFloor_area() {
        return floor_area;
    }

    public void setFloor_area(double floor_area) {
        this.floor_area = floor_area;
    }

    public double getBuilding_area() {
        return building_area;
    }

    public void setBuilding_area(double building_area) {
        this.building_area = building_area;
    }

    public String getHouse_type() {
        return house_type;
    }

    public void setHouse_type(String house_type) {
        this.house_type = house_type;
    }

    public String getBuilding_type() {
        return building_type;
    }

    public void setBuilding_type(String building_type) {
        this.building_type = building_type;
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

    public double getAvg_price() {
        return avg_price;
    }

    public void setAvg_price(double avg_price) {
        this.avg_price = avg_price;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public int getTotal_rooms() {
        return total_rooms;
    }

    public void setTotal_rooms(int total_rooms) {
        this.total_rooms = total_rooms;
    }

    public String getReception_address() {
        return reception_address;
    }

    public void setReception_address(String reception_address) {
        this.reception_address = reception_address;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public double getGreen_ratio() {
        return green_ratio;
    }

    public void setGreen_ratio(double green_ratio) {
        this.green_ratio = green_ratio;
    }

    public double getPlot_ratio() {
        return plot_ratio;
    }

    public void setPlot_ratio(double plot_ratio) {
        this.plot_ratio = plot_ratio;
    }

    public String getProperty_company() {
        return property_company;
    }

    public void setProperty_company(String property_company) {
        this.property_company = property_company;
    }

    public double getProperty_fee() {
        return property_fee;
    }

    public void setProperty_fee(double property_fee) {
        this.property_fee = property_fee;
    }

    public int getCar_station() {
        return car_station;
    }

    public void setCar_station(int car_station) {
        this.car_station = car_station;
    }

    public String getTraffic() {
        return traffic;
    }

    public void setTraffic(String traffic) {
        this.traffic = traffic;
    }

    public String getEquipments() {
        return equipments;
    }

    public void setEquipments(String equipments) {
        this.equipments = equipments;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public Date getCreated_time() {
        return created_time;
    }

    public void setCreated_time(Date created_time) {
        this.created_time = created_time;
    }

    public String getAgencyId() {
        return agencyId;
    }

    public void setAgencyId(String agencyId) {
        this.agencyId = agencyId;
    }

    public String getAgencyName() {
        return agencyName;
    }

    public void setAgencyName(String agencyName) {
        this.agencyName = agencyName;
    }

    public String getHouseName() {
        return houseName;
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

    public int getMessageCount() {
        return messageCount;
    }

    public void setMessageCount(int messageCount) {
        this.messageCount = messageCount;
    }

    public int getImgCount() {
        return imgCount;
    }

    public void setImgCount(int imgCount) {
        this.imgCount = imgCount;
    }

    public int getLikeCount() {
        return likeCount;
    }

    public void setLikeCount(int likeCount) {
        this.likeCount = likeCount;
    }

    public double getBeginPrice() {
        return beginPrice;
    }

    public void setBeginPrice(double beginPrice) {
        this.beginPrice = beginPrice;
    }

    public short getBooleanLike() {
        return booleanLike;
    }

    public void setBooleanLike(short booleanLike) {
        this.booleanLike = booleanLike;
    }

    @Override
    public String toString() {
        return "BuildingsIndexInfoVO{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", area='" + area + '\'' +
                ", address='" + address + '\'' +
                ", floor_area=" + floor_area +
                ", building_area=" + building_area +
                ", house_type='" + house_type + '\'' +
                ", building_type='" + building_type + '\'' +
                ", longitude=" + longitude +
                ", latitude=" + latitude +
                ", avg_price=" + avg_price +
                ", company='" + company + '\'' +
                ", total_rooms=" + total_rooms +
                ", reception_address='" + reception_address + '\'' +
                ", tel='" + tel + '\'' +
                ", green_ratio=" + green_ratio +
                ", plot_ratio=" + plot_ratio +
                ", property_company='" + property_company + '\'' +
                ", property_fee=" + property_fee +
                ", car_station=" + car_station +
                ", traffic='" + traffic + '\'' +
                ", equipments='" + equipments + '\'' +
                ", logo='" + logo + '\'' +
                ", intro='" + intro + '\'' +
                ", created_time=" + created_time +
                ", agencyId='" + agencyId + '\'' +
                ", agencyName='" + agencyName + '\'' +
                ", houseName='" + houseName + '\'' +
                ", saleStatus='" + saleStatus + '\'' +
                ", viewCount=" + viewCount +
                ", commentCount=" + commentCount +
                ", messageCount=" + messageCount +
                ", imgCount=" + imgCount +
                ", likeCount=" + likeCount +
                ", beginPrice=" + beginPrice +
                ", booleanLike=" + booleanLike +
                '}';
    }
}
