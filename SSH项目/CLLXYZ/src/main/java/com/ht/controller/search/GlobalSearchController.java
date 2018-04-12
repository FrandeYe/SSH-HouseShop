package com.ht.controller.search;

import com.ht.common.ControllerResult;
import com.ht.common.Pager;
import com.ht.controller.AppController;
import com.ht.service.GlobalSearchService;
import com.ht.vo.GlobalSearchVO;
import sun.dc.path.PathError;

import java.util.List;

public class GlobalSearchController extends AppController {

    private String name;

    private List<GlobalSearchVO> globalSearchVOList;
    private long total;
    private long idCount;
    private ControllerResult controllerResult;

    private GlobalSearchService globalSearchService;
    private int page = 1;

    //index页面搜索跳转到搜索页
    public String showSearchPage() {
        return "showSearchPage";
    }

    public String globalSearchNavigate() {
        int pageSize = 8;
        Pager pager = new Pager();
        pager.setParamStr(name);
        try {
            idCount = globalSearchService.count(pager);
            total = idCount % pageSize == 0 ? (idCount / pageSize) : (idCount / pageSize) + 1;//总页数
            if (page < 1) {
                page = 1;
            }
            if (page > total) {
                page = (int) total;
            }
            globalSearchVOList = globalSearchService.globalSearchName(name, page, pageSize);
        } catch (Exception e) {
            e.printStackTrace();
            controllerResult = ControllerResult.getFailResult("未查询到有关“" + name + "”的内容");
            return SUCCESS;
        }
        controllerResult = ControllerResult.getSuccessResult("查询成功！");
        return SUCCESS;
    }

    public List<GlobalSearchVO> getGlobalSearchVOList() {
        return globalSearchVOList;
    }

    public void setGlobalSearchService(GlobalSearchService globalSearchService) {
        this.globalSearchService = globalSearchService;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getTotal() {
        return total;
    }

    public long getIdCount() {
        return idCount;
    }

    public ControllerResult getControllerResult() {
        return controllerResult;
    }
}
