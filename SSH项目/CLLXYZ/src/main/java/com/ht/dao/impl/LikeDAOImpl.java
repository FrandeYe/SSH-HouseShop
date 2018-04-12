package com.ht.dao.impl;

import com.ht.bean.Like;
import com.ht.common.HibernateSessionFactoryBean;
import com.ht.common.Pager;
import com.ht.dao.LikeDAO;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class LikeDAOImpl extends HibernateSessionFactoryBean implements LikeDAO {
    @Override
    public void save(Like like) {
        getSessionFactory().getCurrentSession().save(like);
    }

    @Override
    public void remove(Like like) {
        getSessionFactory().getCurrentSession().remove(like);
    }

    @Override
    public void update(Like like) {
        getSessionFactory().getCurrentSession().update(like);
    }

    @Override
    public void updateStatus(String id, short status) {

    }

    @Override
    public Like foundById(String id) {
        return null;
    }

    @Override
    public Pager<Like> listPager(Pager<Like> pager) {
        Session session = getSessionFactory().openSession();
        Query query = session.createQuery(" from Like" + pager.getParamStr());
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setResult(query.list());
        return pager;
    }

    @Override
    public List<Like> listAll() {
        return null;
    }

    @Override
    public Long count(Pager pager) {
        Long conts =(long) getSessionFactory().getCurrentSession().createQuery("select count(id) from Like" + pager.getParamStr()).uniqueResult();
        return conts;
    }

    @Override
    public Like foundLikeUser(String buildingsId, String userId) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from Like where buildings_id=:buildingsId and user_id=:userId");
        query.setParameter("buildingsId", buildingsId);
        query.setParameter("userId", userId);
         return (Like) query.uniqueResult();
    }
}
