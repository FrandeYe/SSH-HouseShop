package com.ht.controller.entity;

import com.ht.bean.Buildings;
import com.ht.bean.Like;
import com.ht.bean.User;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.controller.AppController;
import com.ht.service.LikeService;

import java.util.Calendar;
import java.util.List;
import java.util.ResourceBundle;


/**
 * Created by Administrator on 2017/8/28.
 */
public class LikeController extends AppController {
    private Like like;//getter和setter方法

    private List<Like> rows; // getter
    private Integer total;
    private ControllerResult controllerResult;

    private LikeService likeService;     // setter
    private String id;       // setter
    private Integer page;   //setter

    public String changeLikeUser() {
        String userId = request.getParameter("userId");
        String buildingsId = request.getParameter("buildingsId");
        Like foundLike = likeService.foundLikeUser(buildingsId, userId);
        if (foundLike != null) {
            likeService.remove(foundLike);
            controllerResult = ControllerResult.getSuccessResult("取消点赞成功！");
        } else {
            Like saveLike = new Like();
            saveLike.setCreated_time(Calendar.getInstance().getTime());
            User user = new User();
            user.setId(userId);
            Buildings buildings = new Buildings();
            buildings.setId(buildingsId);
            saveLike.setUser(user);
            saveLike.setBuildings(buildings);
            likeService.save(saveLike);
            controllerResult = ControllerResult.getSuccessResult("点赞成功！");
        }
        return SUCCESS;
    }

    //添加
    public String saveLike(){
        Like like = new Like();
        like.setCreated_time(Calendar.getInstance().getTime()); //点赞的时间
        User user = new User();
        user.setId("4028809b5e1c0348015e1c03cad90000");
        like.setUser(user);
        Buildings build = new Buildings();
        build.setId("4028809b5e194a94015e194c1cd10000");
        like.setBuildings(build);
        likeService.save(like);
        return "saveLike";
    }
    //取消
    public String deleteLike(){
        likeService.remove(like);
        controllerResult = ControllerResult.getSuccessResult("删除成功");
        return "deleteLike";
    }
    //分页查看
    public String pagerLike(){
        int pageSize = Integer.valueOf(request.getParameter("rows")); // 每一页显示多少个数据 获取从页面上传递过来的数据个数
        Pager<Like> pager = new Pager<Like>(); //  组装pager对象 在分页查询中使用到 该对象
        pager.setPage(Integer.valueOf(page));
        pager.setPageSize(pageSize);
        pager = likeService.listPager(pager); // 查询出的结果
        rows = pager.getResult();
        total = likeService.count(pager).intValue();
        return "pagerLike";
    }

    //分页查看
    public String pagerLikeUser(){
        int pageSize = Integer.valueOf(request.getParameter("rows")); // 每一页显示多少个数据 获取从页面上传递过来的数据个数
        Pager<Like> pager = new Pager<Like>(); //  组装pager对象 在分页查询中使用到 该对象
        pager.setParamStr(" where user_id ='"+id+"' order by created_time desc");
        pager.setPage(Integer.valueOf(page));
        pager.setPageSize(pageSize);
        pager = likeService.listPager(pager); // 查询出的结果
        rows = pager.getResult();
        total = likeService.count(pager).intValue();
        return SUCCESS;
    }
    //状态的更改
    public String statusLike(){

        return "statusLike";
    }

    public Like getLike() {
        return like;
    }

    public void setLike(Like like) {
        this.like = like;
    }

    public List<Like> getRows() {
        return rows;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public void setLikeService(LikeService likeService) {
        this.likeService = likeService;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getTotal() {
        return total;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

}
