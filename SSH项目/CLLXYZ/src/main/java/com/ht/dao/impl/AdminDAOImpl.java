package com.ht.dao.impl;
import com.ht.bean.Admin;
import com.ht.common.GlobalSearchUtil;
import com.ht.common.HibernateSessionFactoryBean;
import com.ht.common.Pager;
import com.ht.dao.AdminDAO;
import com.ht.vo.NameIdVO;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by ccf on 2017/8/23.
 */
public class AdminDAOImpl extends HibernateSessionFactoryBean implements AdminDAO{

    @Override
    public void save(Admin admin) {
        getSessionFactory().getCurrentSession().save(admin);
    }

    @Override
    public void remove(Admin admin) {
        getSessionFactory().getCurrentSession().remove(admin);
    }

    @Override
    public void update(Admin admin) {
        getSessionFactory().getCurrentSession().update(admin);
    }

    @Override
    public void updateStatus(String id, short status) {

    }

    @Override
    public Admin foundById(String id) {
        return null;
    }

    @Override
    public Pager<Admin> listPager(Pager<Admin> pager) {
        return null;
    }

    @Override
    public List<Admin> listAll() {
        return null;
    }

    @Override
    public Long count(Pager pager) {
        return 0l;
    }


    @Override
    public Admin adminLogin(String phone, String pwd) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from Admin where phone=:phone and pwd=:pwd");
        query.setParameter("phone",phone);
        query.setParameter("pwd",pwd);
        Admin admin = (Admin) query.uniqueResult();
        return admin;
    }

    @Override
    public List<NameIdVO> globalSearchName(String name) {
        List<NameIdVO> nameIdVOS = new ArrayList<>();
        GlobalSearchUtil globalSearchUtil = new GlobalSearchUtil();
        NativeQuery nativeQuery = getSessionFactory().getCurrentSession().createNativeQuery(globalSearchUtil.getSearchSQL(name, 2, 3));
        List<Object[]> results = nativeQuery.list();
        for (Object[] objs : results) {
            NameIdVO nameIdVO = new NameIdVO();
            nameIdVO.setId((String) objs[0]);
            nameIdVO.setName((String) objs[1]);
            nameIdVO.setType((String) objs[2]);
            nameIdVOS.add(nameIdVO);
        }
        return nameIdVOS;
    }
}
