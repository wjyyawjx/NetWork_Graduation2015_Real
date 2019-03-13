package com.bs.sxd.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bs.sxd.po.Goods;

import com.bs.sxd.service.GoodsService;

/**
 * 物品控制器类
 * 
 * @author 孙雪冬
 *
 */
@Controller
public class GoodsController {
	// 依赖注入
		@Autowired
		private GoodsService goodsService;
	@RequestMapping(value = "/addgoods.action", method = RequestMethod.POST)
	public String addGoods(Goods goods, String l_name, String l_image, Integer l_price, String l_info, Integer l_type,
			Date l_out_time, Date l_in_time, String l_addr) {
		System.out.println(l_name);
		//Goods goods = null;
		goods.setL_name(l_name);
		goods.setL_image(l_image);
		goods.setL_price(l_price);
		goods.setL_info(l_info);
		goods.setL_type(l_type);
		goods.setL_out_time(l_out_time);
		goods.setL_in_time(l_in_time);
		goods.setL_addr(l_addr);
		
		
		System.out.println(l_name);
		
		goodsService.addGoods(goods);
		return "login";
		
		
	}
}
