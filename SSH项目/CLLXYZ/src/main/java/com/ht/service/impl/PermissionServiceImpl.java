package com.ht.service.impl;

import com.ht.bean.Permission;
import com.ht.common.Pager;
import com.ht.dao.PermissionDAO;
import com.ht.service.PermissionService;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class PermissionServiceImpl implements PermissionService {
    private PermissionDAO permissionDAO;
    @Override
    public void save(Permission permission) {
        permissionDAO.save(permission);
    }

    @Override
    public void remove(Permission permission) {
        permissionDAO.remove(permission);
    }

    @Override
    public void update(Permission permission) {
        permissionDAO.update(permission);
    }

    @Override
    public void updateStatus(String id, short status) {
        permissionDAO.updateStatus(id, status);
    }

    @Override
    public Permission foundById(String id) {
        return permissionDAO.foundById(id);
    }

    @Override
    public Pager<Permission> listPager(Pager<Permission> pager) {
        return permissionDAO.listPager(pager);
    }

    @Override
    public List<Permission> listAll() {
        return permissionDAO.listAll();
    }

    @Override
    public Long count(Pager pager){
        return permissionDAO.count(pager);
    }

    public PermissionDAO getPermissionDAO() {
        return permissionDAO;
    }

    public void setPermissionDAO(PermissionDAO permissionDAO) {
        this.permissionDAO = permissionDAO;
    }
}
