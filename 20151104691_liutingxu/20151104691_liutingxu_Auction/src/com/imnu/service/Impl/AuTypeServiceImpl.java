package com.imnu.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.imnu.common.Page;
import com.imnu.dao.AuTypeMapper;
import com.imnu.model.AuType;
import com.imnu.service.AuTypeService;




/**
 * 
 * 描述:商品类型服务实现类
 */
@Service
public class AuTypeServiceImpl implements AuTypeService{
	@Resource
	private AuTypeMapper typeDao;
	
	@Override
	public List<AuType> queryAll(Page page,AuType type) {
		Map<String, Object> map=new HashMap<>();
		map.put("type", type.getTypeName());
		map.put("type",type);
		map.put("page",page);
		return typeDao.queryAll(map);
	}

	@Override
	public int deleteByPrimaryKey(String typeId) {
		return typeDao.deleteByPrimaryKey(typeId);
	}

	@Override
	public int insert(AuType record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(AuType record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public AuType selectByPrimaryKey(String typeId) {
		return typeDao.selectByPrimaryKey(typeId);
	}

	@Override
	public int updateByPrimaryKeySelective(AuType record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(AuType record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addOrUpdate(AuType type) {
		int rows = 0;
		if(type.getTypeId() != null && !"".equals(type.getTypeId())){
			rows = typeDao.updateByPrimaryKeySelective(type);
		}else{
			rows = typeDao.insertSelective(type);
		}
		return rows;
	}

	@Override
	public int findCount() {
		int rows=typeDao.findCount();
		return rows;
	}

	@Override
	public List<AuType> queryType() {
		return typeDao.queryType();
	}

	@Override
	public List<AuType> findAll() {
		return typeDao.findAll();
	}
}
