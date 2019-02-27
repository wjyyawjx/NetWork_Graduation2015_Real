package com.imnu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.imnu.model.AuIndent;

public interface AuIndentMapper {
	/**
	 * 删除
	 * @param inId 订单id
	 * @return 0 删除失败 1 删除成功
	 */
    int deleteByPrimaryKey(String inId);
    /**
     * 增加
     * @param record 订单model
     * @return 0 增加失败 1 增加成功
     */
    int insert(AuIndent record);
    /**
     * 增加
     * @param record 订单model
     * @return 0 增加失败 1 增加成功
     */
    int insertSelective(AuIndent record);
    /**
     * 根据id查询
     * @param inId 订单id
     * @return 订单model
     */
    AuIndent selectByPrimaryKey(String inId);
    /**
     * 修改
     * @param record 订单model
     * @return 0修改失败 1修改成功
     */
    int updateByPrimaryKeySelective(AuIndent record);
    /**
     * 修改
     * @param record 订单model 
     * @return 0 修改失败 1 修改成功
     */
    int updateByPrimaryKey(AuIndent record);
    /**
     * 查询所有
     * @param map 条件
     * @return 订单集合
     */
	List<AuIndent> query(Map<String, Object> map);
	/**
	 * 查询行数
	 * @param map 条件
	 * @return 行数
	 */
	int inCount(Map<String, Object> map);
	/**
	 * 根据用户id查询订单
	 * @param userId 用户id
	 * @return map集合
	 */
	List<Map<String, Object>> selectUser(String userId);
	
	List<String> selectTjt(String string);
	

}