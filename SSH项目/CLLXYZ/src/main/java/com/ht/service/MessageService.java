package com.ht.service;

import com.ht.bean.Message;

import java.util.Date;

/**
 * Created by ccf on 2017/8/24.
 */
public interface MessageService extends BaseService<String,Message> {
    void updateMessage(String id, String content);
    void updateMessageAgency(String id, String reply, Date replyTime);
}
