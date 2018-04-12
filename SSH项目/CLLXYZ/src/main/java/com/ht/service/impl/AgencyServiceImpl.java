package com.ht.service.impl;

import com.ht.bean.Agency;
import com.ht.common.Pager;
import com.ht.dao.AgencyDAO;
import com.ht.service.AgencyService;

import java.util.List;

/**
 * Created by ccf on 2017/8/23.
 */
public class AgencyServiceImpl implements AgencyService {

    private AgencyDAO agencyDAO;
    @Override
    public void save(Agency agency) {
        agencyDAO.save(agency);
    }

    @Override
    public void remove(Agency agency) {
        agencyDAO.remove(agency);
    }

    @Override
    public void update(Agency agency) {
        agencyDAO.update(agency);
    }

    @Override
    public void updateStatus(String id, short status) {
        agencyDAO.updateStatus(id, status);
    }

    @Override
    public Agency foundById(String id) {
        return agencyDAO.foundById(id);
    }

    @Override
    public Pager<Agency> listPager(Pager<Agency> pager) {
        return agencyDAO.listPager(pager);
    }

    @Override
    public List<Agency> listAll() {
        return agencyDAO.listAll();
    }

    @Override
    public Long count(Pager pager){
        return agencyDAO.count(pager);
    }

    public AgencyDAO getAgencyDAO() {
        return agencyDAO;
    }

    public void setAgencyDAO(AgencyDAO agencyDAO) {
        this.agencyDAO = agencyDAO;
    }

    @Override
    public void updateInfo(Agency agency) {
        agencyDAO.updateInfo(agency);
    }

    @Override
    public void updateAgencyPwd(String id, String pwd) {
        agencyDAO.updateAgencyPwd(id,pwd);
    }

    @Override
    public Agency queryByIdPwd(String id, String pwd) {
        return agencyDAO.queryByIdPwd(id,pwd);
    }

    @Override
    public Agency foundByPhone(String phone) {
        return agencyDAO.foundByPhone(phone);
    }

    @Override
    public Agency foundByEmail(String email) {
        return agencyDAO.foundByEmail(email);
    }

    @Override
    public Agency loginAgency(String email, String pwd) {
        return agencyDAO.loginAgency(email, pwd);
    }

    @Override
    public List<Agency> foundByUnchecked(short i) {
        return agencyDAO.foundByUnchecked(i);
    }

    @Override
    public void updateCheckedStatus(String[] id, short checked_status) {
        agencyDAO.updateCheckedStatus(id,checked_status);
    }

    @Override
    public Agency loginPhone(String phone, String pwd) {
        return agencyDAO.loginPhone(phone,pwd);
    }
}
