package com.ht.service.impl;

import com.ht.bean.Like;
import com.ht.common.Pager;
import com.ht.dao.LikeDAO;
import com.ht.service.LikeService;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class LikeServiceImpl implements LikeService {
    private LikeDAO likeDAO;
    @Override
    public void save(Like like) {
        likeDAO.save(like);
    }

    @Override
    public void remove(Like like) {
        likeDAO.remove(like);
    }

    @Override
    public void update(Like like) {
        likeDAO.update(like);
    }

    @Override
    public void updateStatus(String id, short status) {
        likeDAO.updateStatus(id, status);
    }

    @Override
    public Like foundById(String id) {
        return likeDAO.foundById(id);
    }

    @Override
    public Pager<Like> listPager(Pager<Like> pager) {
        return likeDAO.listPager(pager);
    }

    @Override
    public List<Like> listAll() {
        return likeDAO.listAll();
    }

    @Override
    public Long count(Pager pager){
        return likeDAO.count(pager);
    }

    public LikeDAO getLikeDAO() {
        return likeDAO;
    }

    public void setLikeDAO(LikeDAO likeDAO) {
        this.likeDAO = likeDAO;
    }

    @Override
    public Like foundLikeUser(String buildingsId, String userId) {
        return likeDAO.foundLikeUser(buildingsId, userId);
    }
}
