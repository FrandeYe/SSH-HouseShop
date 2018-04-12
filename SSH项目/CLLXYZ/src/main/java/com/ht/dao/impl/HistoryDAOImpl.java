package com.ht.dao.impl;

import com.ht.bean.History;
import com.ht.common.HibernateSessionFactoryBean;
import com.ht.common.Pager;
import com.ht.dao.HistoryDAO;
import org.hibernate.query.Query;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class HistoryDAOImpl extends HibernateSessionFactoryBean implements HistoryDAO {
    @Override
    public void save(History history) {
        getSessionFactory().getCurrentSession().save(history);
    }

    @Override
    public void remove(History history) {
        getSessionFactory().getCurrentSession().remove(history);
    }

    @Override
    public void update(History history) {
        getSessionFactory().getCurrentSession().update(history);
    }

    @Override
    public void updateStatus(String id, short status) {

    }

    @Override
    public History foundById(String id) {
        return null;
    }

    @Override
    public Pager<History> listPager(Pager<History> pager) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from History" + pager.getParamStr());
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setResult(query.list());
        return pager;
    }

    @Override
    public List<History> listAll() {
        return null;
    }

    @Override
    public Long count(Pager pager) {
        Long resultL = (Long) getSessionFactory().getCurrentSession().createQuery("select count(id) from History" + pager.getParamStr()).uniqueResult();
        return resultL;
    }

    @Override
    public History foundHistoryUser(String userId, String buildingsId) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from History where buildings_id=:buildingsId and user_id=:userId");
        query.setParameter("buildingsId", buildingsId);
        query.setParameter("userId", userId);
        return (History) query.uniqueResult();
    }
}
