package com.ht.service.impl;

import com.ht.bean.Appointment;
import com.ht.common.Pager;
import com.ht.dao.AppointmentDAO;
import com.ht.service.AppointmentService;

import java.util.Date;
import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class AppointmentServiceImpl implements AppointmentService{
    private AppointmentDAO appointmentDAO;
    @Override
    public void save(Appointment appointment) {
        appointmentDAO.save(appointment);
    }

    @Override
    public void remove(Appointment appointment) {
        appointmentDAO.remove(appointment);
    }

    @Override
    public void update(Appointment appointment) {
        appointmentDAO.update(appointment);
    }

    @Override
    public void updateStatus(String id, short status) {
        appointmentDAO.updateStatus(id, status);
    }

    @Override
    public Appointment foundById(String id) {
        return null;
    }

    @Override
    public Pager<Appointment> listPager(Pager<Appointment> pager) {
        return appointmentDAO.listPager(pager);
    }

    @Override
    public List<Appointment> listAll() {
        return appointmentDAO.listAll();
    }

    @Override
    public Long count(Pager pager){
        return appointmentDAO.count(pager);
    }

    public AppointmentDAO getAppointmentDAO() {
        return appointmentDAO;
    }

    public void setAppointmentDAO(AppointmentDAO appointmentDAO) {
        this.appointmentDAO = appointmentDAO;
    }

    @Override
    public Pager<Appointment> listPager(String emp_id, Pager<Appointment> pager) {
        return appointmentDAO.listPager(emp_id,pager);
    }

    @Override
    public void updateAppStatus(String id, Appointment appointment) {
        appointmentDAO.updateAppStatus(id,appointment);
    }

	@Override
    public void updateAppointment(String id, Date app_arrive_time, Date arrive_time) {
        appointmentDAO.updateAppointment(id,app_arrive_time,arrive_time);
    }
}
