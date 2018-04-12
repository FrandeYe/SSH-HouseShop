package com.ht.dao.impl;

import com.ht.bean.ArticleType;
import com.ht.common.HibernateSessionFactoryBean;
import com.ht.common.Pager;
import com.ht.dao.ArticleTypeDAO;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class ArticleTypeDAOImpl extends HibernateSessionFactoryBean implements ArticleTypeDAO{

    @Override
    public void save(ArticleType articleType) {
        getSessionFactory().getCurrentSession().save(articleType);
    }

    @Override
    public void remove(ArticleType articleType) {
        getSessionFactory().getCurrentSession().remove(articleType);
    }

    @Override
    public void update(ArticleType articleType) {
        getSessionFactory().getCurrentSession().update(articleType);
    }

    @Override
    public void updateStatus(String id, short status) {
        Query query = getSessionFactory().getCurrentSession().createQuery("update ArticleType set status=:status where id=:id");
        query.setParameter("status",status);
        query.setParameter("id",id);
        query.executeUpdate();
    }

    @Override
    public ArticleType foundById(String id) {
        String hql = "from ArticleType where id = :id";
        Query query = getSessionFactory().getCurrentSession().createQuery(hql);
        query.setParameter("id",id);
        ArticleType articleType = (ArticleType) query.uniqueResult();
        return articleType;
    }

    @Override
    public Pager<ArticleType> listPager(Pager<ArticleType> pager) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from ArticleType" + pager.getParamStr());
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setResult(query.list());
        return pager;
    }

    @Override
    public List<ArticleType> listAll() {
        return null;
    }

    @Override
    public Long count(Pager pager) {
         Long resultLong = (Long)getSessionFactory().getCurrentSession().createQuery("select count(id) from ArticleType" + pager.getParamStr()).uniqueResult();
        return resultLong;
    }

    @Override
    public List<ArticleType> foundTypename() {
        Query query = getSessionFactory().getCurrentSession().createQuery("select id,name from ArticleType where status=1 ");
        List<Object[]> objects =query.list();
        List<ArticleType> articleTypes = new ArrayList<>();
        for (Object[] obj:objects) {
            ArticleType articleType = new ArticleType();
            articleType.setId((String)obj[0]);
            articleType.setName((String)obj[1]);
            articleTypes.add(articleType);
        }
        return articleTypes;
    }
}
