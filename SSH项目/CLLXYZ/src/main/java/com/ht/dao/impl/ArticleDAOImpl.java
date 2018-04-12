package com.ht.dao.impl;

import com.ht.bean.Article;
import com.ht.common.HibernateSessionFactoryBean;
import com.ht.common.Pager;
import com.ht.dao.ArticleDAO;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class ArticleDAOImpl extends HibernateSessionFactoryBean implements ArticleDAO {
    @Override
    public void save(Article article) {
        getSessionFactory().getCurrentSession().save(article);
    }

    @Override
    public void remove(Article article) {
        getSessionFactory().getCurrentSession().remove(article);
    }

    @Override
    public void update(Article article) {
        getSessionFactory().getCurrentSession().update(article);
    }

    @Override
    public void updateStatus(String id, short status) {
        Query query = getSessionFactory().getCurrentSession().createQuery("update Article set status=:status where id=:id");
        query.setParameter("status",status);
        query.setParameter("id",id);
        query.executeUpdate();
    }

    @Override
    public Article foundById(String id) {
        String sql = "from Article where id=:id";
        Query query = getSessionFactory().getCurrentSession().createQuery(sql);
        query.setParameter("id",id);
        Article article = (Article) query.uniqueResult();
        return article;
    }

    @Override
    public Pager<Article> listPager(Pager<Article> pager) {
        Session session = getSessionFactory().openSession();
        Query query = session.createQuery("from Article" + pager.getParamStr());
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setResult(query.list());
        return pager;
    }

    @Override
    public List<Article> listAll() {
        return null;
    }

    @Override
    public Long count(Pager pager) {
        Long resultLong = (Long) getSessionFactory().getCurrentSession().createQuery("select  count(id) from Article" + pager.getParamStr()).uniqueResult();
        return resultLong;
    }
}
