package com.ht.service.impl;

import com.ht.bean.Customer;
import com.ht.common.Pager;
import com.ht.dao.CustomerDAO;
import com.ht.service.CustomerService;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class CustomerServiceImpl implements CustomerService {
    private CustomerDAO customerDAO;
    @Override
    public void save(Customer customer) {
        customerDAO.save(customer);
    }

    @Override
    public void remove(Customer customer) {
        customerDAO.remove(customer);
    }

    @Override
    public void update(Customer customer) {
        customerDAO.update(customer);
    }

    @Override
    public void updateStatus(String id, short status) {
        customerDAO.updateStatus(id, status);
    }

    @Override
    public Customer foundById(String id) {
        return  customerDAO.foundById(id);
    }

    @Override
    public Pager<Customer> listPager(Pager<Customer> pager) {
        return  customerDAO.listPager(pager);
    }

    @Override
    public List<Customer> listAll() {
        return  customerDAO.listAll();
    }

    @Override
    public Long count(Pager pager){
        return  customerDAO.count(pager);
    }

    public CustomerDAO getCustomerDAO() {
        return customerDAO;
    }

    public void setCustomerDAO(CustomerDAO customerDAO) {
        this.customerDAO = customerDAO;
    }

    @Override
    public void updateCustomerInfo(String id, Customer customer) {
        customerDAO.updateCustomerInfo(id,customer);
    }

    @Override
    public void updateCustomerFile(Customer customer, String sqlStr, String fileType) {
        customerDAO.updateCustomerFile(customer,sqlStr,fileType);
    }

    @Override
    public void updateCustomerType(Customer customer) {
        customerDAO.updateCustomerType(customer);
    }


}
