package com.ht.dao;

import com.ht.bean.Admin;
import com.ht.vo.NameIdVO;

import java.util.List;

/**
 * Created by ccf on 2017/8/23.
 */
public interface AdminDAO extends BaseDAO<String,Admin> {
    Admin adminLogin(String phone,String pwd);

    List<NameIdVO> globalSearchName(String name);
}
