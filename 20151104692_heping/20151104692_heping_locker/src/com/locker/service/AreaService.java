package com.locker.service;


import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.locker.domain.Area;

/**
 * <p>
 *  服务类
 * </p>
 *

 */
public interface AreaService {
	
	/**
	 * 查询地区表所有
	 */
	List<Area> selectAll();

	/**
	 * 根据id删除
	 * @param id
	 */
	int deleteByPrimaryKey(String id);

	/**
	 * 根据id查询
	 * @param arId
	 * @return
	 */
	Area selectByPrimaryKey(String arId);

	/**
	 * 增加或修改
	 * @param vo
	 * @return
	 */
	int addOrUpdate(Area vo);

}
