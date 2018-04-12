package com.ht.service;

import com.ht.common.Pager;

import java.util.List;

public interface BaseService<PK, T> {

    void save(T t);
    void remove(T t);
    void update(T t);
    void updateStatus(PK id, short status);
    T foundById(PK id);
    Pager<T> listPager(Pager<T> pager);
    List<T> listAll();
    Long count(Pager pager);
}
