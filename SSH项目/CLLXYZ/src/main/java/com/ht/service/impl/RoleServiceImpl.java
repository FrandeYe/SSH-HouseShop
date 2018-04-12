package com.ht.service.impl;

import com.ht.bean.Role;
import com.ht.common.Pager;
import com.ht.dao.RoleDAO;
import com.ht.service.RoleService;

import java.util.List;

public class RoleServiceImpl implements RoleService {

    private RoleDAO roleDAO;

    @Override
    public void save(Role role) {
        roleDAO.save(role);
    }

    @Override
    public void remove(Role role) {
        roleDAO.remove(role);
    }

    @Override
    public void update(Role role) {
        roleDAO.update(role);
    }

    @Override
    public void updateStatus(String id, short status) {
        roleDAO.updateStatus(id, status);
    }

    @Override
    public Role foundById(String id) {
        return roleDAO.foundById(id);
    }

    @Override
    public Pager<Role> listPager(Pager<Role> pager) {
        return roleDAO.listPager(pager);
    }

    @Override
    public List<Role> listAll() {
        return roleDAO.listAll();
    }

    @Override
    public Long count(Pager pager){
        return roleDAO.count(pager);
    }

    public RoleDAO getRoleDAO() {
        return roleDAO;
    }

    public void setRoleDAO(RoleDAO roleDAO) {
        this.roleDAO = roleDAO;
    }
}
