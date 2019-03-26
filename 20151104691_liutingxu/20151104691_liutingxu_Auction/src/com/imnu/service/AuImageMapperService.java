package com.imnu.service;

import java.util.List;

import com.imnu.common.Page;
import com.imnu.model.AuCommodity;
import com.imnu.model.AuImage;



/**
 * 图片表的service
 */
public interface AuImageMapperService {
	
	/**
	 * 关联查询显示
	 * @param imId
	 * @return
	 */
	 AuImage selectByPrimaryKey(String imId);
	
	 
	 /**
	  * 关联查询显示修改
	  * @param imId
	  * @return
	  */
	 AuImage selectByType(String imId);
	/**
	 * 显示所有
	 * @return
	 */
	public List<AuImage> findAll(Page page,AuImage auImage);
	
	/**
	 * 根据id删除
	 */
	public int delete(String id);
	
	/**
	 * 增加
	 */
	public int addOrUpdate(AuImage record);
	
	
	/**
	 * 显示所有类型
	 * @return
	 */
	public List<AuCommodity> findByType();
	
	/**
	 * 查询分页
	 * @return
	 */
	int findCount();


	List<AuImage> findBycomId(String comId, String imType);

}
