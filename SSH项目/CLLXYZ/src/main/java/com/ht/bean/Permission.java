package com.ht.bean;

import org.apache.struts2.json.annotations.JSON;

import java.util.Date;
import java.util.Set;

/**
 * Created by qm on 2017/8/23.
 * 权限
 */
public class Permission {

    private String id;//	varchar(36)	编号,UUID，主键
    private String name	;//varchar(500)	权限名称,not null
    private String des;//	varchar(50)	权限描述,not null
    private Date created_time;//	datetime	创建时间
    private short status;//	varchar(2)	状态，激活或冻结

    private Set<RolePermission> rolePermissions;//角色权限

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
    public Set<RolePermission> getRolePermissions() {
        return rolePermissions;
    }

    public void setRolePermissions(Set<RolePermission> rolePermissions) {
        this.rolePermissions = rolePermissions;
    }
}
