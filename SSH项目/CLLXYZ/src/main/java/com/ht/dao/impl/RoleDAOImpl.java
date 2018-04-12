package com.ht.dao.impl;

import com.ht.bean.Role;
import com.ht.common.HibernateSessionFactoryBean;
import com.ht.common.Pager;
import com.ht.dao.RoleDAO;

import java.util.List;

public class RoleDAOImpl extends HibernateSessionFactoryBean implements RoleDAO {

    @Override
    public void save(Role role) {
        getSessionFactory().getCurrentSession().save(role);
    }

    @Override
    public void remove(Role role) {
        getSessionFactory().getCurrentSession().remove(role);
    }

    @Override
    public void update(Role role) {
        getSessionFactory().getCurrentSession().update(role);
    }

    @Override
    public void updateStatus(String id, short status) {

    }

    @Override
    public Role foundById(String id) {
        return null;
    }

    @Override
    public Pager<Role> listPager(Pager<Role> pager) {
        return null;
    }

    @Override
    public List<Role> listAll() {
        return null;
    }

    @Override
    public Long count(Pager pager) {
        return 0l;
    }
}
