package com.ht.bean;

/**
 * Created by qm on 2017/9/22.
 */
public class Pie {
    private String name;
    private double money;
    private boolean sliced;
    private boolean selected;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public boolean isSliced() {
        return sliced;
    }

    public void setSliced(boolean sliced) {
        this.sliced = sliced;
    }

    public boolean isSelected() {
        return selected;
    }

    public void setSelected(boolean selected) {
        this.selected = selected;
    }

    @Override
    public String toString() {
        return "pie{" +
                "name='" + name + '\'' +
                ", money=" + money +
                ", sliced=" + sliced +
                ", selected=" + selected +
                '}';
    }
}
