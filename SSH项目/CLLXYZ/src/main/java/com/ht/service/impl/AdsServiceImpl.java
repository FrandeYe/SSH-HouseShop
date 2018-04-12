package com.ht.service.impl;

import com.ht.bean.Ads;
import com.ht.common.Pager;
import com.ht.dao.AdsDAO;
import com.ht.service.AdsService;

import java.util.List;

/**
 * Created by ccf on 2017/8/23.
 */
public class AdsServiceImpl implements AdsService{
    private AdsDAO adsDAO;
    @Override
    public void save(Ads ads) {
        adsDAO.save(ads);
    }

    @Override
    public void remove(Ads ads) {
        adsDAO.remove(ads);
    }

    @Override
    public void update(Ads ads) {
        adsDAO.update(ads);
    }

    @Override
    public void updateStatus(String id, short status) {
        adsDAO.updateStatus(id, status);
    }

    @Override
    public Ads foundById(String id) {
        return adsDAO.foundById(id);
    }

    @Override
    public Pager<Ads> listPager(Pager<Ads> pager) {
        return adsDAO.listPager(pager);
    }

    @Override
    public List<Ads> listAll() {
        return adsDAO.listAll();
    }

    @Override
    public Long count(Pager pager){
        return adsDAO.count(pager);
    }

    public AdsDAO getAdsDAO() {
        return adsDAO;
    }

    public void setAdsDAO(AdsDAO adsDAO) {
        this.adsDAO = adsDAO;
    }

    @Override
    public Ads show_order(Integer show_order) {
        return adsDAO.show_order(show_order);
    }
}
