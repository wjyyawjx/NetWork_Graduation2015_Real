package com.yidu.service.impl;


import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yidu.controller.vo.CollectVo;
import com.yidu.dao.CollectMapper;
import com.yidu.domain.Collect;
import com.yidu.service.CollectService;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author wujie
 * @since 2018-10-18
 */
@Service
public class CollectServiceImpl  implements CollectService {

	@Resource
	private CollectMapper collectMapper;



	@Override
	public int add(Collect collect) {
		String  uuid=UUID.randomUUID().toString().replaceAll("-", "");
		collect.setCollectId(uuid);
		
		return collectMapper.insertSelective(collect);
	}



	@Override
	public List<CollectVo> selectfin(String id) {
		
		return collectMapper.selectfin(id);
	}



	@Override
	public int deleteByPrimaryKey(String collectId) {
		
		return collectMapper.deleteByPrimaryKey(collectId);
	}
	
	

}
