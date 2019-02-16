package com.imnu.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;

import com.imnu.common.Page;
import com.imnu.model.AuIndent;



/**
 * 订单的service接口
 */
public interface AuIndentService {
	/**
	 * 查询数据
	 * @param inName 订单名
	 * @param inDate 开始时间
	 * @param inTime 截止时间
	 * @param page  开始页数
	 * @return 订单集合
	 */
	public List<AuIndent> query(String comName, String inDate, String inTime, Page page);
	/**
	 * 根据id删除的方法
	 * @param inId 订单id
	 * @return 0 删除失败 1 删除成功
	 */
	public int inDelete(String inId);
	/**
	 * 根据条件查询行数
	 * @param comName 商品名称
	 * @param inDate 开始时间
	 * @param inTime 截止时间
	 * @return 行数
	 */
	public int inCount(String comName, String inDate, String inTime);
	/**
	 * 增加或修改的方法
	 * @param auIndent 出价记录model
	 * @return 0 修改失败 1 修改成功
	 */
	public int addOrUpdate(AuIndent auIndent);
	/**
	 * 根据id查询
	 * @param inId 订单id
	 * @return 订单model
	 */
	public AuIndent findById(String inId);
	
	public List<Map<String, Object>> selectUser(String userId);
	/**
	 * 增加
	 * @param indent
	 * @return 0 增加失败 1 增加成功
	 */
	public int insert(AuIndent indent);
	/**
	 * 根据订单id修改状态
	 * @param inId 订单id
	 * @param state 状态
	 * @return 0 修改失败 1 修改成功
	 */
	public int updateState(String inId,String state,HttpSession session);
	/**
	 * 根据id修改状态
	 * @param inId 订单id
	 * @return 0 修改失败 1 修改成功
	 */
	public int findState(String inId);
	/**
	 * 根据id修改状态
	 * @param inId 订单id
	 * @return 0 修改失败 1 修改成功
	 */
	public int findStates(String inId);
	/**
	 * 查询统计图数据
	 * @return 返回每个月竞拍的最高价
	 */
	public List<String>  selectTjt();
	

}
