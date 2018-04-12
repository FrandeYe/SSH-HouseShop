package com.ht.controller.entity;

import com.ht.bean.Activity;
import com.ht.bean.Building;
import com.ht.bean.House;
import com.ht.bean.Room;
import com.ht.common.Constants;
import com.ht.common.ControllerResult;
import com.ht.common.FileUtil;
import com.ht.common.Pager;
import com.ht.controller.AppController;
import com.ht.service.ActivityService;
import com.ht.service.BuildingService;
import com.ht.service.RoomService;
import com.ht.vo.NameIdVO;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by qm on 2017/8/28.
 */
public class RoomController extends AppController {

    private Room room;

    private RoomService roomService;
    private BuildingService buildingService;
    private ControllerResult controllerResult;

    private String id;
    private Short status;
    private Integer page;

    private Integer total;
    private List<Room> rows;
    private List<NameIdVO> nameIdVOList;

    /**
     * 房屋状态统计分页（叶）,直接调用pagerRoomBuilding方法。
     */

    /**
     * 赖：经销商先选择楼盘，再选择楼栋，
     * 然后根据楼栋id选择房号
     * @return
     */
    public String pagerRoomBuilding() {
        int pagerSize = Integer.valueOf(request.getParameter("rows"));
        Pager<Room> pager = new Pager<>();
        pager.setPage(page);
        pager.setPageSize(pagerSize);
        pager.setParamStr(" where building_id='" + id + "'");
        pager = roomService.listPager(pager);
        rows = pager.getResult();
        total = roomService.count(pager).intValue();
        return SUCCESS;
    }

    /**
     * 赖：添加销售记录时，根据楼栋id选择房号
     * @return
     */
    public String pagerRoomBuildingVO() {
        nameIdVOList = new ArrayList<>();
        Pager<Room> pager = new Pager<>();
        pager.setParamStr(" where building_id='" + id + "' and sale_status='" + Constants.DEFAULT_SALE_STATUS + "'");
        pager.setPageSize(roomService.count(pager).intValue());
        pager = roomService.listPager(pager);
        List<Room> result = pager.getResult();
        for (Room b : result) {
            NameIdVO nameIdVO = new NameIdVO();
            nameIdVO.setId(b.getId());
            nameIdVO.setName(b.getName());
            nameIdVOList.add(nameIdVO);
        }
        return SUCCESS;
    }

    public String saveRoom() {
        String buildingId = request.getParameter("room.building.id");//获取到选中的楼栋。
        Building building = buildingService.foundById(buildingId);
        List<Room> rooms = new ArrayList<Room>();
        String prefixName = building.getBuildings().getName() + "-" + building.getName() + "-";
        for (int i = 0; i < building.getTotal_floor(); i++) {//获取楼栋的层数
            for (int j = 0; j < building.getFloor_rooms(); j++) {// 获取楼栋每层的户数
                //获取每个房间的户型
                String houseId = request.getParameter("name_house" + (j + 1));
                House house = new House();
                house.setId(houseId);
                Room room = new Room();
                room.setBuilding(building);
                room.setHouse(house);
                int end_number = (j + 1);
                if (end_number < 10) {
                    room.setName(prefixName + (i+1) + "0" + end_number);
                } else {
                    room.setName(prefixName + (i+1) + "" + end_number);
                }
                room.setSale_status(Constants.DEFAULT_SALE_STATUS);
                rooms.add(room);
            }
        }
        roomService.save(rooms);
        controllerResult = ControllerResult.getSuccessResult("生成房号成功！");
        building.setRoom_status(Constants.NO_STATUS);
        buildingService.update(building);
        return SUCCESS;
    }

    public void setRoomService(RoomService roomService) {
        this.roomService = roomService;
    }

    public void setBuildingService(BuildingService buildingService) {
        this.buildingService = buildingService;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public List<NameIdVO> getNameIdVOList() {
        return nameIdVOList;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getTotal() {
        return total;
    }

    public List<Room> getRows() {
        return rows;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }
}
