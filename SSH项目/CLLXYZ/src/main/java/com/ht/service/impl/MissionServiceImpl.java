package com.ht.service.impl;

import com.ht.bean.Mission;
import com.ht.common.Pager;
import com.ht.dao.MissionDAO;
import com.ht.service.MissionService;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class MissionServiceImpl implements MissionService {
    private MissionDAO missionDAO;

    public void setMissionDAO(MissionDAO missionDAO) {
        this.missionDAO = missionDAO;
    }

    @Override
    public void save(Mission mission) {
        missionDAO.save(mission);
    }

    @Override
    public void remove(Mission mission) {
        missionDAO.remove(mission);
    }

    @Override
    public void update(Mission mission) {
        missionDAO.update(mission);
    }

    @Override
    public void updateStatus(String id, short status) {
        missionDAO.updateStatus(id,status);
    }

    @Override
    public Mission foundById(String id) {
        return missionDAO.foundById(id);
    }

    @Override
    public Pager<Mission> listPager(Pager<Mission> pager) {
        return missionDAO.listPager(pager);
    }

    @Override
    public List<Mission> listAll() {
        return missionDAO.listAll();
    }

    @Override
    public Long count(Pager pager){
        return missionDAO.count(pager);
    }

    @Override
    public void updatePercent(Mission mission) {
        missionDAO.updatePercent(mission);
    }

    @Override
    public Pager<Mission> employeeListPager(String emp_id, Pager<Mission> pager) {
        return missionDAO.employeeListPager(emp_id,pager);
    }

    @Override
    public void save(List<Mission> rows) {
        missionDAO.save(rows);
    }

    @Override
    public void updateQuantityPercent(String id, int quantity, double bonus_percent) {
        missionDAO.updateQuantityPercent(id,quantity,bonus_percent);
    }

    @Override
    public void updateBonusPercent(int quantity,double bonus_percent,String monthes,String agencyId) {
        missionDAO.updateBonusPercent(quantity,bonus_percent,monthes,agencyId);
    }
}
