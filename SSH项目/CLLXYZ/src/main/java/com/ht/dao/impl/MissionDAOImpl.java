package com.ht.dao.impl;

import com.ht.bean.Mission;
import com.ht.common.HibernateSessionFactoryBean;
import com.ht.common.Pager;
import com.ht.dao.MissionDAO;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class MissionDAOImpl extends HibernateSessionFactoryBean implements MissionDAO {
    @Override
    public void save(Mission mission) {
        getSessionFactory().getCurrentSession().save(mission);
    }

    @Override
    public void remove(Mission mission) {
        getSessionFactory().getCurrentSession().remove(mission);
    }

    @Override
    public void update(Mission mission) {
        getSessionFactory().getCurrentSession().update(mission);
    }

    @Override
    public void updateStatus(String id, short status) {

    }

    @Override
    public Mission foundById(String id) {
        return null;
    }

    @Override
    public Pager<Mission> listPager(Pager<Mission> pager) {
        String sql = "from Mission" + pager.getParamStr();
        Query query = getSessionFactory().getCurrentSession().createQuery(sql);
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setResult(query.list());
        return pager;
    }

    @Override
    public List<Mission> listAll() {
        return null;
    }

    @Override
    public Long count(Pager pager) {
        Long resultL = (Long) getSessionFactory().getCurrentSession().createQuery("select count(id) from Mission" + pager.getParamStr()).uniqueResult();
        int result = resultL.intValue();
        return resultL;
    }

    @Override
    public void updatePercent(Mission mission) {
        String sql = "update Mission set bonus_percent=:bonus_percent";
        Query query = getSessionFactory().getCurrentSession().createQuery(sql);
        query.setParameter("bonus_percent",mission.getBonus_percent());
        query.executeUpdate();
    }

    @Override
    public Pager<Mission> employeeListPager(String emp_id, Pager<Mission> pager) {
        String sql = "from Mission where emp_id=:emp_id";
        Query query = getSessionFactory().getCurrentSession().createQuery(sql);
        query.setParameter("emp_id",emp_id);
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setResult(query.list());
        return pager;
    }

    @Override
    public void save(List<Mission> rows) {
        Session session = getSessionFactory().getCurrentSession();
        for (int i = 0, size = rows.size(); i < size; i++) {
            session.save(rows.get(i));
            if (i % 20 == 0) {
                session.flush();
                session.clear();
            }
        }
    }

    @Override
    public void updateQuantityPercent(String id, int quantity, double bonus_percent) {
        Query query = getSessionFactory().getCurrentSession().createQuery("update Mission set quantity=:quantity , bonus_percent=:bonus_percent where id=:id");
        query.setParameter("id",id);
        query.setParameter("quantity",quantity);
        query.setParameter("bonus_percent",bonus_percent);
        query.executeUpdate();
    }

    @Override
    public void updateBonusPercent(int quantity,double bonus_percent,String monthes,String agencyId) {
        Query query = getSessionFactory().getCurrentSession().createQuery("update Mission set quantity=:quantity ,bonus_percent=:bonus_percent where monthes=:monthes and agency_id=:agency_id");
        query.setParameter("quantity",quantity);
        query.setParameter("bonus_percent",bonus_percent);
        query.setParameter("monthes",monthes);
        query.setParameter("agency_id",agencyId);
        query.executeUpdate();
    }

}