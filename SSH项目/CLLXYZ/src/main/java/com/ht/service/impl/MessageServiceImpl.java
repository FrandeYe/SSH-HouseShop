package com.ht.service.impl;

import com.ht.bean.Message;
import com.ht.common.Pager;
import com.ht.dao.MessageDAO;
import com.ht.service.MessageService;

import java.util.Date;
import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class MessageServiceImpl implements MessageService {
    private MessageDAO messageDAO;
    @Override
    public void save(Message message) {
        messageDAO.save(message);
    }

    @Override
    public void remove(Message message) {
        messageDAO.remove(message);
    }

    @Override
    public void update(Message message) {
        messageDAO.update(message);
    }

    @Override
    public void updateStatus(String id, short status) {
        messageDAO.updateStatus(id, status);
    }

    @Override
    public Message foundById(String id) {
        return messageDAO.foundById(id);
    }

    @Override
    public Pager<Message> listPager(Pager<Message> pager) {
        return messageDAO.listPager(pager);
    }

    @Override
    public List<Message> listAll() {
        return messageDAO.listAll();
    }

    @Override
    public Long count(Pager pager){
        return messageDAO.count(pager);
    }

    public MessageDAO getMessageDAO() {
        return messageDAO;
    }

    public void setMessageDAO(MessageDAO messageDAO) {
        this.messageDAO = messageDAO;
    }

    @Override
    public void updateMessage(String id, String content) {
        messageDAO.updateMessage(id,content);
    }

    @Override
    public void updateMessageAgency(String id, String reply, Date replyTime) {
        messageDAO.updateMessageAgency(id, reply, replyTime);
    }
}
