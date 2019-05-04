package com.yidu.service;

import java.text.ParseException;
import java.util.List;

import com.github.pagehelper.PageInfo;
import com.yidu.common.Pages;
import com.yidu.controller.vo.CommentVo;
import com.yidu.controller.vo.ToyVo;
import com.yidu.domain.Comment;
import com.yidu.domain.Toy;
import com.yidu.domain.ToyType;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 王佳顺
 * @since 2018-10-18
 */
public interface CommentService  {

	/**
	 * 查询所有
	 * @return
	 */
	public PageInfo<CommentVo> findAll(Integer page,Integer pageSize,CommentVo vo);
	
	
	/**
	 * 删除的方法
	 * @return
	 */
	public int delete(String id);
	
	/**
	 * 查询行数
	 * @return
	 */
	public int findRows();
	

	/**
	 * 根据id查询
	 * @return
	 */
	public List<CommentVo> findByToyId(String toyId);

	
	/**
	 * 增加或修改的方法
	 * @param vo
	 */
	public int addOrUpdate(CommentVo vo)  throws ParseException ;
	
	
	/**
	 * 根据id修改
	 * @param toy
	 * @return
	 */
	public int updateByPrimaryKeySelective(Comment comment);
	
	/**
	 * 增加
	 * @param toy
	 * @return
	 */
	public int insertSelective(Comment comment);

	/**
	 * 查询评论行数
	 * @param toyId
	 * @return
	 */
	public Integer findCommentRow(String toyId);
	
}
