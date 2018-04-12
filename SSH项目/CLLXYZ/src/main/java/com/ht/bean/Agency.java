package com.ht.bean;

import com.ht.common.Constants;
import org.apache.struts2.json.annotations.JSON;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

/**
 * Created by qm on 2017/8/23.
 * 经销商
 */
public class Agency implements Serializable{
    private String id;//	 varchar(36)	编号,UUID，主键
    private String name;//  varchar(50)	经销商名称，unique
    private String email;// varchar(50)	邮箱，作为登录账号，unique, not null
    private String pwd;//	varchar(50)	密码,md5加密，not null
    private String leader;// varchar(20)	负责人姓名
    private String phone;// varchar(11)	手机号,unique，not null
    private String tel;//	varchar(11)	固定电话
    private String address;//	varchar(100)	地址
    private String logo;//	varchar(500)	商标图片，default
    private String intro;//	varchar(500)	简介
    private Date created_time;//	datetime	创建时间
    private short checked_status;//	tinyint	审核状态，默认为0,审核后为1
    private short status;//	tinyint	状态，激活1或冻结0

    private Role role = new Role(Constants.AGENCY_ROLE);//角色
    private Set<Activity> activities;//活动
    private Set<Buildings> buildings;//楼盘  在t_agency的表中没有buildings的字段,或许可以通过它所属的员工来查询有的楼盘
    private Set<Employee> employees;//员工
    private Set<Customer> customers;//客户
    private Set<Sale> sales;//销售记录
    private Set<Appointment> appointments;//预约


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

    public String getLeader() {
        return leader;
    }

    public void setLeader(String leader) {
        this.leader = leader;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

    public short getChecked_status() {
        return checked_status;
    }

    public void setChecked_status(short checked_status) {
        this.checked_status = checked_status;
    }

    public short getStatus() {
        return status;
    }

    public void setStatus(short status) {
        this.status = status;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    @JSON(serialize = false)
    public Set<Activity> getActivities() {
        return activities;
    }

    public void setActivities(Set<Activity> activities) {
        this.activities = activities;
    }

    @JSON(serialize = false)
    public Set<Buildings> getBuildings() {
        return buildings;
    }

    public void setBuildings(Set<Buildings> buildings) {
        this.buildings = buildings;
    }

    @JSON(serialize = false)
    public Set<Employee> getEmployees() {
        return employees;
    }

    public void setEmployees(Set<Employee> employees) {
        this.employees = employees;
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

    @JSON(serialize = false)
    public Set<Appointment> getAppointments() {
        return appointments;
    }

    public void setAppointments(Set<Appointment> appointments) {
        this.appointments = appointments;
    }

    @Override
    public String toString() {
        return "AgencyDAO{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", pwd='" + pwd + '\'' +
                ", leader='" + leader + '\'' +
                ", phone='" + phone + '\'' +
                ", tel='" + tel + '\'' +
                ", address='" + address + '\'' +
                ", logo='" + logo + '\'' +
                ", intro='" + intro + '\'' +
                ", created_time=" + created_time +
                ", checked_status=" + checked_status +
                ", status=" + status +
                '}';
    }
}
