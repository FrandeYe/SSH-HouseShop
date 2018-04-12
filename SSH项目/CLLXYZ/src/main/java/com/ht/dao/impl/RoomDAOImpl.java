package com.ht.dao.impl;

import com.ht.bean.Room;
import com.ht.common.HibernateSessionFactoryBean;
import com.ht.common.Pager;
import com.ht.dao.RoomDAO;
import org.hibernate.Session;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class RoomDAOImpl extends HibernateSessionFactoryBean implements RoomDAO {
    @Override
    public void save(Room room) {
        getSessionFactory().getCurrentSession().save(room);
    }

    @Override
    public void remove(Room room) {
        getSessionFactory().getCurrentSession().remove(room);
    }

    @Override
    public void update(Room room) {
        getSessionFactory().getCurrentSession().update(room);
    }

    @Override
    public void updateStatus(String id, short status) {
        Query query = getSessionFactory().getCurrentSession().createQuery(" update Room set status=:status where id=:id");
        query.setParameter("status",status);
        query.setParameter("id",id);
        query.executeUpdate();
    }

    @Override
    public Room foundById(String id) {
        String sql = "from Room where id=:id";
        Query query = getSessionFactory().getCurrentSession().createQuery(sql);
        query.setParameter("id",id);
        Room room = (Room) query.uniqueResult();
        return room;
    }

    @Override
    public Pager<Room> listPager(Pager<Room> pager) {
        Query query = getSessionFactory().getCurrentSession().createQuery("from Room" + pager.getParamStr());
        query.setFirstResult(pager.getBeginIndex());
        query.setMaxResults(pager.getPageSize());
        pager.setResult(query.list());
        return pager;
    }

    @Override
    public List<Room> listAll() {
        String sql = "from Room";
        List<Room> rooms = new ArrayList<>();
        Query query = getSessionFactory().getCurrentSession().createQuery(sql);
        rooms=query.list();
        return rooms;
    }

    @Override
    public Long count(Pager pager) {
        Long resultL = (Long) getSessionFactory().getCurrentSession().createQuery("select count(id) from Room" + pager.getParamStr()).uniqueResult();
        return resultL;
    }

    @Override
    public void save(List<Room> rooms) {
        Session session = getSessionFactory().getCurrentSession();
        for (int i = 0, size = rooms.size(); i < size; i++) {
            session.save(rooms.get(i));
            if (i % 20 == 0) {
                session.flush();
                session.clear();
            }
        }
    }

    @Override
    public void updateSaleStatus(String roomId, String saleStatus) {
        String sql = "update Room set sale_status=:sale_status where id=:id";
        Query query = getSessionFactory().getCurrentSession().createQuery(sql);
        query.setParameter("sale_status",saleStatus);
        query.setParameter("id",roomId);
        query.executeUpdate();
    }
}
