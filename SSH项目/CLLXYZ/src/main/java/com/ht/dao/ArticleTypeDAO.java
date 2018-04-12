package com.ht.dao;

import com.ht.bean.ArticleType;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public interface ArticleTypeDAO extends BaseDAO<String,ArticleType>{
   List<ArticleType> foundTypename();
}
