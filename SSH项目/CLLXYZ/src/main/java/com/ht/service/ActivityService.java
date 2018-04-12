package com.ht.service;

import com.ht.bean.Activity;
import com.ht.common.Pager;

/**
 * Created by ccf on 2017/8/23.
 */
public interface ActivityService extends BaseService<String,Activity> {
    Pager<Activity> listPlatformPager(Pager<Activity> pager);
}
