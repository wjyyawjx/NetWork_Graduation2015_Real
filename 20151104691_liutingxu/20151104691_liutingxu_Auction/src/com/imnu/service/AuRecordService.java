package com.imnu.service;

import java.util.List;
import java.util.Map;

import com.imnu.common.Page;
import com.imnu.model.AuRecord;


/**
 * 出价记录service
 */
public interface AuRecordService {
	/**
	 * 增加出价记录
	 * @param comId 商品id
	 * @param userId 用户id
	 * @param money 金额
	 * @return 0 增加失败 1 增加成功
	 */
	int addRecord(String comId, String userId, String money);
	/**
	 * 根据商品id查询
	 * @param comId 商品id
	 * @return 出价记录的map集合
	 */
	List<Map<String, Object>> findRecord(String comId);
	/**
	 * 查询出价记录排行
	 * @param comId 商品id
	 * @return 出价集合的map集合
	 */
	List<Map<String, Object>> RecordOrder(String comId);
	/**
	 * 查询总行数
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
	 * 查询所有条件查询
	 * @param comName 商品名称
	 * @param userName 用户名
	 * @param reDate 开始时间
	 * @param reTime 截止时间
	 * @param page 当前页数
	 * @return 出价记录集合
	 */
	List<AuRecord> query(String comName, String userName, String reDate, String reTime,Page page);
	/**
	 * 查询行数
	 * @param comName 商品名称
	 * @param userName 用户名
	 * @param reDate 开始时间
	 * @param reTime 截止时间
	 * @return 行数
	 */
	
	int reCount(String comName, String userName, String reDate, String reTime);
	/**
	 * 根据id删除 
	 * @param reId 出价记录id
	 * @return 0 删除失败 1 删除成功
	 */
	int reDelete(String reId);
	/**
	 * 增加或修改
	 * @param auRecord 出价记录model
	 * @return 0 删除失败 1 删除成功
	 */
	int addOrUpdate(AuRecord auRecord);
	/**
	 * 根据id查询
	 * @param reId 订单id
	 * @return 出价记录model
	 */
	AuRecord findById(String reId);
	/**
	 * 根据用户id查询
	 * @param userId 用户id
	 * @return 出价记录map集合
	 */
	List<Map<String, Object>> findUserId(String userId);
	/**
	 * 查询该商品的出价记录根据价格逆序
	 * @param comId 商品id
	 * @return 订单集合
	 */
	List<AuRecord> findMaxComId(String comId);
	/**
	 * 修改
	 * @param record
	 * @return
	 */
	int update(AuRecord record);
	/**
	 * 根据用户id和商品id查询
	 * @param comId 商品id
	 * @param userId  用户id
	 * @return 出价记录集合
	 */
	List<AuRecord> findComUser(String comId, String userId);

}
