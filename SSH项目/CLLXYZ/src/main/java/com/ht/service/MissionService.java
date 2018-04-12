package com.ht.service;

import com.ht.bean.Mission;
import com.ht.common.Pager;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public interface MissionService extends BaseService<String,Mission> {

    void updatePercent(Mission mission);

    Pager<Mission> employeeListPager(String emp_id, Pager<Mission> pager);

    void save(List<Mission> rows);

    void updateQuantityPercent(String id,int quantity,double bonus_percent );


    void updateBonusPercent(int quantity,double bonus_percent,String monthes,String agencyId);
}
