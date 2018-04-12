package com.ht.service.impl;

import com.ht.bean.User;
import com.ht.common.Pager;
import com.ht.dao.UserDAO;
import com.ht.service.UserService;

import javax.transaction.Transactional;
import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
@Transactional
public class UserServiceImpl implements UserService {
    private UserDAO userDAO;
    @Override
    public void save(User user) {
        userDAO.save(user);
    }

    @Override
    public void remove(User user) {
        userDAO.remove(user);
    }

    @Override
    public void update(User user) {
        userDAO.update(user);
    }

    @Override
    public void updateStatus(String id, short status) {
        userDAO.updateStatus(id, status);
    }

    @Override
    public User foundById(String id) {
        return  userDAO.foundById(id);
    }

    @Override
    public Pager<User> listPager(Pager<User> pager) {
        return  userDAO.listPager(pager);
    }

    @Override
    public List<User> listAll() {
        return  userDAO.listAll();
    }

    @Override
    public Long count(Pager pager){
        return  userDAO.count(pager);
    }

    public UserDAO getUserDAO() {
        return userDAO;
    }

    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @Override
    public User findByPhone(String phone) {
        return userDAO.findByPhone(phone);
    }

    @Override
    public User findByEmail(String email) {
        return userDAO.findByEmail(email);
    }

    @Override
    public User loginUser(String phone, String pwd) {
        return userDAO.loginUser(phone,pwd);
    }
}
