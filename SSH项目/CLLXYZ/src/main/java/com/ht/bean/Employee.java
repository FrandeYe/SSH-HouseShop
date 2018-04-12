package com.ht.bean;

import com.ht.common.Constants;
import org.apache.struts2.json.annotations.JSON;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

/**
 * Created by qm on 2017/8/23.
 * 员工
 */
public class Employee implements Serializable{

    private String id;//	varchar(36)	员工编号,UUID，主键
    private String name;//varchar(50)	员工名称
    private String email;//	varchar(50)	邮箱，unique
    private String pwd;//	varchar(50)	密码,自动生成，使用默认密码not null
    private String phone;//	varchar(11)	手机号,用于登录账号，unique，not null
    private String qq;//	varchar(20)	qq号
    private String wechat;//	varchar(50)	微信号
    private String gender;//	varchar(2)	性别
    private String exp;//	varchar(50)	工作经验描述
    private String des;//	varchar(100)	最多50个字的个人说明
    private String address;//	varchar(100)	地址
    private double basic_salary;//	double	基本工资，not null
    private String headicon;//	varchar(500)	头像，default
    private String intro;//	varchar(500)	简介
    private Date created_time;//	datetime	创建时间
    private short status;//	tinyint	状态，激活或冻结

    private Agency agency;//经销商
    private Set<Customer> customers;//客户
    private Set<Sale> sales;//销售记录
    private Role role = new Role(Constants.EMPLOYEE_ROLE);//角色
    private Set<Mission> missions;//绩效
    private Set<Appointment> appointments;//预约
    private Buildings buildings;//楼盘


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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getWechat() {
        return wechat;
    }

    public void setWechat(String wechat) {
        this.wechat = wechat;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getExp() {
        return exp;
    }

    public void setExp(String exp) {
        this.exp = exp;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getBasic_salary() {
        return basic_salary;
    }

    public void setBasic_salary(double basic_salary) {
        this.basic_salary = basic_salary;
    }

    public String getHeadicon() {
        return headicon;
    }

    public void setHeadicon(String headicon) {
        this.headicon = headicon;
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

    public short getStatus() {
        return status;
    }

    public void setStatus(short status) {
        this.status = status;
    }

    public Agency getAgency() {
        return agency;
    }

    public void setAgency(Agency agency) {
        this.agency = agency;
    }

    @JSON(serialize = false)
    public Set<Customer> getCustomers() {
        return customers;
    }

    public void setCustomers(Set<Customer> customers) {
        this.customers = customers;
    }

    @JSON(serialize = false)
    public Set<Sale> getSales() {
        return sales;
    }

    public void setSales(Set<Sale> sales) {
        this.sales = sales;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    @JSON(serialize = false)
    public Set<Mission> getMissions() {
        return missions;
    }

    public void setMissions(Set<Mission> missions) {
        this.missions = missions;
    }

    @JSON(serialize = false)
    public Set<Appointment> getAppointments() {
        return appointments;
    }

    public void setAppointments(Set<Appointment> appointments) {
        this.appointments = appointments;
    }

    public Buildings getBuildings() {
        return buildings;
    }

    public void setBuildings(Buildings buildings) {
        this.buildings = buildings;
    }

    @Override
    public String toString() {
        return "EmployeeDAO{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", pwd='" + pwd + '\'' +
                ", phone='" + phone + '\'' +
                ", qq='" + qq + '\'' +
                ", wechat='" + wechat + '\'' +
                ", gender='" + gender + '\'' +
                ", exp='" + exp + '\'' +
                ", des='" + des + '\'' +
                ", address='" + address + '\'' +
                ", basic_salary=" + basic_salary +
                ", headicon='" + headicon + '\'' +
                ", intro='" + intro + '\'' +
                ", created_time=" + created_time +
                ", status=" + status +
                '}';
    }
}
