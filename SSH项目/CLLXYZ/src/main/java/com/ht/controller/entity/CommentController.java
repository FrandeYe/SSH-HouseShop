package com.ht.controller.entity;

import com.ht.bean.Agency;
import com.ht.bean.Buildings;
import com.ht.bean.Comment;
import com.ht.bean.User;
import com.ht.common.Constants;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.controller.AppController;
import com.ht.service.CommentService;

import java.util.Calendar;
import java.util.List;

/**
 * Created by Administrator on 2017/8/29.
 */
public class CommentController extends AppController {

    private Comment comment;

    private List<Comment> rows; // getter
    private ControllerResult controllerResult; //getter
    private int total;

    private CommentService commentService;  //setter
    private String id;       // setter
    private int page;   //setter
    private Short status; // setter

    /**
     * 赖：用户在楼盘详情页评论楼盘
     * @return
     */
    public String save(){
        Comment comment = new Comment();
        Agency agency = new Agency();
        agency.setId(request.getParameter("agencyId"));
        User user= new User();
        user.setId(request.getParameter("userId"));
        Buildings buildings = new Buildings();
        buildings.setId(request.getParameter("buildingsId"));
        comment.setAgency(agency);
        comment.setContent(request.getParameter("content"));
        comment.setComment_time(Calendar.getInstance().getTime());
        comment.setUser(user);
        comment.setBuildings(buildings);
        comment.setStatus(Constants.YES_STATUS);
        commentService.save(comment);
        controllerResult = ControllerResult.getSuccessResult("评论成功！");
        return SUCCESS;
    }
    //评论修改
    public String updateComment() {
        if(comment.getId()!=null){
            commentService.updateComment(comment.getId(),comment.getContent());
            controllerResult = ControllerResult.getSuccessResult("修改内容成功");
        }else {
            controllerResult = ControllerResult.getFailResult("修改内容失败");
        }
        return SUCCESS;
    }
    //状态的修改
    public String statusComment() {
        System.out.println("com/ht/controller/UserController.java:160 status" + status);
        if (status!=null&&id!=null){
            if (status == 1) {
                commentService.updateStatus(id, status);
                controllerResult = ControllerResult.getSuccessResult("激活成功");
            }else if (status ==0){
                commentService.updateStatus(id,status);
                controllerResult = ControllerResult.getSuccessResult("冻结成功");
            }else {
                controllerResult = ControllerResult.getSuccessResult("操作失败");
            }
        }
        return "statusComment";
    }

    /**
     * 赖：前台 楼盘详情初始展示10个评论
     * @return
     */
    public String pagerCommentBuildings(){
        String pageSizeStr = request.getParameter("pageSize");
        Pager<Comment> pager = new Pager<Comment>();
        pager.setParamStr(" where buildings_id='" + id + "' and status=1 order by comment_time desc");
        int pageSize = 0;
        if (pageSizeStr != null) {
            pageSize = Integer.valueOf(pageSizeStr);// 页面传来的pageSize初始为10
        } else {
            pageSize = commentService.count(pager).intValue();
        }
        pager.setPageSize(pageSize);
        pager = commentService.listPager(pager); // 查询出的结果
        rows = pager.getResult();
        return SUCCESS;
    }

    /**
     * 用户查看属于自己的评价
     * @return
     */
    public String pagerCommentUser(){
        int pageSize = Integer.valueOf(request.getParameter("rows")); // 每一页显示多少个数据 获取从页面上传递过来的数据个数
        Pager<Comment> pager = new Pager<Comment>(); //  组装pager对象 在分页查询中使用到 该对象
        pager.setParamStr(" where user_id ='"+id+"' order by comment_time desc");
        pager.setPage(page);
        pager.setPageSize(pageSize);
        pager = commentService.listPager(pager); // 查询出的结果
        rows = pager.getResult();
        total = commentService.count(pager).intValue();
        return SUCCESS;
    }

    public String pagerCommentAgency(){
        int pageSize = Integer.valueOf(request.getParameter("rows")); // 每一页显示多少个数据 获取从页面上传递过来的数据个数
        Pager<Comment> pager = new Pager<Comment>(); //  组装pager对象 在分页查询中使用到 该对象
        pager.setParamStr(" where agency_id ='"+id+"' and status=1 order by comment_time desc");
        pager.setPage(page);
        pager.setPageSize(pageSize);
        pager = commentService.listPager(pager); // 查询出的结果
        rows = pager.getResult();
        total = commentService.count(pager).intValue();
        return SUCCESS;
    }

    public String removeComment(){
        Comment comment = new Comment();
        comment.setId(id);
        commentService.remove(comment);
        controllerResult = ControllerResult.getSuccessResult("删除成功");
        return "removeComment";
    }

    public Comment getComment() {
        return comment;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }

    public List<Comment> getRows() {
        return rows;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public int getTotal() {
        return total;
    }

    public void setCommentService(CommentService commentService) {
        this.commentService = commentService;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

}
