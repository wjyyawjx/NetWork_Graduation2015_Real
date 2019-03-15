package com.yidu.action;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yidu.domain.Charge;
import com.yidu.domain.JsonMessage;
import com.yidu.service.ChargeService;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

/**
 * <p>
 *  前端控制器
 * </p>

 */
@Controller
@RequestMapping("/charge")
public class ChargeController {
	@Resource
	ChargeService chargeService;
	//Charge charges;
	
	/**
	 * 根据id查询
	 * @param chId
	 * @return
	 */
	@RequestMapping("findById")
	@ResponseBody
	public Charge findById(String chId) {
		return chargeService.findById(chId);
	}
	
	/**
	 * 查询所有
	 * @return
	 */
	@RequestMapping("findall")
	@ResponseBody
	public List<Charge> findAll(){
		List<Charge> list=chargeService.findAll();
		return list;
	}
	
	
	/**
	 * 增加和修改
	 * @param charger
	 * @return
	 */
	@RequestMapping("addandupdate")
	@ResponseBody
	public JsonMessage insertsAndupdate(Charge charger) {
		JsonMessage jm = new JsonMessage();
		int rows = chargeService.addAndUpdate(charger);
		if(rows>0) {
			jm.setState(1);
		}else {
			jm.setState(0);
		}
		return jm;
	}
	
	/**
	 * 删除
	 * @param chId
	 * @return
	 */
	@RequestMapping("deletes")
	@ResponseBody
	public JsonMessage deletes(String chId) {
		JsonMessage jm=new JsonMessage();
		int rows = chargeService.deletes(chId);
		if(rows>0) {
			jm.setState(1);
		}else {
			jm.setState(0);
		}
		return jm;
	}
}



