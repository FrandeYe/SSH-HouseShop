package com.ht.dao.impl;

import com.ht.bean.User;
import com.ht.common.EncryptUtil;
import com.ht.common.HibernateSessionFactoryBean;
import com.ht.common.Pager;
import com.ht.dao.UserDAO;
import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.HibernateTemplate;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class UserDAOImpl extends HibernateSessionFactoryBean implements UserDAO {

    @Override
    public void save(User user) {
        getSessionFactory().getCurrentSession().save(user);
    }

    @Override
    public void remove(User user) {
        getSessionFactory().getCurrentSession().remove(user);
    }

    @Override
    public void update(User user) {
        getSessionFactory().getCurrentSession().update(user);
    }

    /**
     * 用户的激活与冻结
     * @param id
     * @param status
     */
    @Override
    public void updateStatus(String id, short status) {
        Query query = getSessionFactory().getCurrentSession().createQuery(" update User set status=:status where id=:id");
        query.setParameter("status",status);
        query.setParameter("id",id);
        query.executeUpdate();
    }

    @Override
    public User foundById(String id) {
        return getSessionFactory().getCurrentSession().get(User.class,id) ;
    }

    /**
     * 查询所有用户并进行分页操作
     * @param pager
     * @return
     */
    @Override
    public Pager<User> listPager(Pager<User> pager) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from User" + pager.getParamStr());
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setResult(query.list());
        return pager;
    }

    @Override
    public List<User> listAll() {
        return null;
    }

    /**
     * 查询所有用户的总个数
     * @return
     */
    @Override
    public Long count(Pager pager) {
        Long resultL = (Long) getSessionFactory().getCurrentSession().createQuery("select count(id) from User" + pager.getParamStr()).uniqueResult();
        return resultL;
    }

    @Override
    public User findByPhone(String phone) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from User where phone=:phone");
        query.setParameter("phone", phone);
        return (User) query.uniqueResult();
    }

    @Override
    public User findByEmail(String email) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from User where email=:email");
        query.setParameter("email",email);
        return (User) query.uniqueResult();
    }

    /**
     * 用户登录的方法
     * @param phone
     * @param pwd
     * @return
     */
    @Override
    public User loginUser(String phone, String pwd) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from User where phone=:phone and pwd=:pwd and status=1");
        query.setParameter("phone", phone);
        query.setParameter("pwd", pwd);
        User user = (User)query.uniqueResult();
        return user;
    }
}
