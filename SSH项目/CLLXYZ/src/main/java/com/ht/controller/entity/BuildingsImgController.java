package com.ht.controller.entity;

import com.ht.bean.BuildingsImg;
import com.ht.common.ControllerResult;
import com.ht.common.FileUtil;
import com.ht.common.Pager;
import com.ht.controller.AppController;
import com.ht.service.BuildingsImgService;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

public class BuildingsImgController extends AppController {

    private BuildingsImg buildingsImg;
    private String id;
    private Integer page;

    private ControllerResult controllerResult;
    private Integer total;
    private List<BuildingsImg> rows;

    private BuildingsImgService buildingsImgService;
    private File buildingsImage;
    private String buildingsImageFileName;

    public String pagerBuildingsImgIndex() {
        int pageSize = 12;
        Pager<BuildingsImg> pager = new Pager<>();
        pager.setParamStr(" where buildings_id='" + id + "' order by created_time desc");
        int idCount = buildingsImgService.count(pager).intValue();//总记录数
        total = idCount % pageSize == 0 ? (idCount / pageSize) : (idCount / pageSize) + 1;//总页数
        if (page < 1) {
            page = 1;
        }
        if (page > total) {
            page = total;
        }
        pager.setPage(page);
        pager.setPageSize(pageSize);
        pager = buildingsImgService.listPager(pager);
        rows = pager.getResult();
        return SUCCESS;
    }

    public String showBuildingsImg() {
        return "showBuildingsImg";
    }

    public String update() {
        buildingsImg.setImg_path("/" + FileUtil.PATH + "/" + buildingsImg.getImg_path());
        buildingsImgService.update(buildingsImg);
        controllerResult = ControllerResult.getSuccessResult("修改图片成功！");
        return SUCCESS;
    }

    public String remove() {
        BuildingsImg bImg = new BuildingsImg();
        bImg.setId(id);
        buildingsImgService.remove(bImg);
        controllerResult = ControllerResult.getSuccessResult("删除成功！");
        return SUCCESS;
    }

    public String save() {
        buildingsImg.setCreated_time(Calendar.getInstance().getTime());
        buildingsImg.setImg_path("/" + FileUtil.PATH + "/" + buildingsImg.getImg_path());
        buildingsImgService.save(buildingsImg);
        controllerResult = ControllerResult.getSuccessResult("添加图片成功！");
        return SUCCESS;
    }

    public String uploadBuildingsImage() {
        if (buildingsImage != null) {
            try {
                FileUtils.copyFile(buildingsImage, new File(FileUtil.upload() + File.separator + buildingsImageFileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return SUCCESS;
    }

    public String pagerBuildingsImgBuildings() {
        int pagerSize = Integer.valueOf(request.getParameter("rows"));
        Pager<BuildingsImg> pager = new Pager<>();
        pager.setParamStr(" where buildings_id='" + id + "' order by created_time desc");
        pager.setPage(page);
        pager.setPageSize(pagerSize);
        pager = buildingsImgService.listPager(pager);
        List<BuildingsImg> result = pager.getResult();
        rows = pager.getResult();
        total = buildingsImgService.count(pager).intValue();
        return SUCCESS;
    }
    //


    public BuildingsImg getBuildingsImg() {
        return buildingsImg;
    }

    public void setBuildingsImg(BuildingsImg buildingsImg) {
        this.buildingsImg = buildingsImg;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public Integer getTotal() {
        return total;
    }

    public List<BuildingsImg> getRows() {
        return rows;
    }

    public void setBuildingsImgService(BuildingsImgService buildingsImgService) {
        this.buildingsImgService = buildingsImgService;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public void setBuildingsImage(File buildingsImage) {
        this.buildingsImage = buildingsImage;
    }

    public void setBuildingsImageFileName(String buildingsImageFileName) {
        this.buildingsImageFileName = buildingsImageFileName;
    }
}
