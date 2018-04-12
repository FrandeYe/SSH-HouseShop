package com.ht.service;

import com.ht.bean.Appointment;
import com.ht.common.Pager;

import java.util.Date;

/**
 * Created by ccf on 2017/8/24.
 */
public interface AppointmentService extends BaseService<String,Appointment> {
    Pager<Appointment> listPager(String emp_id, Pager<Appointment> pager);

    void updateAppStatus(String id,Appointment appointment);

	void updateAppointment(String id, Date app_arrive_time, Date arrive_time);
}
