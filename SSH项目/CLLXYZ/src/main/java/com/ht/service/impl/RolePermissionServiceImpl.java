package com.ht.service.impl;

import com.ht.bean.RolePermission;
import com.ht.common.Pager;
import com.ht.dao.RolePermissionDAO;
import com.ht.service.RolePermissionService;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class RolePermissionServiceImpl implements RolePermissionService {
    private RolePermissionDAO rolePermissionDAO;
    @Override
    public void save(RolePermission rolePermission) {
        rolePermissionDAO.save(rolePermission);
    }

    @Override
    public void remove(RolePermission rolePermission) {
        rolePermissionDAO.remove(rolePermission);
    }

    @Override
    public void update(RolePermission rolePermission) {
        rolePermissionDAO.update(rolePermission);
    }

    @Override
    public void updateStatus(String id, short status) {
        rolePermissionDAO.updateStatus(id, status);
    }

    @Override
    public RolePermission foundById(String id) {
        return rolePermissionDAO.foundById(id);
    }

    @Override
    public Pager<RolePermission> listPager(Pager<RolePermission> pager) {
        return  rolePermissionDAO.listPager(pager);
    }

    @Override
    public List<RolePermission> listAll() {
        return  rolePermissionDAO.listAll();
    }

    @Override
    public Long count(Pager pager){
        return  rolePermissionDAO.count(pager);
    }

    public RolePermissionDAO getRolePermissionDAO() {
        return rolePermissionDAO;
    }

    public void setRolePermissionDAO(RolePermissionDAO rolePermissionDAO) {
        this.rolePermissionDAO = rolePermissionDAO;
    }
}
