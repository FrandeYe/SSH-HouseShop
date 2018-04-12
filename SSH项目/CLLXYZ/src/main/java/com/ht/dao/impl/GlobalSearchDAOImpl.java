package com.ht.dao.impl;

import com.ht.common.GlobalSearchUtil;
import com.ht.common.HibernateSessionFactoryBean;
import com.ht.common.Pager;
import com.ht.dao.GlobalSearchDAO;
import com.ht.vo.GlobalSearchVO;
import org.hibernate.query.NativeQuery;

import java.util.ArrayList;
import java.util.List;

public class GlobalSearchDAOImpl extends HibernateSessionFactoryBean implements GlobalSearchDAO {
    @Override
    public List<GlobalSearchVO> globalSearchName(String name, int page, int pageSize) {
        List<GlobalSearchVO> globalSearchVOS = new ArrayList<>();
        GlobalSearchUtil globalSearchUtil = new GlobalSearchUtil();
        NativeQuery nativeQuery = getSessionFactory().getCurrentSession().createNativeQuery(globalSearchUtil.getSearchSQL(name, page, pageSize));
        List<Object[]> results = nativeQuery.list();
        for (Object[] objs : results) {
            GlobalSearchVO globalSearchVO = new GlobalSearchVO();
            globalSearchVO.setId((String) objs[0]);
            globalSearchVO.setName((String) objs[1]);
            globalSearchVO.setType((String) objs[2]);
            globalSearchVO.setLogo((String) objs[3]);
            globalSearchVOS.add(globalSearchVO);
        }
        return globalSearchVOS;
    }

    @Override
    public void save(GlobalSearchVO globalSearchVO) {

    }

    @Override
    public void remove(GlobalSearchVO globalSearchVO) {

    }

    @Override
    public void update(GlobalSearchVO globalSearchVO) {

    }

    @Override
    public void updateStatus(String id, short status) {

    }

    @Override
    public GlobalSearchVO foundById(String id) {
        return null;
    }

    @Override
    public Pager<GlobalSearchVO> listPager(Pager<GlobalSearchVO> pager) {
        return null;
    }

    @Override
    public List<GlobalSearchVO> listAll() {
        return null;
    }

    @Override
    public Long count(Pager pager) {
        GlobalSearchUtil globalSearchUtil = new GlobalSearchUtil();
        NativeQuery nativeQuery = getSessionFactory().getCurrentSession().createNativeQuery(globalSearchUtil.getSearchCountSQL(pager.getParamStr()));
        long result = nativeQuery.list().size();
        return result;
    }
}
