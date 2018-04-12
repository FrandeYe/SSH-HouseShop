package com.ht.service.impl;

import com.ht.bean.History;
import com.ht.common.Pager;
import com.ht.dao.HistoryDAO;
import com.ht.service.HistoryService;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class HistoryServiceImpl implements HistoryService {
    private HistoryDAO historyDAO;
    @Override
    public void save(History history) {
        historyDAO.save(history);
    }

    @Override
    public void remove(History history) {
        historyDAO.remove(history);
    }

    @Override
    public void update(History history) {
        historyDAO.update(history);
    }

    @Override
    public void updateStatus(String id, short status) {
        historyDAO.updateStatus(id, status);
    }

    @Override
    public History foundById(String id) {
        return historyDAO.foundById(id);
    }

    @Override
    public Pager<History> listPager(Pager<History> pager) {
        return historyDAO.listPager(pager);
    }

    @Override
    public List<History> listAll() {
        return historyDAO.listAll();
    }

    @Override
    public Long count(Pager pager){
        return historyDAO.count(pager);
    }

    public HistoryDAO getHistoryDAO() {
        return historyDAO;
    }

    public void setHistoryDAO(HistoryDAO historyDAO) {
        this.historyDAO = historyDAO;
    }

    @Override
    public History foundHistoryUser(String userId, String buildingsId) {
        return historyDAO.foundHistoryUser(userId, buildingsId);
    }
}
