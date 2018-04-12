package com.ht.dao.impl;

import com.ht.bean.Customer;
import com.ht.common.HibernateSessionFactoryBean;
import com.ht.common.Pager;
import com.ht.dao.CustomerDAO;
import org.hibernate.query.Query;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class CustomerDAOImpl extends HibernateSessionFactoryBean implements CustomerDAO {
    @Override
    public void save(Customer customer) {
        getSessionFactory().getCurrentSession().save(customer);
    }

    @Override
    public void remove(Customer customer) {
        getSessionFactory().getCurrentSession().remove(customer);
    }

    @Override
    public void update(Customer customer) {
        getSessionFactory().getCurrentSession().update(customer);
    }

    @Override
    public void updateStatus(String id, short status) {
        String sql = "update Customer set status=:status where id =:id";
        Query query = getSessionFactory().getCurrentSession().createQuery(sql);
        query.setParameter("status",status);
        query.setParameter("id",id);
        query.executeUpdate();
    }

    @Override
    public Customer foundById(String id) {
        String sql = "from Customer where id=:id";
        Query query = getSessionFactory().getCurrentSession().createQuery(sql);
        query.setParameter("id",id);
        Customer customers = (Customer) query.uniqueResult();
        return customers;
    }

    @Override
    public Pager<Customer> listPager(Pager<Customer> pager) {
        String sql = "from Customer" + pager.getParamStr();
        Query query = getSessionFactory().getCurrentSession().createQuery(sql);
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setResult(query.list());
        return pager;
    }

    @Override
    public List<Customer> listAll() {
        return null;
    }

    @Override
    public Long count(Pager pager) {
        Long result = (Long) getSessionFactory().getCurrentSession().createQuery("select count(id) from Customer" + pager.getParamStr()).uniqueResult();
        return result;
    }

    @Override
    public void updateCustomerInfo(String id, Customer customer) {
        String sql = "update Customer set name=:name,gender=:gender,birthday=:birthday,identity_id=:identity_id," +
                "email=:email,phone=:phone,customer_type=:customer_type,address=:address,together=:together where id=:id";
        Query query = getSessionFactory().getCurrentSession().createQuery(sql);
        query.setParameter("name",customer.getName());
        query.setParameter("gender",customer.getGender());
        query.setParameter("birthday",customer.getBirthday());
        query.setParameter("identity_id",customer.getIdentity_id());
        query.setParameter("email",customer.getEmail());
        query.setParameter("phone",customer.getPhone());
        query.setParameter("customer_type",customer.getCustomer_type());
        query.setParameter("address",customer.getAddress());
        query.setParameter("together",customer.getTogether());
        query.setParameter("id",id);
        query.executeUpdate();
    }

    @Override
    public void updateCustomerFile(Customer customer, String sqlStr, String fileType) {
        String sql = "update Customer set "+sqlStr;
        Query query = getSessionFactory().getCurrentSession().createQuery(sql);
            if ("contract".equals(fileType)){
                query.setParameter("contract",customer.getContract());
                query.setParameter("id",customer.getId());
            }else {
                query.setParameter("archives",customer.getArchives());
                query.setParameter("id",customer.getId());
            }
            query.executeUpdate();
    }

    @Override
    public void updateCustomerType(Customer customer) {
        String sql = "update Customer set customer_type=:customer_type where id=:id";
        Query query = getSessionFactory().getCurrentSession().createQuery(sql);
        query.setParameter("customer_type",customer.getCustomer_type());
        query.setParameter("id",customer.getId());
        query.executeUpdate();
    }

}
