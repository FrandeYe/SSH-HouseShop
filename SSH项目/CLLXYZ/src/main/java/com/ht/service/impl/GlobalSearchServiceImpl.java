package com.ht.service.impl;

import com.ht.common.Pager;
import com.ht.dao.GlobalSearchDAO;
import com.ht.service.GlobalSearchService;
import com.ht.vo.GlobalSearchVO;

import java.util.List;

public class GlobalSearchServiceImpl implements GlobalSearchService {

    private GlobalSearchDAO globalSearchDAO;

    @Override
    public List<GlobalSearchVO> globalSearchName(String name, int page, int pageSize) {
        return globalSearchDAO.globalSearchName(name, page, pageSize);
    }

    @Override
    public void save(GlobalSearchVO globalSearchVO) {

    }

    @Override
    public void remove(GlobalSearchVO globalSearchVO) {

    }

    @Override
    public void update(GlobalSearchVO globalSearchVO) {

    }

    @Override
    public void updateStatus(String id, short status) {

    }

    @Override
    public GlobalSearchVO foundById(String id) {
        return null;
    }

    @Override
    public Pager<GlobalSearchVO> listPager(Pager<GlobalSearchVO> pager) {
        return null;
    }

    @Override
    public List<GlobalSearchVO> listAll() {
        return null;
    }

    @Override
    public Long count(Pager pager) {
        return globalSearchDAO.count(pager);
    }

    public void setGlobalSearchDAO(GlobalSearchDAO globalSearchDAO) {
        this.globalSearchDAO = globalSearchDAO;
    }
}
