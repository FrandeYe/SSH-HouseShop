package com.ht.dao;

import com.ht.bean.Like;

/**
 * Created by ccf on 2017/8/24.
 */
public interface LikeDAO extends BaseDAO<String,Like> {

    Like foundLikeUser(String buildingsId, String userId);
}
