package com.ht.service;

import com.ht.bean.Sale;
import org.springframework.remoting.caucho.BurlapServiceExporter;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by ccf on 2017/8/24.
 */
public interface SaleService extends BaseService<String,Sale> {
    Double calculateMoneyByMonth(String beginMonth, String endMonth, String id);
}
