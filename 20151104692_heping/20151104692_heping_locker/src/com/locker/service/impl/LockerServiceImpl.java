package com.locker.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.locker.dao.LockerMapper;
import com.locker.domain.Locker;
import com.locker.service.LockerService;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author wuqi
 * @since 2018-10-17
 */
@Service
public class LockerServiceImpl implements LockerService {
	@Resource
	private LockerMapper locker;
	/**
	 * 查询储物柜表所有
	 */
	@Override
	public List<Locker> selectAll() {
		return locker.selectAll();
	}
	/**
	 * 根据id删除
	 */
	@Override
	public int deleteByPrimaryKey(String loId) {
		return locker.deleteByPrimaryKey(loId);
	}
	/**
	 * 根据名字查询
	 */
	@Override
	public List<Locker> selectByName(String loName) {
		return locker.selectByName("%"+loName+"%");
	}
	/**
	 * 根据id查询
	 */
	@Override
	public Locker selectByPrimaryKey(String loId) {
		return locker.selectByPrimaryKey(loId);
	}
	/**
	 * 增加或修改
	 */
	@Override
	public int addOrUpdate(Locker vo) {
		int rows = 0;
		if(vo.getLoId()!=null && !"".equals(vo.getLoId())) {
			rows = locker.updateByPrimaryKeySelective(vo);
		}else {
			rows = locker.insert(vo);
		}
		return rows;
	}

}
