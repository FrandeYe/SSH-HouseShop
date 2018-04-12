package com.ht.dao;

import com.ht.bean.Message;

import java.util.Date;

/**
 * Created by ccf on 2017/8/24.
 */
public interface MessageDAO extends BaseDAO<String,Message> {
    void updateMessage(String id,String content);
    void updateMessageAgency(String id, String reply, Date replyTime);
}
