package com.ht.dao;

import com.ht.bean.History;
import com.ht.dao.BaseDAO;

/**
 * Created by ccf on 2017/8/24.
 */
public interface HistoryDAO extends BaseDAO<String,History> {

    History foundHistoryUser(String userId, String buildingsId);
}
