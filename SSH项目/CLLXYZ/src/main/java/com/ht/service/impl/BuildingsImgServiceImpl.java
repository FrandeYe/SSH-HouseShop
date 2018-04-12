package com.ht.service.impl;

import com.ht.bean.BuildingsImg;
import com.ht.common.Pager;
import com.ht.dao.BuildingsImgDAO;
import com.ht.service.BuildingsImgService;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class BuildingsImgServiceImpl implements BuildingsImgService {
    private BuildingsImgDAO buildingsImgDAO;
    @Override
    public void save(BuildingsImg buildingsImg) {
        buildingsImgDAO.save(buildingsImg);
    }

    @Override
    public void remove(BuildingsImg buildingsImg) {
        buildingsImgDAO.remove(buildingsImg);
    }

    @Override
    public void update(BuildingsImg buildingsImg) {
        buildingsImgDAO.update(buildingsImg);
    }

    @Override
    public void updateStatus(String id, short status) {
        buildingsImgDAO.updateStatus(id, status);
    }

    @Override
    public BuildingsImg foundById(String id) {
        return buildingsImgDAO.foundById(id);
    }

    @Override
    public Pager<BuildingsImg> listPager(Pager<BuildingsImg> pager) {
        return buildingsImgDAO.listPager(pager);
    }

    @Override
    public List<BuildingsImg> listAll() {
        return buildingsImgDAO.listAll();
    }

    @Override
    public Long count(Pager pager){
        return buildingsImgDAO.count(pager);
    }

    public BuildingsImgDAO getBuildingsImgDAO() {
        return buildingsImgDAO;
    }

    public void setBuildingsImgDAO(BuildingsImgDAO buildingsImgDAO) {
        this.buildingsImgDAO = buildingsImgDAO;
    }

    @Override
    public List<BuildingsImg> queryImgByBuildingsId(String id) {
        return this.buildingsImgDAO.queryImgByBuildingsId(id);
    }
}
