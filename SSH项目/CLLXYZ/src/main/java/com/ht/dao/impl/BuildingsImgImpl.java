package com.ht.dao.impl;

import com.ht.bean.BuildingsImg;
import com.ht.common.HibernateSessionFactoryBean;
import com.ht.common.Pager;
import com.ht.dao.BuildingsImgDAO;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class BuildingsImgImpl extends HibernateSessionFactoryBean implements BuildingsImgDAO{
    @Override
    public void save(BuildingsImg buildingsImg) {
        getSessionFactory().getCurrentSession().save(buildingsImg);
    }

    @Override
    public void remove(BuildingsImg buildingsImg) {
        getSessionFactory().getCurrentSession().remove(buildingsImg);
    }

    @Override
    public void update(BuildingsImg buildingsImg) {
        getSessionFactory().getCurrentSession().update(buildingsImg);
    }

    @Override
    public void updateStatus(String id, short status) {
        Query query = getSessionFactory().getCurrentSession().createQuery(" update BuildingsImg set status=:status where id=:id");
        query.setParameter("status",status);
        query.setParameter("id",id);
        query.executeUpdate();
    }

    @Override
    public BuildingsImg foundById(String id) {
        return null;
    }

    @Override
    public Pager<BuildingsImg> listPager(Pager<BuildingsImg> pager) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from BuildingsImg"+ pager.getParamStr());
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setResult(query.list());
        return pager;
    }

    @Override
    public List<BuildingsImg> listAll() {
        return null;
    }

    @Override
    public Long count(Pager pager) {
        Long result = (Long) getSessionFactory().getCurrentSession().createQuery("select count(id) from BuildingsImg" + pager.getParamStr()).uniqueResult();
        return result;
    }

    @Override
    public List<BuildingsImg> queryImgByBuildingsId(String id) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from BuildingsImg where buildings_id=:buildings_id");
        query.setParameter("buildings_id",id);
        List<BuildingsImg> buildingsImgs = query.list();
        System.out.println(buildingsImgs);
        return buildingsImgs;
    }
}
