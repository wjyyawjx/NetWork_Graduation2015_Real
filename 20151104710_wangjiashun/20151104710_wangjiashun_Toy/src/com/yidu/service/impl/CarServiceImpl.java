package com.yidu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yidu.controller.vo.CarVo;
import com.yidu.dao.CarMapper;
import com.yidu.domain.Car;
import com.yidu.service.CarService;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author wujie
 * @since 2018-10-18
 */
@Service
public class CarServiceImpl  implements CarService {
	@Resource
	CarMapper dao;
	
	@Override
	public List<CarVo> selectAll() {
		return dao.selectAll();
	}

	@Override
	public int deleteId(String Id) {
		
		return dao.deleteByPrimaryKey(Id);
	}

	@Override
	public int deleteAll() {
		return dao.deleteAll();
	}

	@Override
	public List<CarVo> selectById(String userName) {
		
		return dao.selectById(userName);
	}

	@Override
	public int addCar(Car vo) {
		return dao.insertSelective(vo);
	}

}
