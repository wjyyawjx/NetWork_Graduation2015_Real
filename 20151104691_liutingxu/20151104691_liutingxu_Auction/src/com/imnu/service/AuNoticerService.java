package com.imnu.service;

import java.util.List;
import java.util.Map;

import com.imnu.common.Page;
import com.imnu.model.AuNotice;


public interface AuNoticerService {
	
	
	/**
	 * 查询显示所有
	 * @return
	 */
	public List<AuNotice> findAll(Page page,AuNotice auNotice);
	
	
	/**
	 * 根据id删除
	 */
	public int deleteByPrimaryKey(String noId);
	
	/**
	 * 增加和修改
	 */
	public int addOrUpdate(AuNotice auNotice);
	
	/**
	 * 根据id查询
	 */
	AuNotice findById(String noId);
	
	
	 /**
     * '查询总行数
     * @return
     */
	int findCount();

	/**
	 * 查询公告所有
	 * @return
	 */
	public List<Map<String, Object>> findNotice();

}
