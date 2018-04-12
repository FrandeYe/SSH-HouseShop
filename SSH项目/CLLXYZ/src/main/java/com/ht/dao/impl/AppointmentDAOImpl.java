package com.ht.dao.impl;

import com.ht.bean.Appointment;
import com.ht.common.HibernateSessionFactoryBean;
import com.ht.common.Pager;
import com.ht.dao.AppointmentDAO;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.Date;
import java.util.List;

/**
 * Created by ccf on 2017/8/23.
 */
public class AppointmentDAOImpl extends HibernateSessionFactoryBean implements AppointmentDAO {
    @Override
    public void save(Appointment appointment) {
        getSessionFactory().getCurrentSession().save(appointment);
    }

    @Override
    public void remove(Appointment appointment) {
        getSessionFactory().getCurrentSession().remove(appointment);
    }

    @Override
    public void update(Appointment appointment) {
        getSessionFactory().getCurrentSession(). update(appointment);
    }

    @Override
    public void updateStatus(String id, short status) {
		Query query = getSessionFactory().getCurrentSession().createQuery("update Appointment set status=:status where id=:id");
        query.setParameter("status",status);
        query.setParameter("id",id);
        query.executeUpdate();
    }

    @Override
    public Appointment foundById(String id) {
        return null;
    }

    @Override
    public Pager<Appointment> listPager(Pager<Appointment> pager) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from Appointment" + pager.getParamStr());
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setResult(query.list());
        return pager;
    }

    @Override
    public List<Appointment> listAll() {
        return null;
    }

    @Override
    public Long count(Pager pager) {
        Long resultL = (Long) getSessionFactory().getCurrentSession().createQuery("select count(id) from Appointment" + pager.getParamStr()).uniqueResult();
        return resultL;
    }

    @Override
    public Pager<Appointment> listPager(String emp_id, Pager<Appointment> pager) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from Appointment where emp_id=:emp_id order by created_time desc");
        query.setParameter("emp_id",emp_id);
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setResult(query.list());
        return pager;
    }

    @Override
    public void updateAppStatus(String id, Appointment appointment) {
        String sql = "update Appointment set app_status=:app_status where id=:id ";
        Query query = getSessionFactory().getCurrentSession().createQuery(sql);
        query.setParameter("app_status",appointment.getApp_status());
        query.setParameter("id",id);
        query.executeUpdate();
    }

	@Override
    public void updateAppointment(String id, Date app_arrive_time, Date arrive_time) {
        Query query = getSessionFactory().getCurrentSession().createQuery("update Appointment set app_arrive_time=:app_arrive_time, arrive_time=:arrive_time where id=:id");
        query.setParameter("app_arrive_time",app_arrive_time);
        query.setParameter("arrive_time",arrive_time);
        query.setParameter("id",id);
        query.executeUpdate();
    }
}
