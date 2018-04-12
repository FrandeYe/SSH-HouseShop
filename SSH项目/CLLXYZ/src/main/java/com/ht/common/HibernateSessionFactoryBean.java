package com.ht.common;

import org.hibernate.SessionFactory;

/**
 * Created by mh on 2017/7/31
 */
public class HibernateSessionFactoryBean {

    private static SessionFactory sessionFactory;

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public static void setSessionFactory(SessionFactory sessionFactory) {
        HibernateSessionFactoryBean.sessionFactory = sessionFactory;
    }
}
