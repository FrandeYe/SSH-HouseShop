package com.ht.controller.entity;

import com.ht.bean.Activity;
import com.ht.common.Constants;
import com.ht.common.ControllerResult;
import com.ht.common.FileUtil;
import com.ht.common.Pager;
import com.ht.controller.AppController;
import com.ht.service.ActivityService;
import com.ht.vo.NameIdVO;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by qm on 2017/8/28.
 */
public class  ActivityController extends AppController {

    private Activity activity;
    private Integer page;
    private String id;

    private ActivityService activityService;
    private Short status;
    private File Image;
    private String ImageFileName;

    private ControllerResult controllerResult;
    private Integer total;
    private List<Activity> rows;
    private List<NameIdVO> activityVOList;

    // 在经销商详情页面显示 4 个活动
   public String pagerActivityIndex(){
       int pageSize = 4;
       Pager<Activity> pager = new Pager<>();
       pager.setPage(page);
       pager.setPageSize(pageSize);
       pager.setParamStr(" where status =1 and agency_id = '" + id +"'");
       pager = activityService.listPager(pager);
       rows = pager.getResult();
       total = activityService.count(pager).intValue();
       return SUCCESS;
   }

    public String pagerPlatformActivity(){
        int pageSize = Integer.valueOf(request.getParameter("rows")); // 每一页显示多少个数据
        Pager<Activity> pager = new Pager<>();//创建分页对象
        pager.setPage(page);//得到用户页面选择的第几页，
        pager.setPageSize(pageSize);//得到用户在页面设置一页显示多少个数据
        pager = activityService.listPlatformPager(pager);
        rows = pager.getResult();//查询出所有活动
        total = activityService.count(pager).intValue();//查询出活动总数
        return SUCCESS;
    }
    /**
     * 首页活动（叶）
     * @return
     */
    public String ActivityIndex(){
        Pager<Activity> activityPager = new Pager<>();
        int pageSize = 2;//显示两个活动
        activityPager.setPageSize(pageSize);
        activityPager.setPage(page);
        activityPager.setParamStr(" where status = 1");
        activityPager = activityService.listPager(activityPager);
        rows = activityPager.getResult();
        return SUCCESS;
    }

    /**
     * 赖：前台页面，显示活动详情
     * @return
     */
    public String activityInfo() {
        activity = activityService.foundById(id);
        return SUCCESS;
    }

    public String showActivityInfo() {
        return "showActivityInfo";
    }

    public String showActivities() {
        return "showActivities";
    }


    /***
     * 经销商分页查看自己的活动
     * @return
     */
    public String pagerActivityAgency() {
        int pageSize = Integer.valueOf(request.getParameter("rows"));
        Pager<Activity> pager = new Pager<>();
        pager.setPage(page);
        pager.setPageSize(pageSize);
        pager.setParamStr(" where agency_id='" + id + "'");
        pager = activityService.listPager(pager);
        rows = pager.getResult();
        total = activityService.count(pager).intValue();
        return SUCCESS;
    }

    /**
     * 赖：前端页面中 分页查看所有活动
     *
     * @return
     */
    public String pagerActivityIndexMore() {
        int pageSize = 5;
        Pager<Activity> pager = new Pager<>();
        pager.setParamStr(" where status=1 order by start_time desc");
        int idCount = activityService.count(pager).intValue();//总记录数
        total = idCount % pageSize == 0 ? (idCount / pageSize) : (idCount / pageSize) + 1;//总页数
        if (page < 1) {
            page = 1;
        }
        if (page > total) {
            page = total;
        }
        pager.setPage(page);
        pager.setPageSize(pageSize);
        pager = activityService.listPager(pager);
        rows = pager.getResult();//查询出所有活动
        return SUCCESS;
    }
    // 查看平台添加的活动
    public String pagerPlatFormActivity(){
        int pageSize = Integer.valueOf(request.getParameter("rows")); // 每一页显示多少个数据
        Pager<Activity> pager = new Pager<>();//创建分页对象
        pager.setPage(page);//得到用户页面选择的第几页，
        pager.setPageSize(pageSize);//得到用户在页面设置一页显示多少个数据
        pager = activityService.listPager(pager);
        rows = pager.getResult();//查询出所有活动
        total = activityService.count(pager).intValue();//查询出活动总数
        return SUCCESS;
    }

    /**
     * 2.添加活动
     *
     * @param
     */
    public String saveActivity() {
        try {
            if (ImageFileName!=null) {
                System.out.println(ImageFileName);
                activity.setLogo("/"+FileUtil.PATH + "/" + ImageFileName);
            } else {
                activity.setStatus(Constants.YES_STATUS);
                activity.setLogo("/" + FileUtil.PATH + "/" + Constants.DEFAULT_ACTIVITY_LOGO);
            }
            controllerResult = ControllerResult.getSuccessResult("添加活动成功！");
            activityService.save(activity);
        } catch (Exception e) {
            controllerResult = ControllerResult.getFailResult("添加活动失败！");
        }
        return SUCCESS;
    }

    /**
     * 3.修改活动
     *
     * @param
     */
    public String updateActivity() {
        try{
            activity.setLogo("/"+FileUtil.PATH + "/" + activity.getLogo());
            controllerResult = ControllerResult.getSuccessResult("修改活动成功");
            activityService.update(activity);
        }catch (Exception e) {
            controllerResult = ControllerResult.getFailResult("修改活动失败");
        }
        return SUCCESS;
    }

    /**
     * 活动的激活与冻结
     *
     * @param
     */
    public String statusActivity() {
        if (status != null) {
            if (status == 1) {
                activityService.updateStatus(id, status);
                controllerResult = ControllerResult.getSuccessResult("活动已可用");
            } else if (status == 0) {
                controllerResult = ControllerResult.getSuccessResult("活动冻结成功");
                activityService.updateStatus(id, status);
            } else {
                controllerResult = ControllerResult.getFailResult("操作失败");
            }
        }
        return SUCCESS;
    }

    // 用于上传活动图片的方法
    public String addActivityImg() {
        if (Image != null) {
            try {
                FileUtils.copyFile(Image, new File(FileUtil.upload() + File.separator + ImageFileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return SUCCESS;
    }


    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public void setActivityService(ActivityService activityService) {
        this.activityService = activityService;
    }

    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
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

    public void setImage(File image) {
        Image = image;
    }

    public void setImageFileName(String imageFileName) {
        ImageFileName = imageFileName;
    }

    public Integer getTotal() {
        return total;
    }

    public List<Activity> getRows() {
        return rows;
    }

    public Activity getActivity() {
        return activity;
    }

    public void setActivity(Activity activity) {
        this.activity = activity;
    }

    public List<NameIdVO> getActivityVOList() {
        return activityVOList;
    }
}
