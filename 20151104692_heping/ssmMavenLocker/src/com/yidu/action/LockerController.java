package com.yidu.action;


import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yidu.domain.JsonMessage;
import com.yidu.domain.Locker;
import com.yidu.service.LockerService;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author wuqi
 * @since 2018-10-17
 */
@Controller
@RequestMapping("/locker")
public class LockerController {
	@Resource
	private LockerService locker;
	/**
	 * 查询所有
	 * @return
	 */
	@RequestMapping("selectAll")
	@ResponseBody
	public List<Locker> selectAll(){
		return locker.selectAll();
	}
	/**
	 * 根据id删除
	 * @param loId
	 * @return
	 */
	@RequestMapping("deleteByPrimaryKey")
	@ResponseBody
	public JsonMessage deleteByPrimaryKey(String loId) {
		JsonMessage jm = new JsonMessage();
		int rows = locker.deleteByPrimaryKey(loId);
		if(rows>0) {
			jm.setState(1);
		}else {
			jm.setState(0);
		}
		return jm;
	}
	/**
	 * 根据名字查询
	 * @param loName
	 * @return
	 */
	@RequestMapping("selectByName")
	@ResponseBody
	public List<Locker> selectByName(String loName){
		return locker.selectByName(loName);
	}
	/**
	 * 根据id查询
	 * @return
	 */
	@RequestMapping("selectByPrimaryKey")
	@ResponseBody
	public Locker selectByPrimaryKey(String loId) {
		return locker.selectByPrimaryKey(loId);
	}
	/**
	 * 增加或修改
	 * @return
	 */
	@RequestMapping("addOrUpdate")
	@ResponseBody
	public JsonMessage addOrUpdate(Locker vo) {
		System.out.println("<><><>=="+vo.getLoId()+"=="+vo.getArId()+"==="+vo.getLoName()+"==="+vo.getLoPhone());
		JsonMessage jm = new JsonMessage();
		int rows = locker.addOrUpdate(vo);
		if(rows>0) {
			jm.setState(1);
		}else {
			jm.setState(0);
		}
		return jm;
	}
}

