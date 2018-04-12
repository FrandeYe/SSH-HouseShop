package com.ht.service.impl;

import com.ht.bean.Room;
import com.ht.common.Pager;
import com.ht.dao.RoomDAO;
import com.ht.service.RoomService;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class RoomServiceImpl implements RoomService{
    private RoomDAO roomDAO;
    @Override
    public void save(Room room) {
        roomDAO.save(room);
    }

    @Override
    public void remove(Room room) {
        roomDAO.remove(room);
    }

    @Override
    public void update(Room room) {
        roomDAO.update(room);
    }

    @Override
    public void updateStatus(String id, short status) {
        roomDAO.updateStatus(id, status);
    }

    @Override
    public Room foundById(String id) {
        return roomDAO.foundById(id);
    }

    @Override
    public Pager<Room> listPager(Pager<Room> pager) {
        return roomDAO.listPager(pager);
    }

    @Override
    public List<Room> listAll() {
        return roomDAO.listAll();
    }

    @Override
    public Long count(Pager pager){
        return roomDAO.count(pager);
    }

    public RoomDAO getRoomDAO() {
        return roomDAO;
    }

    public void setRoomDAO(RoomDAO roomDAO) {
        this.roomDAO = roomDAO;
    }

    @Override
    public void save(List<Room> rooms) {
        roomDAO.save(rooms);
    }

    @Override
    public void updateSaleStatus(String roomId, String saleStatus) {
        roomDAO.updateSaleStatus(roomId,saleStatus);
    }
}
