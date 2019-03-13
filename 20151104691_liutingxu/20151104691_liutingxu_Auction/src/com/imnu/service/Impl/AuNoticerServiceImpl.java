package com.imnu.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.imnu.common.Page;
import com.imnu.dao.AuNoticeMapper;
import com.imnu.model.AuNotice;
import com.imnu.service.AuNoticerService;


/**
 * 
 * 描述:公告表的实现类
 */
@Service
public class AuNoticerServiceImpl implements AuNoticerService{
	
	@Resource
	AuNoticeMapper dao;
	
	
	/**
	 * 查询显示所有
	 */
	@Override
	public List<AuNotice> findAll(Page page,AuNotice auNotice) {
		Map<String, Object> map =new HashMap<>();
		map.put("type",auNotice);
		map.put("curPage",page);
		return dao.findAll(map);
	}

	
	/**
	 * 根据id删除
	 */
	@Override
	public int deleteByPrimaryKey(String noId) {
		return dao.deleteByPrimaryKey(noId);
	}

	
	/**
	 * 增加和修改
	 */
	@Override
	public int addOrUpdate(AuNotice auNotice) {
		int rows=0;
		//判断公告id是否为空
		if(auNotice.getNoId()!=null && !"".equals(auNotice.getNoId())){
			//不为空调用修改方法
			rows=dao.updateByPrimaryKey(auNotice);
		}else{
			String UUid=UUID.randomUUID().toString().replaceAll("-", "");
			auNotice.setNoId(UUid);
			//为空调用增加方法
			rows=dao.insertSelective(auNotice);
			
		}
		return rows;
	}


	/**
	 * 根据id查询
	 */
	@Override
	public AuNotice findById(String noId) {
		return dao.findById(noId);
	}

	/**
	 * 分页查询
	 */
	@Override
	public int findCount() {
		return dao.findCount();
	}


	@Override
	public List<Map<String, Object>> findNotice() {
		return dao.findNotice();
	}



}
