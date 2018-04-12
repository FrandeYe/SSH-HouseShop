package com.ht.service.impl;

import com.ht.bean.Sale;
import com.ht.common.Pager;
import com.ht.dao.SaleDAO;
import com.ht.service.SaleService;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class SaleServiceImpl implements SaleService{
    private SaleDAO saleDAO;
    @Override
    public void save(Sale sale) {
        saleDAO.save(sale);
    }

    @Override
    public void remove(Sale sale) {
        saleDAO.remove(sale);
    }

    @Override
    public void update(Sale sale) {
        saleDAO.update(sale);
    }

    @Override
    public void updateStatus(String id, short status) {
        saleDAO.updateStatus(id, status);
    }

    @Override
    public Sale foundById(String id) {
        return  saleDAO.foundById(id);
    }

    @Override
    public Pager<Sale> listPager(Pager<Sale> pager) {
        return  saleDAO.listPager(pager);
    }

    @Override
    public List<Sale> listAll() {
        return  saleDAO.listAll();
    }

    @Override
    public Long count(Pager pager){
        return  saleDAO.count(pager);
    }

    public SaleDAO getSaleDAO() {
        return saleDAO;
    }

    public void setSaleDAO(SaleDAO saleDAO) {
        this.saleDAO = saleDAO;
    }

    @Override
    public Double calculateMoneyByMonth(String beginMonth, String endMonth, String id) {
        return saleDAO.calculateMoneyByMonth(beginMonth,endMonth,id);
    }
}
