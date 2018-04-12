package com.ht.common.highcharts;

import java.util.List;

public class BasicPillar<T> {

    private String name;
    private List<T> data;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }
}
