package com.ht.controller.entity;

import com.ht.bean.Agency;
import com.ht.bean.Building;
import com.ht.bean.Buildings;
import com.ht.common.Constants;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.controller.AppController;
import com.ht.service.BuildingService;
import com.ht.vo.NameIdVO;
import com.sun.xml.internal.bind.v2.runtime.reflect.opt.Const;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class BuildingController extends AppController {

    private Building building;

    //提供set
    private BuildingService buildingService;
    private String id;
    private Short status;
    private Integer page;

    //提供get
    private ControllerResult controllerResult;
    private Integer total;
    private List<Building> rows;
    private List<NameIdVO> nameIdVOList;


    /**
     * 赖：经销商分页查看自己的楼栋
     * @return
     */
    public String pagerBuildingAgency() {
        int pagerSize = Integer.valueOf(request.getParameter("rows"));
        Pager<Building> pager = new Pager<>();
        pager.setPage(page);
        pager.setPageSize(pagerSize);
        pager.setParamStr(" where agency_id='" + id + "' order by created_time desc");
        pager = buildingService.listPager(pager);
        List<Building> result = pager.getResult();
        rows = pager.getResult();
        total = buildingService.count(pager).intValue();
        return SUCCESS;
    }

    /***
     * 根据楼盘id来查找楼栋
     * @return
     */
    public String pagerBuildingBuildingsVO() {
        nameIdVOList = new ArrayList<>();
        Pager<Building> pager = new Pager<>();
        String roomStatus = request.getParameter("roomStatus");
        pager.setParamStr(" where buildings_id='" + id + "' and status=1 and room_status='" + roomStatus + "'");
        pager.setPageSize(buildingService.count(pager).intValue());
        pager = buildingService.listPager(pager);
        List<Building> result = pager.getResult();//获取到所有的楼栋
        for (Building b : result) {
            NameIdVO nameIdVO = new NameIdVO();
            nameIdVO.setId(b.getId());
            nameIdVO.setName(b.getName());
            nameIdVOList.add(nameIdVO);
        }
        return SUCCESS;
    }

    /***
     * 查看单个楼栋详情(修改信息)
     * @return
     */
    public String foundById(){
        building = buildingService.foundById(id);
        return "showAlterBuilding";
    }
    /***
     * 添加楼栋
     * @return
     */
    public String saveBuilding() {
        try {
            building.setCreated_time(Calendar.getInstance().getTime());
            building.setStatus(Constants.YES_STATUS);
            building.setRoom_status(Constants.YES_STATUS);
            //设置总户数为: 总层数 * 每层多少户。
            building.setTotal_room(building.getTotal_floor() * building.getFloor_rooms());
            buildingService.save(building);
            controllerResult = ControllerResult.getSuccessResult("添加楼栋成功！");
        } catch (Exception e) {
            e.printStackTrace();
            controllerResult = ControllerResult.getFailResult("添加楼栋失败！");
        }
        return SUCCESS;
    }

    /***
     * 修改楼栋
     * @return
     */
    public String updateBuilding() {
      try{
          buildingService.update(building);
          controllerResult = ControllerResult.getSuccessResult("修改楼栋成功");
      }catch (Exception e) {
          controllerResult = ControllerResult.getFailResult("修改楼栋失败");
      }
        return SUCCESS;
    }

    /***
     * 更改楼栋状态（冻结，激活）
     * @return
     */
    public String updateStatus() {
        if (status == 1) {
            buildingService.updateStatus(id, status);
            controllerResult = ControllerResult.getSuccessResult("楼栋激活成功");
        } else if (status == 0) {
            buildingService.updateStatus(id, status);
            controllerResult = ControllerResult.getSuccessResult("楼栋冻结成功");
        }
        return SUCCESS;
    }

    /***
     * 楼栋的分页查看
     * @return
     */
    public String pagerBuilding() {
        int pagerSize = Integer.valueOf(request.getParameter("rows"));
        Pager<Building> buildingPager = new Pager<>();
        buildingPager.setPage(page); //得到用户在页面选择的第几页数据
        buildingPager.setPageSize(pagerSize); //得到用户在设置页面分页显示多少数据
        buildingPager = buildingService.listPager(buildingPager);
        List<Building> result = buildingPager.getResult();//获取到所有的楼栋
        rows = buildingPager.getResult();//查询出所有经销商
        total = buildingService.count(buildingPager).intValue();//查询出经销商总数
        return "pagerUser";
    }

    public Building getBuilding() {
        return building;
    }

    public void setBuilding(Building building) {
        this.building = building;
    }

    public void setBuildingService(BuildingService buildingService) {
        this.buildingService = buildingService;
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

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public Integer getTotal() {
        return total;
    }

    public List<Building> getRows() {
        return rows;
    }

    public List<NameIdVO> getNameIdVOList() {
        return nameIdVOList;
    }
}
