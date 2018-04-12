package com.ht.service.impl;

import com.ht.bean.House;
import com.ht.common.Pager;
import com.ht.dao.HouseDAO;
import com.ht.service.HouseService;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class HouseServiceImpl implements HouseService {
    private HouseDAO houseDAO;
    @Override
    public void save(House house) {
        houseDAO.save(house);
    }

    @Override
    public void remove(House house) {
        houseDAO.remove(house);
    }

    @Override
    public void update(House house) {
        houseDAO.update(house);
    }

    @Override
    public void updateStatus(String id, short status) {
        houseDAO.updateStatus(id, status);
    }

    @Override
    public House foundById(String id) {
        return  houseDAO.foundById(id);
    }

    @Override
    public Pager<House> listPager(Pager<House> pager) {
        return  houseDAO.listPager(pager);
    }

    @Override
    public List<House> listAll() {
        return  houseDAO.listAll();
    }

    @Override
    public Long count(Pager pager){
        return houseDAO.count(pager);
    }

    public HouseDAO getHouseDAO() {
        return houseDAO;
    }

    public void setHouseDAO(HouseDAO houseDAO) {
        this.houseDAO = houseDAO;
    }

    @Override
    public List<House> foundHouses(String agency_id) {
        return houseDAO.foundHouses(agency_id);
    }
}
