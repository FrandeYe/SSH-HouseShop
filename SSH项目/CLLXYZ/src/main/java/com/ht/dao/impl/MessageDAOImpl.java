package com.ht.dao.impl;

import com.ht.bean.Message;
import com.ht.common.HibernateSessionFactoryBean;
import com.ht.common.Pager;
import com.ht.dao.MessageDAO;
import org.hibernate.query.Query;

import java.util.Date;
import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class MessageDAOImpl extends HibernateSessionFactoryBean implements MessageDAO {
    @Override
    public void save(Message message) {
        getSessionFactory().getCurrentSession().save(message);
    }

    @Override
    public void remove(Message message) {
        getSessionFactory().getCurrentSession().remove(message);
    }

    @Override
    public void update(Message message) {
        getSessionFactory().getCurrentSession().update(message);
    }

    @Override
    public void updateStatus(String id, short status) {
        Query query = getSessionFactory().getCurrentSession().createQuery(" update Message set status=:status where id=:id");
        query.setParameter("status",status);
        query.setParameter("id",id);
        query.executeUpdate();
    }

    @Override
    public Message foundById(String id) {
        return null;
    }

    @Override
    public Pager<Message> listPager(Pager<Message> pager) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from Message" + pager.getParamStr());
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setResult(query.list());
        return pager;
    }

    @Override
    public List<Message> listAll() {
        return null;
    }

    @Override
    public Long count(Pager pager) {
        Long resultL = (Long) getSessionFactory().getCurrentSession().createQuery("select count(id) from Message" + pager.getParamStr()).uniqueResult();
        int result = resultL.intValue();
        return resultL;
    }

    @Override
    public void updateMessage(String id, String content) {
        Query query = getSessionFactory().getCurrentSession().createQuery("update Message set content=:content where id=:id");
        query.setParameter("content",content);
        query.setParameter("id",id);
        query.executeUpdate();
    }

    @Override
    public void updateMessageAgency(String id, String reply, Date replyTime) {
        Query query = getSessionFactory().getCurrentSession().createQuery("update Message set reply=:reply, reply_time=:replyTime where id=:id");
        query.setParameter("reply",reply);
        query.setParameter("replyTime", replyTime);
        query.setParameter("id",id);
        query.executeUpdate();
    }
}
