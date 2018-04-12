package com.ht.dao.impl;

import com.ht.bean.Agency;
import com.ht.common.HibernateSessionFactoryBean;
import com.ht.common.Pager;
import com.ht.dao.AgencyDAO;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.List;

/**
 * Created by ccf on 2017/8/23.
 */
public class AgencyDAOImpl extends HibernateSessionFactoryBean implements AgencyDAO {
    @Override
    public void save(Agency agency) {
        getSessionFactory().getCurrentSession().save(agency);
    }

    @Override
    public void remove(Agency agency) {
        getSessionFactory().getCurrentSession().remove(agency);
    }

    @Override
    public void update(Agency agency) {
        getSessionFactory().getCurrentSession().update(agency);
    }

    @Override
    public void updateStatus(String id, short status) {
        Query query = getSessionFactory().getCurrentSession().createQuery(" update Agency set status=:status where id=:id");
        query.setParameter("status", status);
        query.setParameter("id", id);
        query.executeUpdate();
    }

    @Override
    public Agency foundById(String id) {
        String sql = "from Agency where id=:id";
        Query query = getSessionFactory().getCurrentSession().createQuery(sql);
        query.setParameter("id", id);
        Agency agency = (Agency) query.uniqueResult();
        return agency;
    }

    @Override
    public Pager<Agency> listPager(Pager<Agency> pager) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from Agency" + pager.getParamStr());
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setResult(query.list());
        return pager;
    }

    @Override
    public List<Agency> listAll() {
        String sql = "from Agency";
        Query query = getSessionFactory().getCurrentSession().createQuery(sql);
        query.setFirstResult(0);
        query.setMaxResults(11);
        List<Agency> agencyList = query.list();
        return agencyList;
    }

    @Override
    public Long count(Pager pager) {
        Long resultL = (Long) getSessionFactory().getCurrentSession().createQuery("select count(id) from Agency" + pager.getParamStr()).uniqueResult();
        return resultL;
    }

    @Override
    public void updateInfo(Agency agency) {
        String sql = "update Agency set name=:name,email=:email,leader=:leader,phone=:phone,tel=:tel," +
                "address=:address,intro=:intro where id=:id";
        Query query = getSessionFactory().getCurrentSession().createQuery(sql);
        query.setParameter("name",agency.getName());
        query.setParameter("email",agency.getEmail());
        query.setParameter("leader",agency.getLeader());
        query.setParameter("phone",agency.getPhone());
        query.setParameter("tel",agency.getTel());
        query.setParameter("address",agency.getAddress());
        query.setParameter("intro",agency.getIntro());
        query.setParameter("id",agency.getId());
        query.executeUpdate();
    }

    @Override
    public void updateAgencyPwd(String id, String pwd) {
        String sql = "update Agency set pwd=:pwd where id=:id";
        Query query = getSessionFactory().getCurrentSession().createQuery(sql);
        query.setParameter("pwd",pwd);
        query.setParameter("id",id);
        query.executeUpdate();
    }

    @Override
    public Agency queryByIdPwd(String id, String pwd) {
        String sql = "from Agency where id=:id and pwd=:pwd";
        Query query = getSessionFactory().getCurrentSession().createQuery(sql);
        query.setParameter("id",id);
        query.setParameter("pwd",pwd);
        Agency agency = (Agency) query.uniqueResult();
        return agency;
    }

    @Override
    public Agency foundByPhone(String phone) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from Agency where phone=:phone");
        query.setParameter("phone", phone);
        Agency agency = (Agency) query.uniqueResult();
        return agency;
    }

    @Override
    public Agency foundByEmail(String email) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from Agency where email=:email");
        query.setParameter("email", email);
        Agency agency = (Agency) query.uniqueResult();
        return agency;

    }

    @Override
    public Agency loginAgency(String email, String pwd) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from Agency where email=:email and pwd=:pwd");
        query.setParameter("email", email);
        query.setParameter("pwd", pwd);
        Agency agency = (Agency) query.uniqueResult();
        return agency;

    }

    @Override
    public List<Agency> foundByUnchecked(short i) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from Agency where checked_status in (:checked_status)");
        query.setParameter("checked_status", i);
        List<Agency> agencies = query.getResultList();
        return agencies;
    }

    @Override
    public void updateCheckedStatus(String[] id, short checked_status) {
        for (int i = 0; i < id.length; i++) {
            String sql = "update Agency set checked_status=:checked_status where id=:id";
            Session session = getSessionFactory().getCurrentSession();
            Query query = session.createQuery(sql);
            query.setParameter("checked_status", checked_status);
            query.setParameter("id", id[i]);
            query.executeUpdate();
            if (i % 50 == 0) {
                session.flush();
                session.clear();
            }
        }
    }

    @Override
    public Agency loginPhone(String phone, String pwd) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from Agency where phone=:phone and pwd=:pwd and status=1 and checked_status=1");
        query.setParameter("phone",phone);
        query.setParameter("pwd",pwd);
        Agency agency = (Agency) query.uniqueResult();
        return agency;
    }
}
