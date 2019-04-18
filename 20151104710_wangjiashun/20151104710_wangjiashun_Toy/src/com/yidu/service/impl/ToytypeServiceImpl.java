package com.yidu.service.impl;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yidu.dao.ToyTypeMapper;
import com.yidu.domain.ToyType;
import com.yidu.service.ToytypeService;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author wujie
 * @since 2018-10-18
 */
@Service
public class ToytypeServiceImpl  implements ToytypeService {
	@Resource
	ToyTypeMapper dao;
	@Override
	public int add(ToyType toytype) {
		System.out.println("转过来的id"+toytype.getTypeId());
		
		if(toytype.getTypeId()==null || "".equals(toytype.getTypeId())) {
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			toytype.setTypeId(uuid);
			return dao.insertSelective(toytype);
		}else {
			return dao.updateByPrimaryKeySelective(toytype);
		}
	}

	

	@Override
	public int findRows() {
		// TODO Auto-generated method stub
		return dao.findRows();
	}

	@Override
	public int delete(String typeId) {
		// TODO Auto-generated method stub
		return dao.deleteByPrimaryKey(typeId);
	}

	@Override
	public ToyType findById(String typeId) {
		// TODO Auto-generated method stub
		return dao.selectByPrimaryKey(typeId);
	}

	@Override
	public PageInfo<ToyType> findAll(Integer page, Integer pageSize, ToyType us) {
		PageHelper.startPage(page,pageSize);
		List<ToyType> types = dao.findAlls(us);
		PageInfo<ToyType> typesPageInfo = new PageInfo<>(types);
		return typesPageInfo;

	}

}
