package com.ht.dao.impl;

import com.ht.bean.House;
import com.ht.common.HibernateSessionFactoryBean;
import com.ht.common.Pager;
import com.ht.dao.HouseDAO;
import org.hibernate.query.Query;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class HouseDAOImpl extends HibernateSessionFactoryBean implements HouseDAO {
    @Override
    public void save(House house) {
        getSessionFactory().getCurrentSession().save(house);
    }

    @Override
    public void remove(House house) {
        getSessionFactory().getCurrentSession().remove(house);
    }

    @Override
    public void update(House house) {
        getSessionFactory().getCurrentSession().update(house);
    }

    @Override
    public void updateStatus(String id, short status) {
        Query query = getSessionFactory().getCurrentSession().createQuery("update House house set house.status=:status where house.id=:id");
        query.setParameter("id",id);
        query.setParameter("status",status);
        query.executeUpdate();
    }

    @Override
    public House foundById(String id) {
        String sql = "from House where id=:id";
        Query query = getSessionFactory().getCurrentSession().createQuery(sql);
        query.setParameter("id",id);
        House house = (House) query.uniqueResult();
        return house;
    }

    @Override
    public Pager<House> listPager(Pager<House> pager) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from House" + pager.getParamStr());
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setResult(query.list());
        return pager;
    }

    @Override
    public List<House> listAll() {
        return null;
    }

    @Override
    public Long count(Pager pager) {
        Long result = (Long) getSessionFactory().getCurrentSession().createQuery("select count(id) from House" + pager.getParamStr()).uniqueResult();
        return result;
    }

    @Override
    public List<House> foundHouses(String agency_id) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from House where agency_id = :agency_id");
        query.setParameter("agency_id",agency_id);
        List<House> houses = query.list();
        return houses;
    }
}
