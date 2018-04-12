package com.ht.controller.entity;

import com.ht.bean.Article;
import com.ht.bean.ArticleType;
import com.ht.bean.Customer;
import com.ht.common.Constants;
import com.ht.common.ControllerResult;
import com.ht.common.FileUtil;
import com.ht.common.Pager;
import com.ht.controller.AppController;
import com.ht.service.ArticleService;
import com.ht.service.ArticleTypeService;
import com.sun.xml.internal.bind.v2.runtime.reflect.opt.Const;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

/**
 * Created by ccf on 2017/8/29.
 */
public class ArticleController extends AppController {
    private Article article; // getter setter
    private String id;
    private Integer page;

    private ArticleService articleService;
    private ArticleTypeService articleTypeService;
    private String logo;
    private Short status;
    private String typeId;
    private File Image;
    private String ImageFileName;

    private ControllerResult controllerResult;
    private List<Article> rows;
    private Integer total;

    public String pagerArticleIndex() {
        Pager<Article> pager = new Pager<>();
        int pageSize = 9;
        pager.setParamStr(" where status=1 order by created_time desc");
        int idCount = articleService.count(pager).intValue();
        total = idCount % pageSize == 0 ? (idCount / pageSize) : (idCount / pageSize) + 1;
        if (page < 1) {
            page = 1;
        }
        if (page > total) {
            page = total;
        }
        pager.setPage(page);
        pager.setPageSize(pageSize);
        pager = articleService.listPager(pager);
        rows = pager.getResult();
        return SUCCESS;
    }

    public String showArticleInfo() {
        return "showArticleInfo";
    }

    public String articleInfo() {
        article = articleService.foundById(id);
        return SUCCESS;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    //文章添加
    public String saveArticle(){
        try {
            if (ImageFileName!=null) {
                article.setLogo("/"+FileUtil.PATH + "/" + ImageFileName);
            }else {
                article.setLogo(Constants.DEFAULT_ACTIVITY_LOGO);
            }
            article.setCreated_time(Calendar.getInstance().getTime());
            article.setStatus(Constants.YES_STATUS);
            articleService.save(article);
            controllerResult = ControllerResult.getSuccessResult("添加活动成功！");
        } catch (Exception e) {
            controllerResult = ControllerResult.getFailResult("添加活动失败！");
        }
        return SUCCESS;
    }

    //文章修改
    public String updateArticle(){
            if (ImageFileName==null){
                article.setLogo(logo);
                ArticleType articleType = articleTypeService.foundById(typeId);
                article.setArticleType(articleType);
                controllerResult = ControllerResult.getSuccessResult("修改文章成功");
                articleService.update(article);

            }else{
                article.setLogo("/"+FileUtil.PATH + "/" + ImageFileName);
                ArticleType articleType = articleTypeService.foundById(typeId);
                article.setArticleType(articleType);
                controllerResult = ControllerResult.getSuccessResult("修改文章成功");
                articleService.update(article);

            }
        return SUCCESS;
    }

    //文章冻结/激活
    public String statusArticle(){

        if(status == 1){
            controllerResult = ControllerResult.getSuccessResult("激活成功");
            articleService.updateStatus(id,status);
        }else if(status==0){
            controllerResult = ControllerResult.getSuccessResult("冻结成功");
            articleService.updateStatus(id,status);
        }else {
            controllerResult = ControllerResult.getFailResult("操作失败");
        }
        return SUCCESS;
    }

    //文章分页查看
    public String pagerArticle(){
        int pageSize = Integer.valueOf(request.getParameter("rows"));
        Pager<Article> pager = new Pager<Article>();
        pager.setPageSize(pageSize);
        pager.setPage(page);
        pager = articleService.listPager(pager);
        rows = pager.getResult();
        total = articleService.count(pager).intValue();
        return SUCCESS;
    }


    //图片的上传和更新
    public String articleImg(){
        if (Image != null) {
            try {
                FileUtils.copyFile(Image, new File(FileUtil.upload() + File.separator + ImageFileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return SUCCESS;
    }

    public String showArticles(){
        return "showArticles";
    }
    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }

    public void setArticleTypeService(ArticleTypeService articleTypeService) {
        this.articleTypeService = articleTypeService;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setImage(File image) {
        Image = image;
    }

    public void setImageFileName(String imageFileName) {
        ImageFileName = imageFileName;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }

    public List<Article> getRows() {
        return rows;
    }

    public Integer getTotal() {
        return total;
    }
}
