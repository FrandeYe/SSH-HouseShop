package com.ht.service.impl;

import com.ht.bean.Building;
import com.ht.common.Pager;
import com.ht.dao.BuildingDAO;
import com.ht.service.BuildingService;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class BuildingServiceImpl implements BuildingService {
    private BuildingDAO buildingDAO;
    @Override
    public void save(Building building) {
        buildingDAO.save(building);
    }

    @Override
    public void remove(Building building) {
        buildingDAO.remove(building);
    }

    @Override
    public void update(Building building) {
        buildingDAO.update(building);
    }

    @Override
    public void updateStatus(String id, short status) {
        buildingDAO.updateStatus(id, status);
    }

    @Override
    public Building foundById(String id) {
        return buildingDAO.foundById(id);
    }

    @Override
    public Pager<Building> listPager(Pager<Building> pager) {
        return buildingDAO.listPager(pager);
    }

    @Override
    public List<Building> listAll() {
        return buildingDAO.listAll();
    }

    @Override
    public Long count(Pager pager){
        return buildingDAO.count(pager);
    }

    public BuildingDAO getBuildingDAO() {
        return buildingDAO;
    }

    public void setBuildingDAO(BuildingDAO buildingDAO) {
        this.buildingDAO = buildingDAO;
    }
}
