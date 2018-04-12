package com.ht.dao;

import com.ht.bean.User;

/**
 * Created by ccf on 2017/8/24.
 */
public interface UserDAO extends BaseDAO<String,User> {

    User findByPhone(String phone);
    User findByEmail(String email);
    User loginUser(String phone, String pwd);
}
