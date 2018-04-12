package com.ht.dao;

import com.ht.bean.Buildings;
import com.ht.common.Pager;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public interface BuildingsDAO extends BaseDAO<String,Buildings> {

    /**
     * 根据名称模糊搜索楼盘
     */
    List<Buildings> queryByName(String likeName);

    Pager<Buildings> queryByLikeName(Pager<Buildings> pager);
}
