package com.yidu.service;

import java.util.List;

import com.yidu.controller.vo.CarVo;
import com.yidu.domain.Car;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 王佳顺
 * @since 2018-10-18
 */
public interface CarService {
	public List<CarVo> selectAll();
	
	int deleteId(String Id);
	
	int deleteAll();
	
	List<CarVo> selectById(String userName);
	
	int addCar(Car vo);
}
