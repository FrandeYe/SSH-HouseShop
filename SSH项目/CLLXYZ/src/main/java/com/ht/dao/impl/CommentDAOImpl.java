package com.ht.dao.impl;

import com.ht.bean.Comment;
import com.ht.common.HibernateSessionFactoryBean;
import com.ht.common.Pager;
import com.ht.dao.CommentDAO;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class CommentDAOImpl extends HibernateSessionFactoryBean implements CommentDAO {
    @Override
    public void save(Comment comment) {
        getSessionFactory().getCurrentSession().save(comment);
    }

    @Override
    public void remove(Comment comment) {
        getSessionFactory().getCurrentSession().remove(comment);
    }

    @Override
    public void update(Comment comment) {
        getSessionFactory().getCurrentSession().update(comment);
    }

    @Override
    public void updateStatus(String id, short status) {
        String sql = "update Comment set status=:status where id =:id";
        Query query = getSessionFactory().getCurrentSession().createQuery(sql);
        query.setParameter("status",status);
        query.setParameter("id",id);
        query.executeUpdate();
    }

    @Override
    public Comment foundById(String id) {
        return getSessionFactory().getCurrentSession().get(Comment.class,id);
    }

    @Override
    public Pager<Comment> listPager(Pager<Comment> pager) {
        Session session = getSessionFactory().openSession();
        Query query = session.createQuery(" from Comment" + pager.getParamStr());
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setResult(query.list());
        return pager;
    }

    @Override
    public List<Comment> listAll() {
        return null;
    }

    @Override
    public Long count(Pager pager) {
        Long conts =(long) getSessionFactory().getCurrentSession().createQuery("select count(id) from Comment" + pager.getParamStr()).uniqueResult();
        return conts;
    }

    @Override
    public void updateComment(String id, String content) {
        Query query = getSessionFactory().getCurrentSession().createQuery("update Comment set content=:content where id=:id");
        query.setParameter("content",content);
        query.setParameter("id",id);
        query.executeUpdate();
    }
}
