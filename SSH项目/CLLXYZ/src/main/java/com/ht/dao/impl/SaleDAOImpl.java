package com.ht.dao.impl;

import com.ht.bean.Sale;
import com.ht.common.HibernateSessionFactoryBean;
import com.ht.common.Pager;
import com.ht.dao.SaleDAO;
import org.hibernate.query.Query;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class SaleDAOImpl extends HibernateSessionFactoryBean implements SaleDAO {
    @Override
    public void save(Sale sale) {
        getSessionFactory().getCurrentSession().save(sale);
    }

    @Override
    public void remove(Sale sale) {
        getSessionFactory().getCurrentSession().remove(sale);
    }

    @Override
    public void update(Sale sale) {
        String sql = "update Sale set unit_price=:unit_price,discount=:discount,total_cost=:total_cost," +
                "sale_time=:sale_time,created_time=:created_time where id=:id";
        Query query = getSessionFactory().getCurrentSession().createQuery(sql);
        query.setParameter("discount",sale.getDiscount());
        query.setParameter("unit_price",sale.getUnit_price());
        query.setParameter("total_cost",sale.getTotal_cost());
        query.setParameter("sale_time",sale.getSale_time());
        query.setParameter("created_time",sale.getCreated_time());
        query.setParameter("id",sale.getId());
        query.executeUpdate();
    }

    @Override
    public void updateStatus(String id, short status) {
        String sql = "update Sale set status=:status where id=:id";
        Query query = getSessionFactory().getCurrentSession().createQuery(sql);
        query.setParameter("status",status);
        query.setParameter("id",id);
        query.executeUpdate();
    }

    @Override
    public Sale foundById(String id) {
        return null;
    }

    @Override
    public Pager<Sale> listPager(Pager<Sale> pager) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from Sale" + pager.getParamStr());
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setResult(query.list());
        return pager;
    }

    @Override
    public List<Sale> listAll() {
        return null;
    }

    @Override
    public Long count(Pager pager) {
        Long resultL = (Long) getSessionFactory().getCurrentSession().createQuery("select count(id) from Sale" + pager.getParamStr()).uniqueResult();
        return resultL;
    }

    @Override
    public Double calculateMoneyByMonth(String beginMonth,String endMonth,String id) {
        Query query = getSessionFactory().getCurrentSession().createQuery("SELECT SUM(total_cost) FROM Sale where sale_time>='" + beginMonth + "' and sale_time <'" + endMonth + "' and emp_id=:id");
        query.setParameter("id",id);
        return (Double) query.uniqueResult();
    }
}
