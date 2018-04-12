package com.ht.service.impl;

import com.ht.bean.ArticleType;
import com.ht.common.Pager;
import com.ht.dao.ArticleTypeDAO;
import com.ht.service.ArticleTypeService;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class ArticleTypeServiceImpl implements ArticleTypeService{
    private ArticleTypeDAO articleTypeDAO;
    @Override
    public void save(ArticleType articleType) {
        articleTypeDAO.save(articleType);
    }

    @Override
    public void remove(ArticleType articleType) {
        articleTypeDAO.remove(articleType);
    }

    @Override
    public void update(ArticleType articleType) {
        articleTypeDAO.update(articleType);
    }

    @Override
    public void updateStatus(String id, short status) {
        articleTypeDAO.updateStatus(id, status);
    }

    @Override
    public ArticleType foundById(String id) {
        return articleTypeDAO.foundById(id);
    }

    @Override
    public Pager<ArticleType> listPager(Pager<ArticleType> pager) {
        return articleTypeDAO.listPager(pager);
    }

    @Override
    public List<ArticleType> listAll() {
        return articleTypeDAO.listAll();
    }

    @Override
    public Long count(Pager pager){
        return articleTypeDAO.count(pager);
    }

    public ArticleTypeDAO getArticleTypeDAO() {
        return articleTypeDAO;
    }

    public void setArticleTypeDAO(ArticleTypeDAO articleTypeDAO) {
        this.articleTypeDAO = articleTypeDAO;
    }

    @Override
    public List<ArticleType> foundTypename() {
        return articleTypeDAO.foundTypename();
    }
}
