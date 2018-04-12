package com.ht.service.impl;

import com.ht.bean.Admin;
import com.ht.common.Pager;
import com.ht.dao.AdminDAO;
import com.ht.service.AdminService;
import com.ht.vo.NameIdVO;

import java.util.List;

/**
 * Created by ccf on 2017/8/23.
 */
public class AdminServiceImpl implements AdminService {
    private AdminDAO adminDAO;
    @Override
    public void save(Admin admin) {
        adminDAO.save(admin);
    }

    @Override
    public void remove(Admin admin) {
        adminDAO.remove(admin);
    }

    @Override
    public void update(Admin admin) {
        adminDAO.update(admin);
    }

    @Override
    public void updateStatus(String id, short status) {
        adminDAO.updateStatus(id, status);
    }

    @Override
    public Admin foundById(String id) {
        return adminDAO.foundById(id);
    }

    @Override
    public Pager<Admin> listPager(Pager<Admin> pager) {
        return adminDAO.listPager(pager);
    }

    @Override
    public List<Admin> listAll() {
        return adminDAO.listAll();
    }

    @Override
    public Long count(Pager pager){
        return adminDAO.count(pager);
    }

    public AdminDAO getAdminDAO() {
        return adminDAO;
    }

    public void setAdminDAO(AdminDAO adminDAO) {
        this.adminDAO = adminDAO;
    }

    @Override
    public Admin adminLogin(String phone, String pwd) {
        return adminDAO.adminLogin(phone,pwd);
    }

    @Override
    public List<NameIdVO> globalSearchName(String name) {
        return adminDAO.globalSearchName(name);
    }
}
