package com.yidu.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yidu.common.Pages;
import com.yidu.controller.vo.ToyVo;
import com.yidu.dao.ToyMapper;
import com.yidu.domain.Toy;
import com.yidu.domain.ToyType;
import com.yidu.service.ToyService;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author wujie
 * @since 2018-10-18
 */
@Service
public class ToyServiceImpl implements ToyService {
	
	@Resource
	ToyMapper toyMapper;
	
	@Override
	public PageInfo<ToyVo> findAll(Integer page,Integer pageSize,ToyVo vo) {
		PageHelper.startPage(page,pageSize);
		List<ToyVo> list = toyMapper.findAll(vo);
		PageInfo<ToyVo> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}
	
	

	@Override
	public int delete(String id) {
		int rows=toyMapper.deleteByPrimaryKey(id);
		return rows;
	}

	@Override
	public int findRows() {
		return toyMapper.findRow();
	}

	@Override
	public ToyVo findById(String toyId) {
		
		return toyMapper.selectByPrimaryKey(toyId);
	}

	@Override
	public List<ToyType> findType() {
		
		return toyMapper.findType();
	}

	@Override
	public int addOrUpdate(ToyVo vo) {
		Toy toy = new Toy();
		BeanUtils.copyProperties(vo, toy);
		if(vo.getToyMoney()!=null&&!"".equals(vo.getToyMoney())) {
			toy.setToyMoney(vo.getToyMoney());
		}
		if(vo.getToyDeposit()!=null&&!"".equals(vo.getToyDeposit())) {
			toy.setToyDeposit(vo.getToyDeposit());;
		}
		int rows = 0;
		if(toy.getToyId()!=null &&!"".equals(toy.getToyId())) {
			rows = updateByPrimaryKeySelective(toy);
		}else {
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			toy.setToyId(uuid);
			rows = insertSelective(toy);
		}
		
		return rows;
	}



	@Override
	public int updateByPrimaryKeySelective(Toy toy) {
		return toyMapper.updateByPrimaryKeySelective(toy);
	}



	@Override
	public int insertSelective(Toy toy) {
		return toyMapper.insertSelective(toy);
	}



	@Override
	public List<ToyVo> findByTypeId(String typeId) {
		
		return toyMapper.findByTypeId(typeId);
	}



	@Override
	public List<ToyVo> selectAll() {
		return toyMapper.selectAll();
	}



	@Override
	public List<ToyVo> queryAll(ToyVo toyvo) {
		List<ToyVo> voList = toyMapper.queryAll(toyvo);
		return voList;
	}

	
	
}
