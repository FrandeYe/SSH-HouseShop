package com.ht.service;

import com.ht.bean.History;

/**
 * Created by ccf on 2017/8/24.
 */
public interface HistoryService extends BaseService<String,History> {

    History foundHistoryUser(String userId, String buildingsId);
}
