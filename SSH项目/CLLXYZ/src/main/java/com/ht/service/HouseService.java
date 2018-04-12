package com.ht.service;

import com.ht.bean.House;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public interface HouseService extends BaseService<String,House> {
    List<House> foundHouses(String agency_id);
}
