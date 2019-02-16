package com.imnu.auction;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.imnu.common.Page;
import com.imnu.model.AuIndent;
import com.imnu.service.AuIndentService;



/**
 * 订单表的action
 */
@Controller
@RequestMapping("/auindent")
public class AuIndentAction {
	//注入订单service
	@Resource
	AuIndentService service;
	
	/**
	 * 查询所有
	 * @param comName 商品名称
	 * @param inDate 开始时间
	 * @param inTime 截止时间
	 * @param curPage 当前页数
	 * @return list 订单集合
	 */
	@ResponseBody
	@RequestMapping("query")
	public List<AuIndent> query(String comName,String inDate,String inTime,String curPage){
		Page page=new Page();
		page.setCurPage(Integer.valueOf(curPage));
		page.setRows(5);
		//调用查询所有的方法
		return service.query(comName,inDate,inTime,page);
	}
	/**
	 * 根据订单id删除
	 * @param inId 订单id
	 * @return 0 删除失败 1删除成功
	 */
	@ResponseBody
	@RequestMapping("inDelete")
	public int inDelete(String inId) {
		//调用根据id删除的方法
		int rows=service.inDelete(inId);
		return rows;
	}
	
	/**
	 * 根据条件查询行数
	 * @param comName 商品名称
	 * @param inDate 开始时间
	 * @param inTime 截止时间
	 * @param curPage 当前页数
	 * @return 总页数
	 */
	@ResponseBody
	@RequestMapping("inCount")
	public int inCount(String comName,String inDate,String inTime,String curPage) {
		Page page=new Page();
		page.setCurPage(Integer.valueOf(curPage));
		page.setRows(5);
		//调用根据条件查询行数的方法
		int rows=service.inCount(comName,inDate,inTime);
		page.setTotalRows(rows);
		return page.getTotalPages();
	}
	/**
	 * 增加或修改
	 * @param auIndent 订单对象
	 * @return 增加或修改成功
	 */
	@ResponseBody
	@RequestMapping("addOrUpdate")
	public int addOrUpdate(AuIndent auIndent) {
		//调用增加或修改的方法
		int rows=service.addOrUpdate(auIndent);
		return rows;
		
	}
	/**
	 * 根据id查询订单
	 * @param inId 订单id
	 * @return 订单model
	 */
	@ResponseBody
	@RequestMapping("findById")
	public AuIndent findById(String inId) {
		//调用根据订单查询的对象
		AuIndent indent=service.findById(inId);
		return indent;
	}
	/**
	 * 根据用户id查询订单
	 * @param userId 用户id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("selectUser")
	public List<Map<String, Object>> selectUser(String userId){
		List<Map<String, Object>> list=service.selectUser(userId);
		return list;
	}
	/**
	 * 根据订单id根据订单状态
	 * @param inId 订单id
	 * @param state 状态 
	 * @return 0 修改失败 1 修改成功
	 */
	@RequestMapping("updateState")
	@ResponseBody
	public int updateState(String inId,String state,HttpSession session) {
		System.out.println("////////////////"+inId);
		//调用根据id修改状态的方法
		int rows=service.updateState(inId,state, session);
		return rows;
	}
	/**
	 * 根据id修改状态
	 * @param inId 订单id
	 * @return 0 修改失败 1 修改成功
	 */
	@RequestMapping("findState")
	@ResponseBody
	public int findState(String inId) {
		//调用根据id修改状态的方法
		int rows=service.findState(inId);
		return rows;
	}
	/**
	 * 根据id修改状态
	 * @param inId 订单id
	 * @return 0 修改失败 1 修改成功
	 */
	@RequestMapping("findStates")
	@ResponseBody
	public int findStates(String inId) {
		//调用根据id修改状态的方法
		int rows=service.findStates(inId);
		return rows;
	}
	/**
	 * 查询统计提
	 * @return 返回每个月竞拍的最高价
	 */
	@RequestMapping("selectTjt")
	@ResponseBody
	public List<String>  selectTjt(){
		return service.selectTjt();
	}
}
