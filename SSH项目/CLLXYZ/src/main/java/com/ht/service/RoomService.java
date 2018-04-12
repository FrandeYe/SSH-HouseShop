package com.ht.service;

import com.ht.bean.Room;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public interface RoomService extends BaseService<String,Room> {

    void save(List<Room> rooms);
    /**
     * 修改房屋销售状态
     * @param roomId
     * @param saleStatus
     */
    void updateSaleStatus(String roomId,String saleStatus);
}
