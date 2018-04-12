package com.ht.service;

import com.ht.dao.BaseDAO;
import com.ht.vo.GlobalSearchVO;

import java.util.List;

public interface GlobalSearchService extends BaseDAO<String, GlobalSearchVO> {

    List<GlobalSearchVO> globalSearchName(String name, int page, int pageSize);
}
