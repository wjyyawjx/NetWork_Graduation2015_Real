package com.yidu.controller;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.yidu.common.Message;
import com.yidu.domain.Address;
import com.yidu.domain.User;
import com.yidu.service.AddressService;
import com.yidu.service.UserService;

import java.util.HashMap;
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
 * @author 王佳顺
 * @since 2018-10-18
 */
@Controller
@RequestMapping("/address")
public class AddressController {

	@Resource
	AddressService service;
	/**
	 * 条件查询，查询所有，分页 
	 * @param page 开始的行数
	 * @param pageSize 总页数
	 * @param user 后台查询转过来的用户名
	 * @param addressDetails 后台查询转过来的详情地址
	 * @param selectFind 后台查询转过来的区域
	 * @return Map类型
	 */
	@RequestMapping("/findAll")
	@ResponseBody
	public Map<String, Object> findAll(Integer page,@RequestParam(value="limit") Integer pageSize,@RequestParam(value="key[userName]",required=false) String user,@RequestParam(value="key[addressXq]",required=false) String addressDetails,@RequestParam(value="key[selectFind]",required=false) String selectFind) {
		//新建一个地址类
		Address address = new Address();
		//判断后台查询转过来的userName是否为空
		if(user==null || "".equals(user)) {
			address.setUserName("");
		}else {
			address.setUserName(user);
		}
		//判断后台查询转过来的详情地址是否为空
		if(addressDetails==null || "".equals(addressDetails)) {
			address.setAddressDetails("");
		}else {
			address.setAddressDetails(addressDetails);
		}
		//判断后台查询转过来的区域是否为空
		if( selectFind==null || "".equals(selectFind) || "请选择,".equals(selectFind)) {
			address.setAddressName("");
		}else {
			System.out.println("赋值："+selectFind);
			address.setAddressName(selectFind);
		}
		//new 一个map
		HashMap<String , Object> map = new HashMap<>();
		//获取查询的值 PageInfo接受
		PageInfo<Address> list = service.findAll(page,pageSize,address);
		
		//添加到map
		map.put("code", 0);
		map.put("msg", "");
		map.put("count",list.getTotal());
		map.put("data", list.getList());
		return map;
	}
	
	/**
	 * 删除的方法
	 * @param address 地址对象
	 * @return 一个Message工具类 
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Message delete(Address address) {
		//创建一个工具类
		Message message=new Message();
		//调用地址service删除的方法
		int rows=service.delete(address.getAddressId());
		if(rows>0) {
			message.setMsg("删除成功");
		}else{
			message.setMsg("删除失败");
		}
		
		return message;
	}
	/**
	 * 增加和修改
	 * @param address 地址对象
	 * @return 一个Message工具类
	 */
	@RequestMapping("/insertUpdate")
	@ResponseBody
	public Message insertUpdate(Address address) {
		Message mes=new Message();
		//调用地址service增加和修改
		int rows = service.insertorUpdate(address);
		if(rows>0) {
			mes.setState(1);
			mes.setMsg("操作成功");
		}
		
		return mes;
	}
	/**
	 * 前台增加地址的方法
	 * @param address 地址对象
	 * @return 一个Message工具类
	 */
	@RequestMapping("/addAddress")
	@ResponseBody
	public Message addOrUpdateAddress(Address address) {
		Message mes=new Message();
		//调用地址service增加的方法
		int insert = service.insert(address);
		if(insert>0) {
				mes.setState(0);
				mes.setMsg("操作成功！");
		}
		return mes;
	}
	/**
	 * 通过地址id查询出地址对象
	 * @param addressId 地址id
	 * @return 一个地址对象
	 */
	@RequestMapping("/selectId")
	@ResponseBody
	public Address selectId(String addressId) {
		Address address = service.selectId(addressId);
		System.out.println("id："+address.getAddressId()+"配送地址："+address.getAddressName());
		return address;
	}
	/**
	 * 显示前台地址页面的方法
	 * @param session
	 * @return 返回一个地址集合
	 */
	@RequestMapping("/show")
	@ResponseBody
	public List<Address> showList(HttpSession session) {
		//获取存放在session中的用户对象
		User users = (User) session.getAttribute("user");
		System.out.println("得到session"+users);
		List<Address> list=null;
		//判断用户是否为空
		if(users!=null) {
			String userId = users.getUserId();
			list= service.selectAll(userId);
			System.out.println("获得的集合"+list);
		}
		return list;
	}
}

