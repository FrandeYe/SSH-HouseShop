package com.ht.dao;

import com.ht.vo.GlobalSearchVO;

import java.util.List;

public interface GlobalSearchDAO extends BaseDAO<String, GlobalSearchVO> {

    List<GlobalSearchVO> globalSearchName(String name, int page, int pageSize);
}
