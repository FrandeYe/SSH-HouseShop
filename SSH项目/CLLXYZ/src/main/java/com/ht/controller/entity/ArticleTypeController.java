package com.ht.controller.entity;

import com.ht.bean.ArticleType;
import com.ht.common.Constants;
import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.controller.AppController;
import com.ht.service.ArticleTypeService;

import java.util.List;

/**
 * Created by ccf on 2017/8/29.
 */
public class ArticleTypeController  extends AppController{

    private ArticleType articleType;
    //提供set方法
    private ArticleTypeService articleTypeService;
    private Short status;
    private String id;
    private Integer page;
    //提供get方法
    private ControllerResult controllerResult;
    private List<ArticleType> rows;
    private Integer total;

    //文章类别添加
    public String saveArticleType(){

        if (articleType!=null) {
            articleType.setStatus(Constants.YES_STATUS);
            articleTypeService.save(articleType);
            controllerResult = ControllerResult.getSuccessResult("添加文章类型成功");
        }else{
            controllerResult = ControllerResult.getFailResult("添加文章类型失败");
        }

        return "saveArticleType";
    }

    //文章类别的修改
    public String updateArticleType(){
     try{
         articleTypeService.update(articleType);
         controllerResult = ControllerResult.getSuccessResult("修改文章类型成功");
     }catch (Exception e){
        controllerResult = ControllerResult.getFailResult("修改文章类型失败");
     }
        return SUCCESS;
    }

    //文章类型的激活与冻结
    public String statusArticleType(){

        if(status == 1){
            articleTypeService.updateStatus(id,status);
            controllerResult = ControllerResult.getSuccessResult("激活成功");
        }else if(status==0){
            articleTypeService.updateStatus(id,status);
            controllerResult = ControllerResult.getSuccessResult("冻结成功");
        }
        return "statusArticleType";
    }
    public String pagerArticleType(){
        int pageSize = Integer.valueOf(request.getParameter("rows"));
        Pager<ArticleType> pager = new Pager<ArticleType>();
        pager.setPageSize(pageSize);
        pager.setPage(page);
        pager = articleTypeService.listPager(pager);
        rows = pager.getResult();
        total = articleTypeService.count(pager).intValue();
        return "pagerArticleType";
    }
// 查找文章的名称
    public String foundTypename(){
        rows =articleTypeService.foundTypename();
        return "foundTypename";
    }


    public ArticleType getArticleType() {
        return articleType;
    }

    public void setArticleType(ArticleType articleType) {
        this.articleType = articleType;
    }

    public void setArticleTypeService(ArticleTypeService articleTypeService) {
        this.articleTypeService = articleTypeService;
    }
    public void setStatus(Short status) {
        this.status = status;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public List<ArticleType> getRows() {
        return rows;
    }

    public Integer getTotal() {
        return total;
    }
}
