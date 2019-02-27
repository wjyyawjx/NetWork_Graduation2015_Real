package com.imnu.service;

import java.util.List;

import com.imnu.common.Page;
import com.imnu.model.AuType;



/**
 * 
 * 描述:商品类型服务类
 */
public interface AuTypeService {
	int deleteByPrimaryKey(String typeId);

    int insert(AuType record);

    int insertSelective(AuType record);

    AuType selectByPrimaryKey(String typeId);

    int updateByPrimaryKeySelective(AuType record);

    int updateByPrimaryKey(AuType record);
	/**
	 * 查询所有类型
	 * @param page 
	 * @return 商品类型集合
	 */
	public List<AuType> queryAll(Page page, AuType type);
	/**
     * 增加或者修改的方法
     * @param type
     * @return
     */
    int addOrUpdate(AuType type);
    /**
     * '查询总行数
     * @return
     */
	int findCount();

	List<AuType> queryType();

	List<AuType> findAll();
}
