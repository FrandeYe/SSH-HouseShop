package com.ht.dao.impl;

import com.ht.bean.Permission;
import com.ht.common.HibernateSessionFactoryBean;
import com.ht.common.Pager;
import com.ht.dao.PermissionDAO;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class PermissionDAOImpl extends HibernateSessionFactoryBean implements PermissionDAO {
    @Override
    public void save(Permission permission) {
        getSessionFactory().getCurrentSession().save(permission);
    }

    @Override
    public void remove(Permission permission) {
        getSessionFactory().getCurrentSession().remove(permission);
    }

    @Override
    public void update(Permission permission) {
        getSessionFactory().getCurrentSession().update(permission);
    }

    @Override
    public void updateStatus(String id, short status) {

    }

    @Override
    public Permission foundById(String id) {
        return null;
    }

    @Override
    public Pager<Permission> listPager(Pager<Permission> pager) {
        return null;
    }

    @Override
    public List<Permission> listAll() {
        return null;
    }

    @Override
    public Long count(Pager pager) {
        return 0l;
    }
}
