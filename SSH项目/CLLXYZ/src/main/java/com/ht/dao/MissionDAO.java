package com.ht.dao;

import com.ht.bean.Mission;
import com.ht.common.Pager;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public interface MissionDAO extends BaseDAO<String,Mission> {

    //给所有员工设置提成百分比
    void updatePercent(Mission mission);

    //指定查询某个员工的绩效

    Pager<Mission> employeeListPager(String emp_id,Pager<Mission> pager);

    void save(List<Mission> rows);

    void updateQuantityPercent(String id,int quantity,double bonus_percent );

    void updateBonusPercent(int quantity,double bonus_percent,String monthes,String agencyId);
}