package com.yidu.service;


import java.util.List;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yidu.domain.Area;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author wuqi
 * @since 2018-10-17
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
