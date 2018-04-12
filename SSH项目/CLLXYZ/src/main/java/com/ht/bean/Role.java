package com.ht.bean;

import org.apache.struts2.json.annotations.JSON;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

/**
 * Created by qm on 2017/8/23.
 * 角色
 */
public class Role implements Serializable {

    private String id;//	varchar(36)	编号,UUID，主键
    private String name	;//varchar(50)	角色名称,not null
    private String des;//	varchar(50)	角色描述,not null
    private Date created_time;//	datetime	创建时间
    private short status;//	tinyint	状态，激活或冻结

    private Set<Agency> agencies;//经销商
    private Set<Employee> employees;//员工
    private Set<User> users;//用户
    private Set<Admin> admins;//管理员
    private Set<RolePermission > rolePermissions;//角色权限

    public Role() {
    }

    public Role(String id) {
        this.id = id;
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

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
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
    public Set<Agency> getAgencies() {
        return agencies;
    }

    public void setAgencies(Set<Agency> agencies) {
        this.agencies = agencies;
    }

    @JSON(serialize = false)
    public Set<Employee> getEmployees() {
        return employees;
    }

    public void setEmployees(Set<Employee> employees) {
        this.employees = employees;
    }

    @JSON(serialize = false)
    public Set<User> getUsers() {
        return users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }

    @JSON(serialize = false)
    public Set<Admin> getAdmins() {
        return admins;
    }

    public void setAdmins(Set<Admin> admins) {
        this.admins = admins;
    }

    @JSON(serialize = false)
    public Set<RolePermission> getRolePermissions() {
        return rolePermissions;
    }

    public void setRolePermissions(Set<RolePermission> rolePermissions) {
        this.rolePermissions = rolePermissions;
    }
}
