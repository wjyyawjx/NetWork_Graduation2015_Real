package com.imnu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.imnu.model.AuRecord;

/**
 * 出价记录mapper
 */
public interface AuRecordMapper {
	/**
	 * 删除
	 * @param reId 出价id
 	 * @return 0 删除失败 1 删除成功
	 */
    int deleteByPrimaryKey(String reId);
    /**
     * 增加
     * @param 出价记录model
     * @return
     */
    int insert(AuRecord record);
    /**
     * 增加
     * @param record 出价记录model
     * @return 0增加失败 1 增加成功
     */
    int insertSelective(AuRecord record);
    /**
     * 根据id查询
     * @param reId 出价id
     * @return 出价记录model
     */
    AuRecord selectByPrimaryKey(String reId);
    /**
     * 修改
     * @param record 出价记录model
     * @return 0 修改失败 1 修改成功
     */
    int updateByPrimaryKeySelective(AuRecord record);
    /**
     * 修改
     * @param record 出价记录model
     * @return 0 修改失败 1 修改成功
     */
    int updateByPrimaryKey(AuRecord record);
    /**
     * 根据商品id查询
     * @param comId 商品名称
     * @return 出价记录map集合
     */
	List<Map<String, Object>> findRecord(String comId);
	/**
	 * 查询出价记录排行
	 * @param comId 商品id
	 * @return 出价记录map集合
	 */
	List<Map<String, Object>> RecordOrder(String comId);
	/**
	 * 查询行数
	 * @param comId 商品id
	 * @return 行数
	 */
	int findRecordCount(String comId);
	/**
	 * 查询该用户参加的竞拍
	 * @param comId 商品id
	 * @return 出价记录map集合
	 */
	List<Map<String, Object>> findUserRecord(String userId);
	/**
	 * 查询所有
	 * @param map 条件
	 * @return 出价记录集合
	 */
	List<AuRecord> query(Map<String, Object> map);
	/**
	 * 查询行数
	 * @param map 条件
	 * @return 行数
	 */
	int reCount(Map<String, Object> map);
	/**
	 * 根据用户id查询 出价记录 商品 用户表
	 * @param userId 用户id
	 * @return map集合
	 */
	@Select("SELECT * FROM au_record re,au_commodity co,au_user us WHERE re.user_id=us.user_id AND re.com_id=co.com_id AND us.user_id=#{userId}")
	List<Map<String, Object>> findUserId(String userId);
	/**
	 * 查询该商品的出价记录根据出价逆序
	 * @param comId 商品id
	 * @return 订单集合
	 */
	List<AuRecord> findMaxComId(String comId);
	/**
	 * 根据商品id和用户id查询出价记录
	 * @param auRecord 出价记录model
	 * @return 出价记录集合
	 */
	List<AuRecord> findComUser(AuRecord auRecord);
}