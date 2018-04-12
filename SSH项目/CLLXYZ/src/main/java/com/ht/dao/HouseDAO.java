package com.ht.dao;

import com.ht.bean.House;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public interface HouseDAO extends BaseDAO<String,House> {
    List<House> foundHouses(String agency_id);
}
