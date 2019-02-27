package com.locker.service;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.extension.service.IService;
import com.locker.domain.Cabinet;
import com.locker.domain.Charge;
import com.locker.domain.Locker;
import com.locker.domain.Pages;
import com.locker.domain.Record;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author wuqi
 * @since 2018-10-17
 */
public interface CabinetService {

	/**
	 * 模糊查询和查询所有
	 * @param net
	 * @return
	 */
	List<Cabinet> selectAll(Cabinet net,Pages page);
	/**
	 * 根据id删除
	 * @param caId
	 * @return
	 */
	int deleteByPrimaryKey(String caId);
	/**
	 * 查询类型表所有
	 * @return
	 */
	List<Charge> selectAllType();
	/**
	 * 增加和修改
	 * @param bin
	 * @return
	 */
	int addOrUpdate(Cabinet bin);
	/**
	 * 查询行数
	 * @return
	 */
	int count(Cabinet net);
	/**
	 * 查询储物柜所有
	 * @return
	 */
	List<Cabinet> backSelectAll(String arId);
	/**
	 * 可储物的储物柜
	 * @param bin
	 * @return
	 */
	Map<String, Object> backKon(Cabinet bin);
	/**
	 * 查询该储物柜的价格
	 * @param caId
	 * @return
	 */
	Cabinet backTypeCharge(String caId);
	/**
	 * 修改储物柜为满
	 * @param bin
	 */
	int update(Cabinet bin);
	
	List<Cabinet> findByGuiZi();
	
	
	int selectDaguizi(String chId);
	int selectDZXguizi(Cabinet bin, Locker ker);
	Map<String, Object> findTJT();
	
	Cabinet selectAllCNM(String caId);
	
}
