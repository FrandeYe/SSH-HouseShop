package com.ht.service;

import com.ht.bean.Ads;

/**
 * Created by ccf on 2017/8/23.
 */
public interface AdsService extends BaseService<String,Ads> {
    Ads  show_order(Integer show_order);
}
