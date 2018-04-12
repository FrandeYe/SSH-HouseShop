package com.ht.service;

import com.ht.bean.Buildings;
import com.ht.common.Pager;
import com.ht.dao.BuildingsDAO;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public interface BuildingsService extends BaseService<String,Buildings> {

    /**
     * 根据名称模糊搜索楼盘
     */
    List<Buildings> queryByName(String likeName);

    Pager<Buildings> queryByLikeName(Pager<Buildings> pager);

}
