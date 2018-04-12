package com.ht.service;

import com.ht.bean.Comment;

/**
 * Created by ccf on 2017/8/24.
 */
public interface CommentService extends BaseService<String,Comment>{
    void updateComment(String id,String content);
}
