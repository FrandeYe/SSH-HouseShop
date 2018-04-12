package com.ht.controller.entity;

import com.ht.bean.Building;
import com.ht.bean.House;
import com.ht.common.Constants;
import com.ht.common.ControllerResult;
import com.ht.common.FileUtil;
import com.ht.common.Pager;
import com.ht.controller.AppController;
import com.ht.service.BuildingService;
import com.ht.service.HouseService;
import com.ht.vo.NameIdVO;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class HouseController extends AppController {

    private House house;

    public House getHouse() {
        return house;
    }

    public void setHouse(House house) {
        this.house = house;
    }

    //提供set
    private HouseService houseService;
    private BuildingService buildingService;
    private String id;
    private String agency_id;
    private Short status;
    private Integer page;
    private File houseLogo;
    private String houseLogoFileName;

    //提供get
    private ControllerResult controllerResult;
    private Integer total;
    private List<House> rows;
    private List<NameIdVO> nameIdVOList;

    /***
     * 前台页面 显示楼盘的户型图片
     * @return
     */
    public String pagerHouseBuildings() {
        Pager<House> pager = new Pager<>();
        pager.setParamStr(" where buildings_id='" + id + "' and status=1");
        pager.setPageSize(houseService.count(pager).intValue());
        pager = houseService.listPager(pager);
        rows = pager.getResult();
        return SUCCESS;
    }

    // 用于上传活动图片的方法
    public String updateHouseLogo() {
        if (houseLogo != null) {
            try {
                FileUtils.copyFile(houseLogo, new File(FileUtil.upload() + File.separator + houseLogoFileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return SUCCESS;
    }
    /***
     * 根据楼盘id查找户型，
     * @return
     */
    public String pagerHouseBuildingsVO() {
        nameIdVOList = new ArrayList<>();
        Pager<House> pager = new Pager<>();
        Building building = buildingService.foundById(request.getParameter("buildingId"));
        total = building.getFloor_rooms();
        pager.setParamStr(" where buildings_id='" + id + "' and status=1");
        pager.setPageSize(houseService.count(pager).intValue());
        pager = houseService.listPager(pager);
        List<House> result = pager.getResult();//获取到所有的楼栋
        for (House h : result) {
            NameIdVO nameIdVO = new NameIdVO();
            nameIdVO.setId(h.getId());
            nameIdVO.setName(h.getName());
            nameIdVOList.add(nameIdVO);
        }
        return SUCCESS;
    }

    /***
     * 查看单个户型详情(修改信息)
     * @return
     */
    public String foundById() {
        house = houseService.foundById(id);
        return "showAlterHouse";
    }

    /***
     * 户型的增加
     * @return
     */
    public String saveHouse() {
        try {
            house.setCreated_time(Calendar.getInstance().getTime());
            house.setStatus(Constants.YES_STATUS);
            house.setLogo("/"+FileUtil.PATH + "/"+Constants.DEFAULT_HOUSE_LOGO);
            houseService.save(house);
            controllerResult = ControllerResult.getSuccessResult("添加户型成功");
        } catch (Exception e) {
            controllerResult = ControllerResult.getFailResult("添加户型失败");
        }
        return SUCCESS;
    }

    /***
     * 户型的修改
     * @return
     */
    public String updateHouse() {
        try {
            house.setLogo("/" + FileUtil.PATH + "/" + house.getLogo());
            houseService.update(house);
            controllerResult = ControllerResult.getSuccessResult("户型修改成功");
        } catch (Exception e) {
            controllerResult = ControllerResult.getFailResult("户型修改失败");
        }
        return SUCCESS;
    }

    /***
     * 户型的激活和冻结
     * @return
     */
    public String statusHouse() {
        if (status == 1) {
            houseService.updateStatus(id, status);
            controllerResult = ControllerResult.getSuccessResult("户型激活成功");
        } else if (status == 0) {
            houseService.updateStatus(id, status);
            controllerResult = ControllerResult.getSuccessResult("户型冻结成功");
        }
        return SUCCESS;
    }

    /***
     * 经销商分页查看自己的户型，按时间倒序
     * @return
     */
    public String pagerHouseAgency() {
        int pagerSize = Integer.valueOf(request.getParameter("rows"));
        Pager<House> pager = new Pager<>();
        pager.setPage(page);
        pager.setPageSize(pagerSize);
        pager.setParamStr(" where agency_id='" + id + "' order by created_time desc");
        pager = houseService.listPager(pager);
        rows = pager.getResult();
        total = houseService.count(pager).intValue();
        return SUCCESS;
    }

    /***
     * 户型的分页查看
     * @return
     */
    public String pagerHouse() {
        int pagerSize = Integer.valueOf(request.getParameter("rows"));
        Pager<House> housePager = new Pager<>();
        housePager.setPage(page); //得到用户在页面选择的第几页数据
        housePager.setPageSize(pagerSize); //得到用户在设置页面分页显示多少数据
        housePager = houseService.listPager(housePager);
        rows = housePager.getResult();//获取到所有的楼栋
        total = houseService.count(housePager).intValue(); //查询出经销商的整数
        return SUCCESS;
    }

    //查找某个经销商下的所有户型
    public String agencyHouse(){
        if (agency_id!=null) {
            rows = houseService.foundHouses(agency_id);
        }
        return SUCCESS;
    }

    public void setHouseService(HouseService houseService) {
        this.houseService = houseService;
    }

    public void setBuildingService(BuildingService buildingService) {
        this.buildingService = buildingService;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setAgency_id(String agency_id) {
        this.agency_id = agency_id;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public void setHouseLogo(File houseLogo) {
        this.houseLogo = houseLogo;
    }

    public void setHouseLogoFileName(String houseLogoFileName) {
        this.houseLogoFileName = houseLogoFileName;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public Integer getTotal() {
        return total;
    }

    public List<House> getRows() {
        return rows;
    }

    public List<NameIdVO> getNameIdVOList() {
        return nameIdVOList;
    }

}
