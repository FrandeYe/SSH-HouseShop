package com.ht.dao.impl;

import com.ht.bean.Activity;
import com.ht.bean.Building;
import com.ht.common.HibernateSessionFactoryBean;
import com.ht.common.Pager;
import com.ht.dao.ActivityDAO;
import com.ht.dao.BaseDAO;
import org.hibernate.query.Query;

import java.util.List;

/**
 * Created by ccf on 2017/8/23.
 */
public class ActivityDAOImpl extends HibernateSessionFactoryBean implements ActivityDAO {

    @Override
    public void save(Activity activity) {
        getSessionFactory().getCurrentSession().save(activity);
    }

    @Override
    public void remove(Activity activity) {
        getSessionFactory().getCurrentSession().remove(activity);
    }

    @Override
    public void update(Activity activity) {
        getSessionFactory().getCurrentSession().update(activity);
    }

    @Override
    public void updateStatus(String id, short status) {
        Query query = getSessionFactory().getCurrentSession().createQuery(" update Activity set status=:status where id=:id");
        query.setParameter("status",status);
        query.setParameter("id",id);
        query.executeUpdate();
    }

    @Override
    public Activity foundById(String id) {
        String sql = "from Activity where id=:id";
        Query query = getSessionFactory().getCurrentSession().createQuery(sql);
        query.setParameter("id",id);
        Activity activity = (Activity) query.uniqueResult();
        return activity;
    }

    @Override
    public Pager<Activity> listPager(Pager<Activity> pager) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from Activity" + pager.getParamStr());
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setResult(query.list());
        return pager;
    }

    @Override
    public List<Activity> listAll() {
        return null;
    }

    @Override
    public Long count(Pager pager) {
        Long result = (Long) getSessionFactory().getCurrentSession().createQuery("select count(id) from Activity" + pager.getParamStr()).uniqueResult();
        return result;
    }

    @Override
    public Pager<Activity> listPlatformPager(Pager<Activity> pager) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from Activity where agency_id is null and buildings_id is null" );
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setResult(query.list());
        return pager;
    }
}
