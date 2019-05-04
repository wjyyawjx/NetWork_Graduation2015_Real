package com.yidu.dao;

import java.util.List;

import com.yidu.common.Pages;
import com.yidu.controller.vo.CommentVo;
import com.yidu.domain.Comment;

public interface CommentMapper {
	
	public List<Comment> findType();
	
	public int findRow();
	
	/**
	 * 根据玩具id查询
	 * @param id
	 * @return
	 */
	public List<CommentVo> findByToyId(String id);
	
	/**
	 * 查询行数
	 * @param id
	 * @return
	 */
	public Integer findCommentRow(String id);
	/**
	 * 查询所有
	 * @param vo
	 * @return
	 */
	public List<CommentVo> findAll(CommentVo vo);
	
    int deleteByPrimaryKey(String commentId);

    int insert(Comment record);

    int insertSelective(Comment record);

    Comment selectByPrimaryKey(String commentId);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKey(Comment record);
}