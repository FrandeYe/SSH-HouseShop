package com.ht.bean;

import com.ht.common.Constants;

import java.io.Serializable;

/**
 * Created by qm on 2017/8/23.
 */
public class Admin implements Serializable{
    private String id;//	varchar(36)	编号,UUID，主键
    private String phone;//	varchar(11）	手机号
    private String name;//	varchar(50)	经销商名称，unique
    private String email;//	varchar(50)	邮箱
    private String pwd;//	varchar(50)	密码

    private Role role = new Role(Constants.ADMIN_ROLE);//角色

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
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

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "AdminDAO{" +
                "id='" + id + '\'' +
                ", phone='" + phone + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", pwd='" + pwd + '\'' +
                '}';
    }
}
