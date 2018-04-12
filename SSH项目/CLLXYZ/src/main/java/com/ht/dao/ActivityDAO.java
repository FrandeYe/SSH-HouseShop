package com.ht.dao;

import com.ht.bean.Activity;
import com.ht.common.Pager;

/**
 * Created by ccf on 2017/8/23.
 */
public interface ActivityDAO extends BaseDAO<String, Activity>{
    Pager<Activity> listPlatformPager(Pager<Activity> pager);
}
