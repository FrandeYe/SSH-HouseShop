package com.ht.dao;

import com.ht.bean.Appointment;
import com.ht.common.HibernateSessionFactoryBean;
import com.ht.common.Pager;

import java.util.Date;

/**
 * Created by ccf on 2017/8/23.
 */
public interface AppointmentDAO extends BaseDAO<String,Appointment>  {
    /**
     * 员工查看属于自己的预约
     */
    Pager<Appointment> listPager(String emp_id,Pager<Appointment> pager);

    /**
     * 修改购房预约状态
     */
    void updateAppStatus(String id,Appointment appointment);

	void updateAppointment(String id, Date app_arrive_time, Date arrive_time);
}
