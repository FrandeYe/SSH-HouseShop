package com.ht.dao.impl;

import com.ht.bean.RolePermission;
import com.ht.common.HibernateSessionFactoryBean;
import com.ht.common.Pager;
import com.ht.dao.RolePermissionDAO;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class RolePermissionDAOImpl extends HibernateSessionFactoryBean implements RolePermissionDAO {
    @Override
    public void save(RolePermission rolePermission) {
        getSessionFactory().getCurrentSession().save(rolePermission);
    }

    @Override
    public void remove(RolePermission rolePermission) {
        getSessionFactory().getCurrentSession().remove(rolePermission);
    }

    @Override
    public void update(RolePermission rolePermission) {
        getSessionFactory().getCurrentSession().update(rolePermission);
    }

    @Override
    public void updateStatus(String id, short status) {

    }

    @Override
    public RolePermission foundById(String id) {
        return null;
    }

    @Override
    public Pager<RolePermission> listPager(Pager<RolePermission> pager) {
        return null;
    }

    @Override
    public List<RolePermission> listAll() {
        return null;
    }

    @Override
    public Long count(Pager pager) {
        return 0l;
    }
}
