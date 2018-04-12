package com.ht.dao;

import com.ht.bean.Comment;

/**
 * Created by ccf on 2017/8/24.
 */
public interface CommentDAO extends BaseDAO<String,Comment> {
    void updateComment(String id,String content);
}
