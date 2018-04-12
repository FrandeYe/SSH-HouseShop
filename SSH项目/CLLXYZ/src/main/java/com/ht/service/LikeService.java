package com.ht.service;

import com.ht.bean.Like;

/**
 * Created by ccf on 2017/8/24.
 */
public interface LikeService extends BaseService<String,Like> {

    Like foundLikeUser(String buildingsId, String userId);
}
