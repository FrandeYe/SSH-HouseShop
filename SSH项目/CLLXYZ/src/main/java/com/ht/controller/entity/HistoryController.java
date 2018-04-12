package com.ht.controller.entity;

import com.ht.bean.Buildings;
import com.ht.bean.History;
import com.ht.bean.Message;
import com.ht.bean.User;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.controller.AppController;
import com.ht.service.HistoryService;

import java.util.Date;
import java.util.List;

/**
 * Created by qm on 2017/8/28.
 */
public class HistoryController extends AppController{

    private History history;//提供setter和getter

    private ControllerResult controllerResult;//getter
    private Integer total;
    private List<History> rows;

    private HistoryService historyService;//setter
    private String id;
    private String buildingsId;
    private String userId;
    private Short status;
    private Integer page;

    public String foundHistory() {
        System.out.println("com/ht/controller/entity/HistoryController.java:34.." + id);
        return "showBuildingsInfo";
    }

    /**
     * 1.历史纪录的添加
     */
    public String saveHistory(){
        History history = new History();
        Buildings buildings = new Buildings();
        buildings.setId(buildingsId);
        history.setBuildings(buildings);
        User user = new User();
        user.setId(userId);
        history.setUser(user);
        history.setCreated_time(new Date());
        historyService.save(history);
        return "saveHistory";
    }

    /**
     * 1.历史纪录的分页查看
     * @return
     */
    public String pagerHistory(){
        int pageSize = Integer.valueOf(request.getParameter("rows")); // 每一页显示多少个数据
        Pager<History> pager = new Pager<>();//创建分页对象
        pager.setPage(page);//得到用户页面选择的第几页，
        pager.setPageSize(pageSize);//得到用户在页面设置一页显示多少个数据
        pager.setParamStr("where ");
        pager = historyService.listPager(pager);
        rows = pager.getResult();//查询出所有活动
        total = historyService.count(pager).intValue();//查询出活动总数
        return "pagerHistory";
    }

    /**
     * 1.历史纪录的分页查看
     * @return
     */
    public String pagerHistoryUser(){
        int pageSize = Integer.valueOf(request.getParameter("rows")); // 每一页显示多少个数据
        Pager<History> pager = new Pager<>();//创建分页对象
        pager.setParamStr(" where user_id ='"+id+"' order by created_time desc");
        pager.setPage(page);//得到用户页面选择的第几页，
        pager.setPageSize(pageSize);//得到用户在页面设置一页显示多少个数据
        pager = historyService.listPager(pager);
        rows = pager.getResult();//查询出所有活动
        total = historyService.count(pager).intValue();//查询出活动总数
        return "pagerHistory";
    }

    /**
     * 2.历史记录的删除
     * @return
     */
    public String deleteHistory(){
        historyService.remove(history);
        controllerResult = ControllerResult.getSuccessResult("删除成功");
        return "deleteHistory";
    }

    public History getHistory() {
        return history;
    }

    public void setHistory(History history) {
        this.history = history;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public Integer getTotal() {
        return total;
    }

    public List<History> getRows() {
        return rows;
    }

    public void setHistoryService(HistoryService historyService) {
        this.historyService = historyService;
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

    public void setBuildingsId(String buildingsId) {
        this.buildingsId = buildingsId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
}
