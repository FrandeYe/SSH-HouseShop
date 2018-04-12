package com.ht.service.impl;

import com.ht.bean.Article;
import com.ht.common.Pager;
import com.ht.dao.ArticleDAO;
import com.ht.service.ArticleService;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class ArticleServiceImpl implements ArticleService {
    private ArticleDAO articleDAO;
    @Override
    public void save(Article article) {
        articleDAO.save(article);
    }

    @Override
    public void remove(Article article) {
        articleDAO.remove(article);
    }

    @Override
    public void update(Article article) {
        articleDAO.update(article);
    }

    @Override
    public void updateStatus(String id, short status) {
        articleDAO.updateStatus(id, status);
    }

    @Override
    public Article foundById(String id) {
        return articleDAO.foundById(id);
    }

    @Override
    public Pager<Article> listPager(Pager<Article> pager) {
        return articleDAO.listPager(pager);
    }

    @Override
    public List<Article> listAll() {
        return articleDAO.listAll();
    }

    @Override
    public Long count(Pager pager){
        return articleDAO.count(pager);
    }

    public ArticleDAO getArticleDAO() {

        return articleDAO;
    }

    public void setArticleDAO(ArticleDAO articleDAO) {
        this.articleDAO = articleDAO;
    }
}
