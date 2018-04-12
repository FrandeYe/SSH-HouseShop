package com.ht.service;

import com.ht.bean.BuildingsImg;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public interface BuildingsImgService extends BaseService<String,BuildingsImg> {
    List<BuildingsImg> queryImgByBuildingsId(String id);
}
