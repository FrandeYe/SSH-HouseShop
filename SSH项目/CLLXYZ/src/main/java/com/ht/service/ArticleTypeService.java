package com.ht.service;

import com.ht.bean.ArticleType;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public interface ArticleTypeService extends BaseService<String,ArticleType> {
    List<ArticleType> foundTypename();
}
