package com.ht.dao;

import com.ht.bean.Ads;
import com.ht.dao.BaseDAO;

import java.util.List;

/**
 * Created by ccf on 2017/8/23.
 */
public interface AdsDAO extends BaseDAO<String,Ads> {
    Ads  show_order(Integer show_order);
}
