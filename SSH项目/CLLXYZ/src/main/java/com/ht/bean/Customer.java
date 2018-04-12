package com.ht.bean;

import org.apache.struts2.json.annotations.JSON;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

/**
 * Created by qm on 2017/8/23.
 * 客户
 */
public class Customer implements Serializable{

    private String id;//	varchar(36)	编号,UUID，主键
    private String name	;//text	姓名
    private String gender;//	varchar(2)	性别
    private Date birthday;	//date	生日
    private String identity_id;//	varchar(18)	身份证号
    private String email;	//	varchar(50)	邮箱,not null
    private String phone;	//	varchar(11)	手机号，not null,unique
    private String address;	//	varchar(100)	联系地址,not null
    private String customer_type;	//	varchar(20)	客户类型，如预约客户，意向客户，预定客户，购房客户
    private String together;	//	varchar(100)	共同购房人姓名，多个姓名用英文逗号隔开
    private String contract	;	//varchar(500)	电子版购房合同路径
    private String archives	;	//varchar(500)	zip版电子档案路径
    private Date created_time;//	datetime	创建时间
    private short status;//	tinyint	状态，激活或冻结


    private Set<Sale> sales;//销售记录
    private Role role;//角色

    private Employee employee;
    private Agency agency;

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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getIdentity_id() {
        return identity_id;
    }

    public void setIdentity_id(String identity_id) {
        this.identity_id = identity_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCustomer_type() {
        return customer_type;
    }

    public void setCustomer_type(String customer_type) {
        this.customer_type = customer_type;
    }

    public String getTogether() {
        return together;
    }

    public void setTogether(String together) {
        this.together = together;
    }

    public String getContract() {
        return contract;
    }

    public void setContract(String contract) {
        this.contract = contract;
    }

    public String getArchives() {
        return archives;
    }

    public void setArchives(String archives) {
        this.archives = archives;
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

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Agency getAgency() {
        return agency;
    }

    public void setAgency(Agency agency) {
        this.agency = agency;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", birthday=" + birthday +
                ", identity_id='" + identity_id + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", customer_type='" + customer_type + '\'' +
                ", together='" + together + '\'' +
                ", contract='" + contract + '\'' +
                ", archives='" + archives + '\'' +
                ", created_time=" + created_time +
                ", status=" + status +
                '}';
    }
}
