package com.ht.controller.entity;

import com.ht.bean.Agency;
import com.ht.bean.Buildings;
import com.ht.bean.Message;
import com.ht.bean.User;
import com.ht.common.Constants;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.controller.AppController;
import com.ht.service.MessageService;
import com.ht.service.UserService;

import java.util.Calendar;
import java.util.List;

/**
 * 留言
 * Created by qm on 2017/8/28.
 */
public class MessageController extends AppController{

    private Message message;//提供setter和getter
    private User user;

    private ControllerResult controllerResult;//getter
    private Integer total;
    private List<Message> rows;

    private MessageService messageService;//setter
    private UserService userService;
    private String id;
    private Short status;
    private Integer page;

    /**
     * 赖：前台页面 用户对楼盘留言
     */
    public String save(){
        Message message = new Message();
        User user = new User();
        user.setId(request.getParameter("userId"));
        Buildings buildings = new Buildings();
        buildings.setId(request.getParameter("buildingsId"));//楼盘id
        Agency agency = new Agency();
        agency.setId(request.getParameter("agencyId"));
        message.setContent(request.getParameter("content"));
        message.setLeave_time(Calendar.getInstance().getTime());
        message.setUser(user);
        message.setBuildings(buildings);
        message.setAgency(agency);
        message.setStatus(Constants.YES_STATUS);
        messageService.save(message);
        controllerResult = ControllerResult.getSuccessResult("留言成功！");
        return SUCCESS;
    }
    /**
     * 赖：前台 楼盘详情页显示10个留言
     * @return
     */
    public String pagerMessageBuildings(){
        int pageSize = 10;
        Pager<Message> pager = new Pager<>();
        pager.setPageSize(pageSize);
        pager.setParamStr(" where buildings_id='" + id + "' and status=1 order by leave_time desc");
        pager = messageService.listPager(pager);
        rows = pager.getResult();
        return SUCCESS;
    }

    /**
     * 用户查看自己的留言并分页显示
     */
    public String pagerMessageUser(){
        int pageSize = Integer.valueOf(request.getParameter("rows")); // 每一页显示多少个数据
        Pager<Message> pager = new Pager<>();//创建分页对象
        pager.setParamStr(" where user_id ='"+id+"' order by reply_time desc");
        pager.setPage(page);//得到用户页面选择的第几页，
        pager.setPageSize(pageSize);//得到用户在页面设置一页显示多少个数据
        pager = messageService.listPager(pager);
        rows = pager.getResult();//查询出所有活动
        total = messageService.count(pager).intValue();//查询出活动总数
        return SUCCESS;
    }
    public String pagerMessageAgency(){
        int pageSize = Integer.valueOf(request.getParameter("rows")); // 每一页显示多少个数据
        Pager<Message> pager = new Pager<>();//创建分页对象
        pager.setParamStr(" where agency_id ='"+id+"' and status=1 order by reply_time desc");
        pager.setPage(page);//得到用户页面选择的第几页，
        pager.setPageSize(pageSize);//得到用户在页面设置一页显示多少个数据
        pager = messageService.listPager(pager);
        rows = pager.getResult();//查询出所有活动
        total = messageService.count(pager).intValue();//查询出活动总数
        return SUCCESS;
    }

    /**
     * 3.留言的修改
     * @return
     */
    public String updateMessage(){
        if(message.getId() !=null){
            messageService.updateMessage(message.getId(),message.getContent());
            controllerResult = ControllerResult.getSuccessResult("修改成功");
        }else{
            controllerResult = ControllerResult.getFailResult("修改失败");
        }
        return SUCCESS;
    }

    /**
     * 4.留言的激活与冻结
     * @return
     */
    public String statusMessage(){
        messageService.updateStatus(id,status);
        if(status != null){
            if(status==1){
                controllerResult = ControllerResult.getSuccessResult("激活成功！");
            } else if (status==0) {
                controllerResult = ControllerResult.getSuccessResult("冻结成功！");
            }

        }
        return SUCCESS;
    }

    //留言删除
    public String remove(){
        Message message =new Message();
        message.setId(id);
        messageService.remove(message);
        controllerResult = ControllerResult.getSuccessResult("删除成功");
        return SUCCESS;
    }
    //经销商留言回复
    public String replyMsg(){

        if(message.getId() !=null){
            messageService.updateMessageAgency(message.getId(),message.getReply(), Calendar.getInstance().getTime());
            controllerResult = ControllerResult.getSuccessResult("修改成功");
        }else{
            controllerResult = ControllerResult.getFailResult("修改失败");
        }
        return SUCCESS;
    }

    public Message getMessage() {
        return message;
    }

    public void setMessage(Message message) {
        this.message = message;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public Integer getTotal() {
        return total;
    }

    public List<Message> getRows() {
        return rows;
    }

    public void setMessageService(MessageService messageService) {
        this.messageService = messageService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
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

}
