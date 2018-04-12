package com.ht.controller.test;

import com.ht.bean.*;
import com.ht.controller.AppController;
import com.ht.service.*;
import com.ht.service.impl.BuildingsImgServiceImpl;

import java.util.Calendar;

public class YeController extends AppController {

    private BuildingsService buildingsService;
    private BuildingService buildingService;
    private HouseService houseService;
    private RoomService roomService;
    private BuildingsImgService buildingsImgService;


    //测试单独添加楼盘数据
    public String addBuildingsTest(){
        Buildings buildings = new Buildings();
        buildings.setName("楼盘01");
        buildings.setAddress("江西省赣州市章贡区");
        buildings.setReception_address("赣州技师学院");
        buildings.setTel("12345678900");
        buildings.setAvg_price(3333.33);
        buildings.setFloor_area(99.99);
        buildings.setBuilding_area(111.11);
        buildings.setHouse_type("住宅");
        buildings.setLongitude(133.33);
        buildings.setLatitude(99.19);
        buildings.setOpen_date(Calendar.getInstance().getTime());
        buildingsService.save(buildings);
        return SUCCESS;
    }

    //单独添加楼栋数据测试
    public String addBuildingTest(){
        Building building = new Building();
        building.setName("楼栋01号");
        building.setFloor_rooms(25);
        building.setTotal_lift(5);
        building.setTotal_room(10);
        buildingService.save(building);
        return SUCCESS;
    }

    //单独添加户型数据
    public String addHouse(){
        House house = new House();
        house.setArea(111.11);
        house.setUnit_price(3333.33);
        house.setName("户型01");
        houseService.save(house);
        return SUCCESS;
    }

    //单独添加房号数据
    public String addRoom(){
        Room room = new Room();
        room.setName("1-101");
        room.setSale_status("待售中");
        roomService.save(room);
        return SUCCESS;
    }

    //单独添加楼盘图片表数据
    public String addBuildingsImg(){
        BuildingsImg buildingsImg = new BuildingsImg();
        buildingsImg.setImg_path("public/images");
        buildingsImg.setCreated_time(Calendar.getInstance().getTime());
        buildingsImgService.save(buildingsImg);
        return SUCCESS;
    }

    public void setBuildingsService(BuildingsService buildingsService) {
        this.buildingsService = buildingsService;
    }

    public void setBuildingService(BuildingService buildingService) {
        this.buildingService = buildingService;
    }

    public void setHouseService(HouseService houseService) {
        this.houseService = houseService;
    }

    public void setRoomService(RoomService roomService) {
        this.roomService = roomService;
    }

    public void setBuildingsImgService(BuildingsImgService buildingsImgService) {
        this.buildingsImgService = buildingsImgService;
    }
}
