package com.ht.controller.entity;

import com.ht.bean.Ads;
import com.ht.common.Constants;
import com.ht.common.ControllerResult;
import com.ht.common.FileUtil;
import com.ht.common.Pager;
import com.ht.controller.AppController;
import com.ht.service.AdsService;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

public class AdsController extends AppController {
    private Ads ads;
    private AdsService adsService;
    private String id;
    private Short status;
    private Integer page;
    private String logo;
    private File Image;
    private String ImageFileName;

    private ControllerResult controllerResult;
    private Integer total;
    private List<Ads> rows;

    public void setLogo(String logo) {
        this.logo = logo;
    }


    public String checkLocation(){
        Integer location = Integer.valueOf(request.getParameter("location"));
        if (location!=null){
            Ads ads = adsService.show_order(location);
            if (ads!=null){
                controllerResult = ControllerResult.getFailResult("位置已占用！");
            }else{
                controllerResult = ControllerResult.getSuccessResult("位置可使用！");
            }
        }
        return SUCCESS;
    }
    /**
     *首页广告
     * @return
     */
    public String pagerAdsIndex(){
        Pager<Ads> adsPager = new Pager<>();
        int pageSize = 5;
        adsPager.setParamStr(" where status = 1 and show_status = 1");
        int idCount = adsService.count(adsPager).intValue();
        total = idCount % pageSize == 0 ? (idCount / pageSize) : (idCount / pageSize) + 1;//总页数
        if (page < 1) {
            page = 1;
        }
        if (page > total) {
            page = total;
        }
        adsPager.setPage(page);
        adsPager.setPageSize(pageSize);
        adsPager = adsService.listPager(adsPager);
        rows = adsPager.getResult();
        return SUCCESS;
    }
    //广告的添加，（已测试）
    public String saveAds() {
        try {
            if (ImageFileName != null) {
                ads.setLogo("/" + FileUtil.PATH + "/" + ImageFileName);
            } else {
                ads.setStatus(Constants.YES_STATUS);
                ads.setLogo(Constants.DEFAULT_ACTIVITY_LOGO);
            }
            controllerResult = ControllerResult.getSuccessResult("添加广告成功！");
            adsService.save(ads);
        } catch (Exception e) {
            controllerResult = ControllerResult.getFailResult("添加广告失败！");
        }
        return "saveAds";
    }


    //广告的修改,（已测试）
    public String updateAds() {
        if (ImageFileName==null){
            ads.setLogo(logo);
            adsService.update(ads);
            controllerResult = ControllerResult.getSuccessResult("修改广告成功");
        } else if (ImageFileName!=null){
            ads.setLogo("/" + FileUtil.PATH + "/" + ImageFileName);
            controllerResult = ControllerResult.getSuccessResult("修改广告成功");
            adsService.update(ads);
        }
        return SUCCESS;
    }


    //广告的激活冻结，（已测试）
    public String statusAds() {
        if (status != null) {
            if (status == 1) {
                adsService.updateStatus(id, status);
                controllerResult = ControllerResult.getSuccessResult("激活成功");
            } else if (status == 0) {
                adsService.updateStatus(id, status);
                controllerResult = ControllerResult.getSuccessResult("冻结成功");
            } else {
                controllerResult = ControllerResult.getFailResult("操作失败");
            }
        }
        return "statusAds";
    }


    //广告的分页查看，（已测试）
    public String pagerAds() {
        int pageSize = Integer.valueOf(request.getParameter("rows"));
        Pager<Ads> pager = new Pager<Ads>();
        pager.setPageSize(pageSize);
        pager.setPage(page);
        pager = adsService.listPager(pager);
        total = adsService.count(pager).intValue();
        rows = pager.getResult();
        return SUCCESS;
    }

    //图片路径的上传
    public String addAdsImg() {
        if (Image != null) {
            try {
                FileUtils.copyFile(Image, new File(FileUtil.upload() + File.separator + ImageFileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return "addAdsImg";
    }
    //提供的setter,getter方法

    public Ads getAds() {
        return ads;
    }

    public void setAds(Ads ads) {
        this.ads = ads;
    }

    public void setAdsService(AdsService adsService) {
        this.adsService = adsService;
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

    public void setResults(List<Ads> rows) {
        this.rows = rows;
    }

    public void setImage(File image) {
        Image = image;
    }

    public void setImageFileName(String imageFileName) {
        ImageFileName = imageFileName;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public Integer getTotal() {
        return total;
    }

    public List<Ads> getRows() {
        return rows;
    }
}
