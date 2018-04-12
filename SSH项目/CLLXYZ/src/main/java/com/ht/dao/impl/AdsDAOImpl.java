package com.ht.dao.impl;

import com.ht.bean.Ads;
import com.ht.common.HibernateSessionFactoryBean;
import com.ht.common.Pager;
import com.ht.dao.AdsDAO;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by ccf on 2017/8/23.
 */
public class AdsDAOImpl extends HibernateSessionFactoryBean implements AdsDAO {
    @Override
    public void save(Ads ads) {
        getSessionFactory().getCurrentSession().save(ads);
    }

    @Override
    public void remove(Ads ads) {
        getSessionFactory().getCurrentSession().remove(ads);
    }

    @Override
    public void update(Ads ads) {
        getSessionFactory().getCurrentSession().update(ads);
    }

    @Override
    public void updateStatus(String id, short status) {
        String sql = "update Ads set status=:status where id=:id";
        Query query = getSessionFactory().getCurrentSession().createQuery(sql);
        query.setParameter("status", status);
        query.setParameter("id", id);
        query.executeUpdate();
    }

    @Override
    public Ads foundById(String id) {
        return null;
    }

    @Override
    public Pager<Ads> listPager(Pager<Ads> pager) {
        String sql = "from Ads" + pager.getParamStr();
        Query query = getSessionFactory().getCurrentSession().createQuery(sql);
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setResult(query.list());
        return pager;
    }

    @Override
    public List<Ads> listAll() {
        String sql = "from Ads";
        Query query = getSessionFactory().getCurrentSession().createQuery(sql);
        List<Ads> adsList = new ArrayList<>();
        adsList = query.list();
        return adsList;
    }

    @Override
    public Long count(Pager pager) {
        Long result = (Long) getSessionFactory().getCurrentSession().createQuery("select count(id) from Ads" + pager.getParamStr()).uniqueResult();
        return result;
    }

    @Override
    public Ads show_order(Integer show_order) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from Ads where show_order =:show_order");
        query.setParameter("show_order", show_order);
        Ads ads = (Ads) query.uniqueResult();
        return ads;
    }
}
