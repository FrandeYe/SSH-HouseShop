package com.ht.service.impl;

import com.ht.bean.Activity;
import com.ht.common.Pager;
import com.ht.dao.ActivityDAO;
import com.ht.dao.impl.ActivityDAOImpl;
import com.ht.service.ActivityService;

import java.util.List;

/**
 * Created by ccf on 2017/8/23.
 */
public class ActivityServiceImpl implements ActivityService {
     private ActivityDAO activityDAO;
    @Override
    public void save(Activity activity) {
        activityDAO.save(activity);
    }

    @Override
    public void remove(Activity activity) {
        activityDAO.remove(activity);
    }

    @Override
    public void update(Activity activity) {
        activityDAO.update(activity);
    }

    @Override
    public void updateStatus(String id, short status) {
        activityDAO.updateStatus(id, status);
    }

    @Override
    public Activity foundById(String id) {
        return activityDAO.foundById(id);
    }

    @Override
    public Pager<Activity> listPager(Pager<Activity> pager) {
        return activityDAO.listPager(pager);
    }

    @Override
    public List<Activity> listAll() {
        return activityDAO.listAll();
    }

    @Override
    public Long count(Pager pager){
        return activityDAO.count(pager);
    }

    public ActivityDAO getActivityDAO() {
        return activityDAO;
    }

    public void setActivityDAO(ActivityDAO activityDAO) {
        this.activityDAO = activityDAO;
    }

    @Override
    public Pager<Activity> listPlatformPager(Pager<Activity> pager) {
        return activityDAO.listPlatformPager(pager);
    }
}
