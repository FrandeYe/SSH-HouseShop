package com.ht.dao;

import com.ht.bean.BuildingsImg;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public interface BuildingsImgDAO extends BaseDAO<String,BuildingsImg> {
    List<BuildingsImg> queryImgByBuildingsId(String id);
}
