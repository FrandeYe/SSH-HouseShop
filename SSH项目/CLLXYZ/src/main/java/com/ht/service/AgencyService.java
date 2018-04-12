package com.ht.service;

import com.ht.bean.Agency;

import java.util.List;

/**
 * Created by ccf on 2017/8/23.
 */
public interface AgencyService extends BaseService<String, Agency> {

    void updateAgencyPwd(String id,String pwd);

    Agency queryByIdPwd(String id,String pwd);

    Agency foundByPhone(String phone);

    Agency foundByEmail(String email);

    Agency loginAgency(String email, String pwd);

    List<Agency> foundByUnchecked(short i);

    void updateCheckedStatus(String[] id, short checked_status);

    Agency loginPhone(String phone, String pwd);

    /**
     * 经销商修改自己的部分信息
     */
    void updateInfo(Agency agency);
}
