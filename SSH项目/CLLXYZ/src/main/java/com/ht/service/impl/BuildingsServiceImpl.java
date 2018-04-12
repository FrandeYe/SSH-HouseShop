package com.ht.service.impl;

import com.ht.bean.Buildings;
import com.ht.common.Pager;
import com.ht.dao.BuildingsDAO;
import com.ht.service.BuildingsService;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class BuildingsServiceImpl implements BuildingsService {
    private BuildingsDAO buildingsDAO;
    @Override
    public void save(Buildings buildings) {
        buildingsDAO.save(buildings);
    }

    @Override
    public void remove(Buildings buildings) {
        buildingsDAO.remove(buildings);
    }

    @Override
    public void update(Buildings buildings) {
        buildingsDAO.update(buildings);
    }

    @Override
    public void updateStatus(String id, short status) {
        buildingsDAO.updateStatus(id, status);
    }

    @Override
    public Buildings foundById(String id) {
        return buildingsDAO.foundById(id);
    }

    @Override
    public Pager<Buildings> listPager(Pager<Buildings> pager) {
        return buildingsDAO.listPager(pager);
    }

    @Override
    public List<Buildings> listAll() {
        return buildingsDAO.listAll();
    }

    public BuildingsDAO getBuildingsDAO() {

        return buildingsDAO;
    }

    public void setBuildingsDAO(BuildingsDAO buildingsDAO) {
        this.buildingsDAO = buildingsDAO;
    }

    @Override
    public Long count(Pager pager){
        return buildingsDAO.count(pager);
    }

    @Override
    public List<Buildings> queryByName(String likeName) {
        return buildingsDAO.queryByName(likeName);
    }

    @Override
    public Pager<Buildings> queryByLikeName(Pager<Buildings> pager) {
        return buildingsDAO.queryByLikeName(pager);
    }

}
