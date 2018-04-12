package com.ht.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by qm on 2017/8/23.
 * 角色权限
 */
public class RolePermission implements Serializable{

    private String id;//	varchar(36)	编号,UUID，主键
    private Date created_time;//	datetime	创建时间

    private Role role;//角色
    private Permission permission;//权限

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getCreated_time() {
        return created_time;
    }

    public void setCreated_time(Date created_time) {
        this.created_time = created_time;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Permission getPermission() {
        return permission;
    }

    public void setPermission(Permission permission) {
        this.permission = permission;
    }

    @Override
    public String toString() {
        return "RolePermission{" +
                "id='" + id + '\'' +
                ", created_time=" + created_time +
                '}';
    }
}
