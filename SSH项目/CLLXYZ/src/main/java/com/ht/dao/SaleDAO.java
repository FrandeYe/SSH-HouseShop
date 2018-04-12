package com.ht.dao;

import com.ht.bean.Sale;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by ccf on 2017/8/24.
 */
public interface SaleDAO extends BaseDAO<String,Sale> {
    Double calculateMoneyByMonth(String beginMonth, String endMonth, String id);
}