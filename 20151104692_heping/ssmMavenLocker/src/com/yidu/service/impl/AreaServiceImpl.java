package com.yidu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yidu.dao.AreaMapper;
import com.yidu.domain.Area;
import com.yidu.service.AreaService;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author wuqi
 * @since 2018-10-17
 */
@Service
public class AreaServiceImpl implements AreaService {
	@Resource
	private AreaMapper area;
	/**
	 * 查询地区表所有
	 */
	@Override
	public List<Area> selectAll() {
		List<Area> list = area.selectAll();
		return list;
	}
	/**
	 * 根据id删除地区表
	 */
	@Override
	public int deleteByPrimaryKey(String id) {
		return area.deleteByPrimaryKey(id);
	}
	/**
	 * 根据id查询
	 */
	@Override
	public Area selectByPrimaryKey(String arId) {
		return area.selectByPrimaryKey(arId);
	}
	/**
	 *增加或修改
	 */
	@Override
	public int addOrUpdate(Area vo) {
		int rows = 0;
		if(vo.getArId()!=null && !"".equals(vo.getArId())) {
			rows = area.updateByPrimaryKeySelective(vo);
		}else {
			rows = area.insert(vo);
		}
		return rows;
	}
}
