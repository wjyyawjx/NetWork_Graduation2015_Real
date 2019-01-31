package com.bs.sxd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bs.common.utils.Page;
import com.bs.sxd.po.Leasedgoods;
import com.bs.sxd.service.LeasedGoodService;

@Controller
public class LeasedGoodController {
	@Autowired
	private LeasedGoodService leasedGoodService;
	@Value("${leasedgoods.l_name}")
	private String L_NAME;
	@RequestMapping(value = "/Leased/list.act")
	public String list(@RequestParam(defaultValue="1")Integer page,
			@RequestParam(defaultValue="12")Integer rows, 
			String l_name,  
			 Model model) {
		// 条件查询所有商品			
		LeasedGoodService commoditys = (LeasedGoodService) leasedGoodService
				.findselectLeasedGoodList(page, rows, l_name);
		//System.out.println(c_name);
		model.addAttribute("page", commoditys);
		// 客户来源
	List<Leasedgoods>c_Type =leasedGoodService.findselectLeasedGoodList(L_NAME);
	
		// 添加参数
		model.addAttribute("l_name", commoditys.getRows());
//		
	return "Main";
	}
	
}
