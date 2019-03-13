package com.yidu.controller;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.yidu.common.Message;
import com.yidu.domain.Overdue;
import com.yidu.service.OverdueService;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author wujie
 * @since 2018-10-18
 */
@Controller
@RequestMapping("/overdue")
public class OverdueController {
	@Resource
	OverdueService service;
	/**
	 * 查询分页的方法
	 * @param toytype
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping("/findAll")
	@ResponseBody
	public Map<String, Object> findAll(Integer page,@RequestParam(value="limit") Integer pageSize,@RequestParam(value="key[overdueTime]",required=false) String overdueTime) throws ParseException {
		//new一个对象
		Overdue us = new Overdue();
		//判断时间不为空
		if(overdueTime!=null) {
			System.err.println("转过来的额是不空");
			//用vo返回时间
			us.setOverdueTimeVo(overdueTime);
		}else {
			System.out.println("转过来的额是空");
			//为空
			us.setOverdueTimeVo("");
		}
		//定义一个map
		HashMap<String , Object> map = new HashMap<>();
		PageInfo<Overdue> list = service.findAll(page,pageSize,us);
		//查询总行数
		map.put("code", 0);
		map.put("msg", "");
		map.put("count",list.getTotal());
		map.put("data", list.getList());
		
		return map;
	}
	/**
	 * 删除的方法
	 * @param toytype
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Message delete(Overdue overdue) {
		//new一个mes对象
		Message message=new Message();
		//定义一个变量
		int rows = service.delete(overdue.getOverdueId());
		//判断大于零则成功否则则失败
		if(rows>0) {
			message.setMsg("删除成功");
		}else {
			message.setMsg("删除失败");
		}
		//返回对象
		return message;
	}
	/**
	 * 根据id查询的方法
	 * @param toytype
	 * @return
	 */
	@RequestMapping("/findById")
	@ResponseBody
	public Overdue findById(Overdue overdue) {
		Overdue toty = service.findById(overdue.getOverdueId());
		return toty;
	}
	
	/**
	 * 增加的方法
	 * @param toytype
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping("/add")
	public Message add(String overdueId,String overdueMoney,String overdueTime) throws ParseException {
		System.out.println("==================ID:"+overdueId+"=========");
		//new一个mes对象
		Message message=new Message();	
		//new一个对象
		Overdue overdue=new Overdue();
		//判断id不为空
		if(overdueId!=null && !"".equals(overdueId)) {
			overdue.setOverdueId(String.valueOf(overdueId));
		}
		//设置费用
		overdue.setOverdueMoney(new BigDecimal(overdueMoney));
		//转换时间类型sim
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
		//设置时间
		overdue.setOverdueTime(dateFormat.parse(overdueTime));
		//定义一个变量
		int rows = service.add(overdue);
		//判断变量大于零
		if(rows>0) {
			message.setMsg("操作成功"); 
		}else {
			message.setMsg("操作失败");
		}
		//返回对象
		return message;
	}
}

