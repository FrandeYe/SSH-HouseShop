package com.ht.dao.impl;

import com.ht.bean.Buildings;
import com.ht.common.HibernateSessionFactoryBean;
import com.ht.common.Pager;
import com.ht.dao.BuildingsDAO;
import org.hibernate.query.Query;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class BuildingsDAOImpl extends HibernateSessionFactoryBean implements BuildingsDAO {
    @Override
    public void save(Buildings buildings) {
        getSessionFactory().getCurrentSession().save(buildings);
    }

    @Override
    public void remove(Buildings buildings) {
        getSessionFactory().getCurrentSession().remove(buildings);
    }

    @Override
    public void update(Buildings buildings) {
        getSessionFactory().getCurrentSession().update(buildings);
    }

    @Override
    public void updateStatus(String id, short status) {
        Query query = getSessionFactory().getCurrentSession().createQuery(" update Buildings set status=:status where id=:id");
        query.setParameter("status",status);
        query.setParameter("id",id);
        query.executeUpdate();
    }

    @Override
    public Buildings foundById(String id) {
        String sql = "from Buildings where id=:id";
        Query query = getSessionFactory().getCurrentSession().createQuery(sql);
        query.setParameter("id",id);
        Buildings buildings = (Buildings) query.uniqueResult();
        return buildings;
    }

    @Override
    public Pager<Buildings> listPager(Pager<Buildings> pager) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from Buildings" + pager.getParamStr());
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setResult(query.list());
        return pager;
    }

    @Override
    public List<Buildings> listAll() {
        return null;
    }

    @Override
    public Long count(Pager pager) {
        Long result = (Long) getSessionFactory().getCurrentSession().createQuery("select count(id) from Buildings" + pager.getParamStr()).uniqueResult();
        return result;
    }

    @Override
    public List<Buildings> queryByName(String likeName) {
        String sql = "select * from t_buildings where status=1 and name like ?";
        Query query = getSessionFactory().getCurrentSession().createNativeQuery(sql);
        query.setParameter(1,"%"+likeName+"%");
        List<Buildings> buildingsList = query.list();
        return buildingsList;
    }

    @Override
    public Pager<Buildings> queryByLikeName(Pager<Buildings> pager) {
        Query query = getSessionFactory().getCurrentSession().createNativeQuery("select * from t_buildings"+pager.getParamStr());
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setResult(query.list());
        return pager;
    }

}
