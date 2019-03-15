package com.locker.action;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.HttpServletBean;

import com.mysql.fabric.xmlrpc.base.Array;
import com.locker.domain.Cabinet;
import com.locker.domain.Charge;
import com.locker.domain.JsonMessage;
import com.locker.domain.Locker;
import com.locker.domain.Pages;
import com.locker.domain.Record;
import com.locker.domain.User;
import com.locker.service.CabinetService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

/**
 * <p>
 *  前端控制器
 * </p>
 *

 */
@Controller
@RequestMapping("/cabinet")
public class CabinetController {
	@Resource
	private CabinetService cabinet;
	
	
	@RequestMapping("selectAllCNM")
	@ResponseBody
	public Cabinet selectAllCNM(String caId) {
		return cabinet.selectAllCNM(caId);
	}
	
	/**
	 * 每楼的大中小储物柜统计图
	 * @param chId
	 * @param arId
	 * @return
	 */
	@RequestMapping("selectDZXguizi")
	@ResponseBody
	public int selectDZXguizi(Cabinet bin,Locker ker) {
		return cabinet.selectDZXguizi(bin,ker);
	}
	
	@RequestMapping("findTJT")
	@ResponseBody
	public Map<String, Object> findTJT(){
		Map<String, Object> map=cabinet.findTJT();
		
		return map;
		
		
	}
	
	
	/**
	 * 根据储物柜类型查询储物柜满了的数量
	 * @param chId
	 * @return
	 */
	@RequestMapping("selectDaguizi")
	@ResponseBody
	public int selectDaguizi(String chId) {
		System.err.println("err"+cabinet.selectDaguizi(chId));
		return cabinet.selectDaguizi(chId);
	}
	
	
	/**
	 * 查询所有
	 * @return
	 */
	@RequestMapping("findByGuiZi")
	@ResponseBody
	public List<Cabinet> findByGuiZi(){
		return cabinet.findByGuiZi();
	}
	
	/**
	 * 查询该储物柜的价格
	 * @param caId
	 * @return
	 */
	@RequestMapping("backTypeCharge")
	@ResponseBody
	public Cabinet backTypeCharge(String caId) {
		return cabinet.backTypeCharge(caId);
	}
	
	
	/**
	 * 可储物的储物柜
	 * @return
	 */
	@RequestMapping("backKon")
	@ResponseBody
	public Map<String,Object> backKon(Cabinet bin){
		Map<String,Object> map = cabinet.backKon(bin);
		return map;
	}
	
	/**
	 * session里面是否为空
	 * @param session
	 * @return
	 */
	@RequestMapping("backSession")
	@ResponseBody
	public JsonMessage backSession(HttpSession session) {
		JsonMessage jm = new JsonMessage();
		User user = (User) session.getAttribute("useryh");
		if(user!=null) {
			jm.setState(1);
		}else {
			jm.setState(0);
		}
		return jm;
	}
	
	/**
	 * 查询储物柜所有
	 * @return
	 */
	@RequestMapping("backSelectAll")
	@ResponseBody
	public List<Cabinet> backSelectAll(String arId){
		return cabinet.backSelectAll(arId);
	}
	
	/**
	 * 查询储物柜表所有和模糊查询
	 * @return
	 */
	@RequestMapping("selectAll")
	@ResponseBody
	public List<Cabinet> selectAll(Cabinet net,Pages page){
		return cabinet.selectAll(net,page);
	}
	/**
	 * 根据id删除
	 * @param caId
	 * @return
	 */
	@RequestMapping("deleteByPrimaryKey")
	@ResponseBody
	public JsonMessage deleteByPrimaryKey(String caId) {
		JsonMessage jm = new JsonMessage();
		int rows = cabinet.deleteByPrimaryKey(caId);
		if(rows>0) {
			jm.setState(1);
		}else {
			jm.setState(0);
		}
		return jm;
	}
	/**
	 * 查询储物柜类型
	 * @return
	 */
	@RequestMapping("selectAllType")
	@ResponseBody
	public List<Charge> selectAllType(){
		return cabinet.selectAllType();
	}
	/**
	 * 增加和修改
	 * @param bin
	 * @return
	 */
	@RequestMapping("addOrUpdate")
	@ResponseBody
	public JsonMessage addOrUpdate(Cabinet bin) {
		JsonMessage jm = new JsonMessage();
		int rows = cabinet.addOrUpdate(bin);
		if(rows>0) {
			jm.setState(1);
		}else {
			jm.setState(0);
		}
		return jm;
	}
	
	@RequestMapping("count")
	@ResponseBody
	public Pages count(Cabinet net) {
		Pages page = new Pages();
		page.setTotalRows(cabinet.count(net));
		return page;
	}
}






















