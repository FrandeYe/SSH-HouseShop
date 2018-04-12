package com.ht.controller.entity;

import com.ht.bean.*;
import com.ht.common.*;
import com.ht.common.highcharts.BasicPillar;
import com.ht.controller.AppController;
import com.ht.service.*;
import com.ht.vo.BuildingsIndexInfoVO;
import com.ht.vo.BuildingsIndexVO;
import com.ht.vo.NameIdVO;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class BuildingsController extends AppController {

    private Buildings buildings;
    private Integer page;
    private String areaSelect;
    private String id;

    private List<BuildingsImg> buildingsImg;
    private ControllerResult controllerResult;
    private int total;
    private String title;
    private List<Buildings> rows;
    private List<NameIdVO> nameIdVOList;
    private List<BuildingsIndexVO> buildingsIndexVOList;
    private List<BasicPillar<Double>> series;
    private BuildingsIndexInfoVO buildingsIndexInfoVO;

    private BuildingsService buildingsService;
    private SaleService saleService;
    private HouseService houseService;
    private CommentService commentService;
    private LikeService likeService;
    private HistoryService historyService;
    private BuildingsImgService buildingsImgService;
    private MessageService messageService;
    private String year;
    private Short status;
    private File buildingsLogo;
    private String buildingsLogoFileName;

    /**
     * 赖：前台页面 查看楼盘详情。
     * @return
     */

    public String buildingsInfoIndex() {
        buildingsIndexInfoVO = new BuildingsIndexInfoVO();
        Buildings b = buildingsService.foundById(id);
        buildingsIndexInfoVO.setId(b.getId());
        buildingsIndexInfoVO.setName(b.getName());
        buildingsIndexInfoVO.setAddress(b.getAddress());
        buildingsIndexInfoVO.setArea(b.getArea());
        buildingsIndexInfoVO.setFloor_area(b.getFloor_area());
        buildingsIndexInfoVO.setBuilding_area(b.getBuilding_area());
        buildingsIndexInfoVO.setBuilding_type(b.getBuilding_type());
        buildingsIndexInfoVO.setAvg_price(b.getAvg_price());
        buildingsIndexInfoVO.setHouse_type(b.getHouse_type());
        buildingsIndexInfoVO.setLongitude(b.getLongitude());
        buildingsIndexInfoVO.setLatitude(b.getLatitude());
        buildingsIndexInfoVO.setCompany(b.getCompany());
        buildingsIndexInfoVO.setTotal_rooms(b.getTotal_rooms());
        buildingsIndexInfoVO.setReception_address(b.getReception_address());
        buildingsIndexInfoVO.setTel(b.getTel());
        buildingsIndexInfoVO.setGreen_ratio(b.getGreen_ratio());
        buildingsIndexInfoVO.setPlot_ratio(b.getPlot_ratio());
        buildingsIndexInfoVO.setProperty_company(b.getProperty_company());
        buildingsIndexInfoVO.setProperty_fee(b.getProperty_fee());
        buildingsIndexInfoVO.setCar_station(b.getCar_station());
        buildingsIndexInfoVO.setTraffic(b.getTraffic());
        buildingsIndexInfoVO.setEquipments(b.getEquipments());
        buildingsIndexInfoVO.setLogo(b.getLogo());
        buildingsIndexInfoVO.setIntro(b.getIntro());
        buildingsIndexInfoVO.setCreated_time(b.getCreated_time());
        buildingsIndexInfoVO.setBeginPrice(b.getAvg_price() + b.getProperty_fee());
        buildingsIndexInfoVO.setAgencyId(b.getAgency().getId());
        buildingsIndexInfoVO.setAgencyName(b.getAgency().getName());
        String statusParamStr = " where buildings_id='" + id + "' and status = 1";
        String noParamStr = " where buildings_id='" + id + "'";
        Pager statusPager = new Pager();
        statusPager.setParamStr(statusParamStr);
        Pager noPager = new Pager();
        noPager.setParamStr(noParamStr);
        buildingsIndexInfoVO.setViewCount(historyService.count(noPager).intValue());
        buildingsIndexInfoVO.setCommentCount(commentService.count(statusPager).intValue());
        buildingsIndexInfoVO.setMessageCount(messageService.count(statusPager).intValue());
        buildingsIndexInfoVO.setImgCount(buildingsImgService.count(noPager).intValue());
        buildingsIndexInfoVO.setLikeCount(likeService.count(noPager).intValue());

        Date openDate = b.getOpen_date();
        int year = openDate.getYear();
        int month = openDate.getMonth() + 1;
        int nowTime = DateUtil.year + DateUtil.month;
        if (nowTime < year + month) {
            buildingsIndexInfoVO.setSaleStatus("开盘日期：" + DateUtil.getCurrentMonth());
        } else {
            buildingsIndexInfoVO.setSaleStatus("已开盘");
        }
        Pager<House> housePager = new Pager<>();
        housePager.setParamStr(" where buildings_id='" + id + "' and status=1");
        housePager.setPageSize(houseService.count(housePager).intValue());
        housePager = houseService.listPager(housePager);
        for (House h : housePager.getResult()) {
            if (buildingsIndexInfoVO.getHouseName() == null) {
                buildingsIndexInfoVO.setHouseName("");
            }
            if (h.getName() == null) {
                h.setName("");
            }
            buildingsIndexInfoVO.setHouseName(buildingsIndexInfoVO.getHouseName() + " " + h.getName());
        }
        User user = (User) session.getAttribute("user");
        if (user instanceof User) {
            Like like = likeService.foundLikeUser(id, user.getId());
            if (like != null) {
                buildingsIndexInfoVO.setBooleanLike((short) 1);
            }
        }
        return SUCCESS;
    }

    /**
     * 首页区域筛选楼盘
     * @return
     */
    public String queryByArea(){
        String area = request.getParameter("area");
        Pager<Buildings> buildingsPager = new Pager<>();
        int pageSize = 4;//显示数据的个数，默认为4
        buildingsPager.setParamStr(" as a where a.area like '%"+area+"%' and status=1");
        int idCount = buildingsService.count(buildingsPager).intValue();//总记录数
//        total = idCount % pageSize == 0 ? (idCount / pageSize) : (idCount / pageSize) + 1;//总页数
//        if (page < 1) {
//            page = 1;
//        }
//        if (page > total) {
//            page = total;
//        }
        buildingsPager.setPage(1);// 当前页数
        buildingsPager.setPageSize(pageSize);
        buildingsPager = buildingsService.listPager(buildingsPager);
        rows = buildingsPager.getResult();
        return SUCCESS;
    }

    public String showMap() {
        request.setAttribute("longitude", request.getParameter("longitude"));
        request.setAttribute("latitude", request.getParameter("latitude"));
        return "showMap";
    }

    public String showBuildingsInfo() {
        User user = (User) session.getAttribute("user");
        if (user != null) {
            History history = historyService.foundHistoryUser(user.getId(), id);
            if (history != null) {
                history.setCreated_time(Calendar.getInstance().getTime());
                historyService.update(history);
            } else {
                history = new History();
                Buildings saveBuildings = new Buildings();
                saveBuildings.setId(id);
                history.setBuildings(saveBuildings);
                history.setCreated_time(Calendar.getInstance().getTime());
                history.setUser(user);
                historyService.save(history);
            }
        }
        return "showBuildingsInfo";
    }

    public String showBuildingsIndex(){
        Pager<Buildings> buildingsPager = new Pager<>();
        buildingsPager.setParamStr(" where status = 1 and agency_id = '" + id +"'");
        buildingsPager.setPage(1);//当前页数
        buildingsPager.setPageSize(4);
        buildingsPager = buildingsService.listPager(buildingsPager);
        rows = buildingsPager.getResult();
        return SUCCESS;
    }
    /**
     * 
     * 筛选楼盘
     */
//    public String queryByName(){
//        List<Buildings> buildingsList = buildingsService.queryByName(areaSelect);
//        return SUCCESS;
//    }
    public String queryByAreaSelect(){
        buildingsIndexVOList = new ArrayList<>();
        Pager<Buildings> buildingsPager = new Pager<>();
        int pageSize = 5;//显示数据的个数，默认为5
        buildingsPager.setParamStr(" as a where a.area like '%"+areaSelect+"%' and status=1");
        int idCount = buildingsService.count(buildingsPager).intValue();//总记录数
        total = idCount % pageSize == 0 ? (idCount / pageSize) : (idCount / pageSize) + 1;//总页数
        if (page < 1) {
            page = 1;
        }
        if (page > total) {
            page = total;
        }
        buildingsPager.setPage(page);// 当前页数
        buildingsPager.setPageSize(pageSize);
        buildingsPager = buildingsService.listPager(buildingsPager);
        for (Buildings buildings : buildingsPager.getResult()) {
            BuildingsIndexVO b = new BuildingsIndexVO();
            String buildingsId = buildings.getId();
            b.setId(buildingsId);
            b.setName(buildings.getName());
            b.setBuilding_area(String.valueOf(buildings.getBuilding_area()));
            b.setAgencyName(buildings.getAgency().getName());
            b.setAddress(buildings.getAddress());
            b.setLogo(buildings.getLogo());
            b.setArea(buildings.getArea());
            b.setBeginPrice(buildings.getProperty_fee() + buildings.getAvg_price());
            b.setMeanPrice(buildings.getAvg_price());
            b.setLongitude(buildings.getLongitude());
            b.setLatitude(buildings.getLatitude());
            b.setTel(buildings.getTel());
            b.setAgencyId(buildings.getAgency().getId());
            Date openDate = buildings.getOpen_date();
            int year = openDate.getYear();
            int month = openDate.getMonth() + 1;
            int nowTime = DateUtil.year + DateUtil.month;
            if (nowTime < year + month) {
                b.setSaleStatus("开盘日期：" + DateUtil.getCurrentMonth());
            } else {
                b.setSaleStatus("销售中");
            }
            Pager<House> housePager = new Pager<>();
            String commonParamStr = " where buildings_id='" + buildingsId + "'";
            housePager.setParamStr(commonParamStr);
            housePager.setPageSize(houseService.count(housePager).intValue());
            housePager = houseService.listPager(housePager);
            for (House h : housePager.getResult()) {
                if (b.getHouseName() == null) {
                    b.setHouseName("");
                }
                if (h.getName() == null) {
                    h.setName("");
                }
                b.setHouseName(b.getHouseName() + " " + h.getName());
            }
            Pager commonPager = new Pager();
            commonPager.setParamStr(commonParamStr);
            b.setCommentCount(commentService.count(commonPager).intValue());
            b.setViewCount(historyService.count(commonPager).intValue());
            b.setLikeCount(likeService.count(commonPager).intValue());
            b.setPictureCount(buildingsImgService.count(commonPager).intValue());
            buildingsIndexVOList.add(b);
        }
        return SUCCESS;
    }
    /**
     * 跳转到搜索结果页面
     */
    public String showSearchResults(){
        return "showSearchResults";
    }
    /**
     * 首页显示10个楼盘
     * @return
     */
    public String pagerBuildingsIndex() {
        buildingsIndexVOList = new ArrayList<>();
        Pager<Buildings> buildingsPager = new Pager<>();
        int pageSize = 10;//显示数据的个数，默认为10
        buildingsPager.setParamStr(" where status=1");
        int idCount = buildingsService.count(buildingsPager).intValue();//总记录数
        total = idCount % pageSize == 0 ? (idCount / pageSize) : (idCount / pageSize) + 1;//总页数
        if (page < 1) {
            page = 1;
        }
        if (page > total) {
            page = total;
        }
        buildingsPager.setPage(page);// 当前页数
        buildingsPager.setPageSize(pageSize);
        buildingsPager = buildingsService.listPager(buildingsPager);
        for (Buildings buildings : buildingsPager.getResult()) {
            BuildingsIndexVO b = new BuildingsIndexVO();
            String buildingsId = buildings.getId();
            b.setId(buildingsId);
            b.setName(buildings.getName());
            b.setBuilding_area(String.valueOf(buildings.getBuilding_area()));
            b.setAgencyName(buildings.getAgency().getName());
            b.setAddress(buildings.getAddress());
            b.setLogo(buildings.getLogo());
            b.setArea(buildings.getArea());
            b.setBeginPrice(buildings.getProperty_fee() + buildings.getAvg_price());
            b.setMeanPrice(buildings.getAvg_price());
            b.setLongitude(buildings.getLongitude());
            b.setLatitude(buildings.getLatitude());
            b.setTel(buildings.getTel());
            b.setAgencyId(buildings.getAgency().getId());
            Date openDate = buildings.getOpen_date();
            int year = openDate.getYear();
            int month = openDate.getMonth() + 1;
            int nowTime = DateUtil.year + DateUtil.month;
            if (nowTime < year + month) {
                b.setSaleStatus("开盘日期：" + DateUtil.getCurrentMonth());
            } else {
                b.setSaleStatus("销售中");
            }
            Pager<House> housePager = new Pager<>();
            String commonParamStr = " where buildings_id='" + buildingsId + "'";
            housePager.setParamStr(commonParamStr);
            housePager.setPageSize(houseService.count(housePager).intValue());
            housePager = houseService.listPager(housePager);
            for (House h : housePager.getResult()) {
                if (b.getHouseName() == null) {
                    b.setHouseName("");
                }
                if (h.getName() == null) {
                    h.setName("");
                }
                b.setHouseName(b.getHouseName() + " " + h.getName());
            }
            Pager commonPager = new Pager();
            commonPager.setParamStr(commonParamStr);
            b.setCommentCount(commentService.count(commonPager).intValue());
            b.setViewCount(historyService.count(commonPager).intValue());
            b.setLikeCount(likeService.count(commonPager).intValue());
            b.setPictureCount(buildingsImgService.count(commonPager).intValue());
            buildingsIndexVOList.add(b);
        }
        return SUCCESS;
    }

    /**
     * 页面：所有楼盘
     * @return
     */
    public String pagerBuildingsIndexVO() {
        buildingsIndexVOList = new ArrayList<>();
        Pager<Buildings> buildingsPager = new Pager<>();
        int pageSize = 5;//显示数据的个数，默认为5
        buildingsPager.setParamStr(" where status=1");
        int idCount = buildingsService.count(buildingsPager).intValue();//总记录数
        total = idCount % pageSize == 0 ? (idCount / pageSize) : (idCount / pageSize) + 1;//总页数
        if (page < 1) {
            page = 1;
        }
        if (page > total) {
            page = total;
        }
        buildingsPager.setPage(page);// 当前页数
        buildingsPager.setPageSize(pageSize);
        buildingsPager = buildingsService.listPager(buildingsPager);
        for (Buildings buildings : buildingsPager.getResult()) {
            BuildingsIndexVO b = new BuildingsIndexVO();
            String buildingsId = buildings.getId();
            b.setId(buildingsId);
            b.setName(buildings.getName());
            b.setBuilding_area(String.valueOf(buildings.getBuilding_area()));
            b.setAgencyName(buildings.getAgency().getName());
            b.setAddress(buildings.getAddress());
            b.setLogo(buildings.getLogo());
            b.setArea(buildings.getArea());
            b.setBeginPrice(buildings.getProperty_fee() + buildings.getAvg_price());
            b.setMeanPrice(buildings.getAvg_price());
            b.setLongitude(buildings.getLongitude());
            b.setLatitude(buildings.getLatitude());
            b.setTel(buildings.getTel());
            b.setAgencyId(buildings.getAgency().getId());
            Date openDate = buildings.getOpen_date();
            int year = openDate.getYear();
            int month = openDate.getMonth() + 1;
            int nowTime = DateUtil.year + DateUtil.month;
            if (nowTime < year + month) {
                b.setSaleStatus("开盘日期：" + DateUtil.getCurrentMonth());
            } else {
                b.setSaleStatus("销售中");
            }
            Pager<House> housePager = new Pager<>();
            String commonParamStr = " where buildings_id='" + buildingsId + "'";
            housePager.setParamStr(commonParamStr);
            housePager.setPageSize(houseService.count(housePager).intValue());
            housePager = houseService.listPager(housePager);
            for (House h : housePager.getResult()) {
                if (b.getHouseName() == null) {
                    b.setHouseName("");
                }
                if (h.getName() == null) {
                    h.setName("");
                }
                b.setHouseName(b.getHouseName() + " " + h.getName());
            }
            Pager commonPager = new Pager();
            commonPager.setParamStr(commonParamStr);
            b.setCommentCount(commentService.count(commonPager).intValue());
            b.setViewCount(historyService.count(commonPager).intValue());
            b.setLikeCount(likeService.count(commonPager).intValue());
            b.setPictureCount(buildingsImgService.count(commonPager).intValue());
            buildingsIndexVOList.add(b);
        }
        return SUCCESS;
    }
    /**
     * 赖：经销商查找今年每个楼盘每月的销售额。
     *
     * @return
     */
    public String buildingsMoneyTotal() {
        String yearStr = year;
        title = yearStr+"年楼盘销售额";
        series = new ArrayList<>();
        Pager<Buildings> pager = new Pager<>();
        pager.setParamStr(" where agency_id='" + id + "'");
        pager.setPageSize(buildingsService.count(pager).intValue());
        pager = buildingsService.listPager(pager); //获取到经销商的所有楼盘
        for (Buildings b : pager.getResult()) {
            BasicPillar<Double> basicPillar = new BasicPillar<>();
            basicPillar.setName(b.getName());
            Pager<Sale> salePager = new Pager<>();
            salePager.setParamStr(" where emp_id in (select id from Employee where buildings_id='" + b.getId() + "')" +
                    "and sale_time>='"+yearStr+"-1-1' and sale_time <'"+yearStr+"-12-31'");
            salePager.setPageSize(saleService.count(pager).intValue());
            salePager = saleService.listPager(salePager); //获取到该楼盘在2017年的所有销售记录。
            List<Double> doubles = new ArrayList<>();//用于存储 每月的销售额，
            for (int i = 0; i < 12; i++) {
                // 设置doubles的大小，方便后面的doubles.set(i, sale.getTotal_cost() + doubles.get(i))操作;
                doubles.add(0.0);
            }
            for (int i = 0; i < 12; i++) {
                for (Sale sale : salePager.getResult()) {
                    int month = sale.getSale_time().getMonth() + 1;// 获取到销售记录的销售时间
                    if (month == (i + 1)) {
                        //sale.getTotal_cost()获取到当前销售记录的销售额
                        //doubles.get(i) 获取到本月 之前已计算过的 销售记录 的销售额
                        doubles.set(i, sale.getTotal_cost() + doubles.get(i));
                    }
                }
            }
            basicPillar.setData(doubles);
            series.add(basicPillar);
        }
        return SUCCESS;
    }

    public String updateBuildingsLogo() {
        if (buildingsLogo != null) {
            try {
                FileUtils.copyFile(buildingsLogo, new File(FileUtil.upload() + File.separator + buildingsLogoFileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return SUCCESS;
    }

    /***
     * 分页查看经销商底下的楼盘
     * @return
     */
    public String pagerBuildingsAgency() {
        int pagerSize = Integer.valueOf(request.getParameter("rows"));
        Pager<Buildings> buildingsPager = new Pager<>();
        buildingsPager.setParamStr(" where agency_id='" + id + "' order by created_time desc");
        buildingsPager.setPage(page); //得到用户在页面选择的第几页数据
        buildingsPager.setPageSize(pagerSize); //得到用户在设置页面分页显示多少数据
        buildingsPager = buildingsService.listPager(buildingsPager);
        List<Buildings> result = buildingsPager.getResult();//获取到所有的楼栋
        rows = buildingsPager.getResult();//查询出所有经销商
        total = buildingsService.count(buildingsPager).intValue();//查询出经销商总数
        return SUCCESS;
    }

    /***
     * 查看单个楼盘详情(修改信息)
     * @return
     */
    public String foundById() {
        buildings = buildingsService.foundById(id);
        return SUCCESS;
    }

    /***
     * 添加楼盘
     * @return
     */
    public String saveBuildings() {
        try {
            buildings.setLogo("/"+FileUtil.PATH + "/"+Constants.DEFAULT_BUILDINGS_LOGO);
            buildings.setCreated_time(Calendar.getInstance().getTime());
            buildings.setStatus(Constants.YES_STATUS);
            buildingsService.save(buildings);
            controllerResult = ControllerResult.getSuccessResult("添加楼盘成功！");
        } catch (Exception e) {
            controllerResult = ControllerResult.getFailResult("添加楼盘失败！");
        }
        return SUCCESS;
    }

    /***
     * 修改楼盘
     * @return
     */
    public String updateBuildings() {
        try {
            buildings.setLogo("/" + FileUtil.PATH + "/" + buildings.getLogo());
            buildingsService.update(buildings);
            controllerResult = ControllerResult.getSuccessResult("修改楼盘信息成功");
        } catch (Exception e) {
            e.printStackTrace();
            controllerResult = ControllerResult.getFailResult("修改楼盘信息失败");
        }
        return SUCCESS;
    }

    /***
     * 更改楼盘状态（冻结，激活）
     * @return
     */
    public String updateStatus() {
        if (status != null) {
            if (status == 1) {
                buildingsService.updateStatus(id, status);
                controllerResult = ControllerResult.getSuccessResult("楼盘已可用");
            } else if (status == 0) {
                buildingsService.updateStatus(id, status);
                controllerResult = ControllerResult.getSuccessResult("楼盘冻结成功");
            } else {
                controllerResult = ControllerResult.getFailResult("操作失败");
            }
        }
        return SUCCESS;
    }

    /***
     * 增加、修改： 员工、楼栋、户型、活动时需要用到，
     * 把楼盘的id和name属性传到页面的下拉框。
     * @return
     */
    public String pagerBuildingsAgencyVO() {
        nameIdVOList = new ArrayList<>();
        Pager<Buildings> pager = new Pager<>();
        pager.setParamStr(" where agency.id='" + id + "'" + " and status=1");
        pager.setPageSize(buildingsService.count(pager).intValue());
        pager = buildingsService.listPager(pager);
        for (Buildings b : pager.getResult()) {
            NameIdVO nameIdVO = new NameIdVO();
            nameIdVO.setId(b.getId());
            nameIdVO.setName(b.getName());
            nameIdVOList.add(nameIdVO);
        }
        return SUCCESS;
    }

    //管理员查看楼盘分页
    public String pagerBuildingsAdmin() {
        int pageSize = Integer.valueOf(request.getParameter("rows")); // 每一页显示多少个数据
        Pager<Buildings> pager = new Pager<>();//创建分页对象
        pager.setPage(page);//得到用户页面选择的第几页，
        pager.setPageSize(pageSize);//得到用户在页面设置一页显示多少个数据
        pager = buildingsService.listPager(pager);
        rows = pager.getResult();//查询出所有活动
        total = buildingsService.count(pager).intValue();//查询出活动总数
        return SUCCESS;
    }

    // 管理员页面参看单个楼盘的所有信息
    public String adminBuildingsDetail() {
        buildings = buildingsService.foundById(id);
        return "adminBuildingsDetail";
    }
    public String buildingsImg() {
       request.setAttribute("id",id);
        return "buildingsImg";
    }
    /**
     * 首页显示所有楼盘
     * @return
     */
    public String showBuildings(){
        return "showBuildings";
    }

    public String getAreaSelect() {
        return areaSelect;
    }

    public void setAreaSelect(String areaSelect) {
        this.areaSelect = areaSelect;
    }

    public Buildings getBuildings() {
        return buildings;
    }

    public void setBuildings(Buildings buildings) {
        this.buildings = buildings;
    }

    public void setBuildingsService(BuildingsService buildingsService) {
        this.buildingsService = buildingsService;
    }

    public void setBuildingsImgService(BuildingsImgService buildingsImgService) {
        this.buildingsImgService = buildingsImgService;
    }
    public List<BuildingsImg> getBuildingsImg() {
        return buildingsImg;
    }
    public void setSaleService(SaleService saleService) {
        this.saleService = saleService;
    }

    public void setHouseService(HouseService houseService) {
        this.houseService = houseService;
    }

    public void setCommentService(CommentService commentService) {
        this.commentService = commentService;
    }

    public void setLikeService(LikeService likeService) {
        this.likeService = likeService;
    }

    public void setHistoryService(HistoryService historyService) {
        this.historyService = historyService;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public int getTotal() {
        return total;
    }

    public String getTitle() {
        return title;
    }

    public List<Buildings> getRows() {
        return rows;
    }

    public List<NameIdVO> getNameIdVOList() {
        return nameIdVOList;
    }

    public void setBuildingsLogo(File buildingsLogo) {
        this.buildingsLogo = buildingsLogo;
    }

    public void setBuildingsLogoFileName(String buildingsLogoFileName) {
        this.buildingsLogoFileName = buildingsLogoFileName;
    }

    public List<BasicPillar<Double>> getSeries() {
        return series;
    }

    public List<BuildingsIndexVO> getBuildingsIndexVOList() {
        return buildingsIndexVOList;
    }

    public BuildingsIndexInfoVO getBuildingsIndexInfoVO() {
        return buildingsIndexInfoVO;
    }

    public void setMessageService(MessageService messageService) {
        this.messageService = messageService;
    }

    public String getId() {
        return id;
    }
}
