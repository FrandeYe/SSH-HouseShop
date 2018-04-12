package com.ht.service.impl;

import com.ht.bean.Comment;
import com.ht.common.Pager;
import com.ht.dao.CommentDAO;
import com.ht.service.CommentService;

import java.util.List;

/**
 * Created by ccf on 2017/8/24.
 */
public class CommentServiceImpl implements CommentService {
    private CommentDAO commentDAO;
    @Override
    public void save(Comment comment) {
        commentDAO.save(comment);
    }

    @Override
    public void remove(Comment comment) {
        commentDAO.remove(comment);
    }

    @Override
    public void update(Comment comment) {
        commentDAO.update(comment);
    }

    @Override
    public void updateStatus(String id, short status) {
        commentDAO.updateStatus(id, status);
    }

    @Override
    public Comment foundById(String id) {
        return commentDAO.foundById(id);
    }

    @Override
    public Pager<Comment> listPager(Pager<Comment> pager) {
        return commentDAO.listPager(pager);
    }

    @Override
    public List<Comment> listAll() {
        return commentDAO.listAll();
    }

    @Override
    public Long count(Pager pager){
        return commentDAO.count(pager);
    }

    public CommentDAO getCommentDAO() {
        return commentDAO;
    }

    public void setCommentDAO(CommentDAO commentDAO) {
        this.commentDAO = commentDAO;
    }

    @Override
    public void updateComment(String id, String content) {
        commentDAO.updateComment(id,content);
    }
}
