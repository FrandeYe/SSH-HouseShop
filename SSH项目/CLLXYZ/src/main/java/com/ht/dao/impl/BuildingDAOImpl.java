package com.ht.dao.impl;

import com.ht.bean.Building;
import com.ht.bean.Buildings;
import com.ht.common.HibernateSessionFactoryBean;
import com.ht.common.Pager;
import com.ht.dao.BuildingDAO;
import org.hibernate.query.Query;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class BuildingDAOImpl extends HibernateSessionFactoryBean implements BuildingDAO {
    @Override
    public void save(Building building) {
        getSessionFactory().getCurrentSession().save(building);
    }

    @Override
    public void remove(Building building) {
        getSessionFactory().getCurrentSession(). remove(building);
    }

    @Override
    public void update(Building building) {
        getSessionFactory().getCurrentSession(). update(building);
    }

    @Override
    public void updateStatus(String id, short status) {
        Query query = getSessionFactory().getCurrentSession().createQuery("update Building build set build.status=:status where build.id=:id");
        query.setParameter("id",id);
        query.setParameter("status",status);
        query.executeUpdate();
    }

    @Override
    public Building foundById(String id) {
        String sql = "from Building where id=:id";
        Query query = getSessionFactory().getCurrentSession().createQuery(sql);
        query.setParameter("id",id);
        Building building = (Building) query.uniqueResult();
        return building;
    }

    @Override
    public Pager<Building> listPager(Pager<Building> pager) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from Building" + pager.getParamStr());
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setResult(query.list());
        return pager;
    }

    @Override
    public List<Building> listAll() {
        return null;
    }

    @Override
    public Long count(Pager pager) {
        Long result = (Long) getSessionFactory().getCurrentSession().createQuery("select count(id) from Building" + pager.getParamStr()).uniqueResult();
        return result;
    }
}
