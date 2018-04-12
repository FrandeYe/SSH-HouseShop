package com.ht.common;

import java.util.List;

/**
 * Created by mh on 2017/6/30.
 */
public class Pager<T> {

    private int page = 1;
    private int pageSize;
    private int total;

    /**
     * 查询参数，默认为空字符串（默认不需要传参数）。
     */
    private String paramStr = "";

    private List<T> result;

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public List<T> getResult() {
        return result;
    }

    public void setResult(List<T> result) {
        this.result = result;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getParamStr() {
        return paramStr;
    }

    public void setParamStr(String paramStr) {
        this.paramStr = paramStr;
    }

    public int getBeginIndex() {
        return (page - 1) * pageSize;
    }
}
