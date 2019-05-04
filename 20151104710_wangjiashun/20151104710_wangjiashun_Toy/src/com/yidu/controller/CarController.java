package com.yidu.controller;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yidu.common.Message;
import com.yidu.controller.vo.CarVo;
import com.yidu.domain.Address;
import com.yidu.domain.Car;
import com.yidu.domain.User;
import com.yidu.service.CarService;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 王佳顺
 * @since 2018-10-18
 */
@Controller
@RequestMapping("/car")
public class CarController {
	@Resource
	CarService carService;
	
	/**
	 * 查询所有
	 * @return
	 */
	@ResponseBody
	@RequestMapping("selectAll")
	public List<CarVo> selectAll(){
		List<CarVo> list = carService.selectAll();
		return list;
	}
	
	/**
	 * 根据ID删除
	 * @param car
	 * @return
	 */
	@ResponseBody 
	@RequestMapping("deleteById")
	public Message deleteById(Car car) {
		int rows = carService.deleteId(car.getCarId());
		Message mes = new Message();
		if(rows>0) {
			mes.setState(1);
			mes.setMsg("删除成功！");
		}else {
			mes.setState(0);
			mes.setMsg("删除失败！");
		}
		return mes;
	}
	
	/**
	 * 清空购物车
	 * @return
	 */
	@ResponseBody
	@RequestMapping("deleteAll")
	public Message deleteAll() {
		int rows = carService.deleteAll();
		Message mes = new Message();
		if(rows>0) {
			mes.setState(0);
			mes.setMsg("清除成功！！");
		}else if(rows == 0) {
			mes.setState(1);
			mes.setMsg("购物车是空的！");
		}else {
			mes.setState(2);
			mes.setMsg("清除失败！！");
		}
		return mes;
	}
	
	/**
	 * 根据用户ID查询购物车
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping("findById")
	public List<CarVo> findById(HttpSession session){
		User user = (User) session.getAttribute("user");
		if(user!=null) {
			List<CarVo> List = carService.selectById(user.getUserName());
			return List;
		}
		return null;
	}

	@ResponseBody
	@RequestMapping("addCar")
	public Message addCar(HttpSession session,CarVo vo) {
		Message mes = new Message();
		Car car = new Car();
		BeanUtils.copyProperties(vo, car);
		User user = (User) session.getAttribute("user");
		String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		car.setCarId(uuid);
		if(user!=null) {
			car.setUserId(String.valueOf(user.getUserId()));
		}
		int rows = carService.addCar(car);
		if(rows>0) {
			mes.setState(1);
			mes.setMsg("添加成功，请到购物车查看！！！");
		}else{
			mes.setState(0);
			mes.setMsg("添加失败，请重新尝试！！！");
		}
		return mes;
	}
}
