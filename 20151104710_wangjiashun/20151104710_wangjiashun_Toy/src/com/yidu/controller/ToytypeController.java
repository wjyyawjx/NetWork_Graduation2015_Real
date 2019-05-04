package com.yidu.controller;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.yidu.common.Message;
import com.yidu.domain.ToyType;
import com.yidu.service.ToytypeService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

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
@RequestMapping("/toytypes")
public class ToytypeController {
	@Resource
	ToytypeService service;
	/**
	 * 查询分页的方法
	 * @param toytype
	 * @return
	 */
	@RequestMapping("/findAll")
	@ResponseBody
	public Map<String, Object> findAll(Integer page,@RequestParam(value="limit") Integer pageSize,@RequestParam(value="key[typeName]",required=false) String user) {
		//new一个对象
		ToyType us = new ToyType();
		//判断对象等于空
		if(user==null || "".equals(user)) {
			us.setTypeName("");
		}else {
			us.setTypeName(user);
		}
		//定义一个map
		HashMap<String , Object> map = new HashMap<>();
		//用pageinfo接受findAll方法
		PageInfo<ToyType> list = service.findAll(page,pageSize,us);
		//查询总行数
		map.put("code", 0);
		map.put("msg", "");
		map.put("count",list.getTotal());
		map.put("data", list.getList());
		//返回对象
		return map;
	}
	/**
	 * 删除的方法
	 * @param toytype
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Message delete(ToyType toytype) {
		Message message=new Message();
		int rows = service.delete(toytype.getTypeId());
		if(rows>0) {
			message.setMsg("删除成功");
		}else {
			message.setMsg("删除失败");
		}
		return message;
	}
	/**
	 * 增加的方法
	 * @param toytype
	 * @return
	 */
	@RequestMapping("/add")
	@ResponseBody
	public Message add(ToyType toytype) {
		System.out.println("==================ID:"+toytype.getTypeId()+"=========");
		//new一个me对象
		Message message=new Message();
		
		//定义一个r对象
		int rows = service.add(toytype);
		//判断大于零则成功不然则失败
		if(rows>0) {
			message.setMsg("操作成功");
		}else {
			message.setMsg("操作失败");
		}
		//返回之前的对象
		return message;
	}
	/**
	 * 根据id查询的方法
	 * @param toytype
	 * @return
	 */
	@RequestMapping("/findById")
	@ResponseBody
	public ToyType findById(ToyType toytype) {
		ToyType toty = service.findById(toytype.getTypeId());
		return toty;
	}
}

