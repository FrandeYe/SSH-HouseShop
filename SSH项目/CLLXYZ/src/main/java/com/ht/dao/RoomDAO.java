package com.ht.dao;

import com.ht.bean.Room;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public interface RoomDAO extends BaseDAO<String,Room> {

    void save(List<Room> rooms);

    /**
     * 修改房屋销售状态
     * @param roomId
     * @param saleStatus
     */
    void updateSaleStatus(String roomId,String saleStatus);
}
