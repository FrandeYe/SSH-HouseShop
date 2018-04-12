package com.ht.service;

import com.ht.bean.Customer;

/**
 * Created by ccf on 2017/8/24.
 */
public interface CustomerService extends BaseService<String,Customer> {
    /**
     * 指定修改客户的某些信息y
     */
    void updateCustomerInfo(String id,Customer customer);
    /**
     * 给某个客户上传文件
     */
    void updateCustomerFile(Customer customer, String sqlStr, String fileType);
    /**
     * 完成购房记录后，变更为购房客户
     */
    void updateCustomerType(Customer customer);
}
