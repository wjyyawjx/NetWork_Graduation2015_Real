package com.imnu.auction;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.imnu.model.AuCommodity;
import com.imnu.service.AuCommodityService;



/**
 * 商品详情
 */
@Controller
@RequestMapping("/detail")
public class AuDetailAction {
	/**
	 * 注入商品service
	 */
	@Resource
	AuCommodityService commodityService;
	
	/**
	 * 根据id查询
	 * @param comId 商品id
	 * @return 商品model对象
	 */
	@RequestMapping("findById")
	@ResponseBody
	public AuCommodity findById(String comId) {
		return commodityService.findById(comId);
	}
}
