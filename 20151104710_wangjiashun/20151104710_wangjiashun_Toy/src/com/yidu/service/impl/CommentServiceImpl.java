package com.yidu.service.impl;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yidu.common.Pages;
import com.yidu.common.Tools;
import com.yidu.controller.vo.CommentVo;
import com.yidu.dao.CommentMapper;
import com.yidu.domain.Comment;
import com.yidu.domain.Toy;
import com.yidu.service.CommentService;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author wujie
 * @since 2018-10-18
 */
@Service
public class CommentServiceImpl  implements CommentService {
	@Resource
	CommentMapper commentMapper;
	
	@Override
	public PageInfo<CommentVo> findAll(Integer page,Integer pageSize,CommentVo vo) {
		PageHelper.startPage(page,pageSize);
		List<CommentVo> list = commentMapper.findAll(vo);
		PageInfo<CommentVo> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}

	@Override
	public int delete(String id) {
		int rows=commentMapper.deleteByPrimaryKey(id);
		return rows;
	}

	@Override
	public int findRows() {
		return commentMapper.findRow();
	}

	@Override
	public List<CommentVo> findByToyId(String toyId) {
		
		return commentMapper.findByToyId(toyId) ;
	}
	
	@Override
	public Integer findCommentRow(String toyId) {
		Integer row = commentMapper.findCommentRow(toyId);
		return row ;
	}
	
	@Override
	public int addOrUpdate(CommentVo vo) throws ParseException {
		Comment comment = new Comment();
		BeanUtils.copyProperties(vo, comment);
		
		if(vo.getCommentTime()!=null&&!"".equals(vo.getCommentTime())) {
			
			comment.setCommentTime(Tools.SDF_DATE.parse(vo.getCommentTime()));
		}
		int rows = 0;
		if(comment.getCommentId()!=null &&!"".equals(comment.getCommentId())) {
			rows = updateByPrimaryKeySelective(comment);
		}else {
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			comment.setCommentId(uuid);;
			rows = insertSelective(comment);
		}
		
		return rows;
		
	}

	@Override
	public int updateByPrimaryKeySelective(Comment comment) {
		return commentMapper.updateByPrimaryKeySelective(comment);
	}



	@Override
	public int insertSelective(Comment comment) {
		return commentMapper.insertSelective(comment);
	}


}
