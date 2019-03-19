package com.bs.sxd.controller;

import java.io.File;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bs.common.utils.Page;
import com.bs.sxd.po.Goods;
import com.bs.sxd.service.GoodsService;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

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
	public String addGoods(Goods goods, String l_name, String l_image, Integer l_price, String l_info, String l_type,
			String l_out_time, String l_in_time, String l_addr, Integer u_id, String year, String month, String day)
			throws Exception {

		
		l_in_time = year + "-" + month + "-" + day;
		System.out.println(u_id);
		l_price = Integer.valueOf(l_price).intValue();

		// 保存数据库的路径
		String sqlPath = null;
		// 定义文件保存的本地路径
		String localPath = "D:\\File\\";
		// 定义 文件名
		String filename = null;
		if (!goods.getFile().isEmpty()) {
			// 生成uuid作为文件名称
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			// 获得文件类型（可以判断如果不是图片，禁止上传）
			String contentType = goods.getFile().getContentType();
			// 获得文件后缀名
			String suffixName = contentType.substring(contentType.indexOf("/") + 1);
			// 得到 文件名
			filename = uuid + "." + suffixName;
			System.out.println(filename);
			// 文件保存路径
			goods.getFile().transferTo(new File(localPath + filename));
		}
		// 把图片的相对路径保存至数据库
		sqlPath = "/images/" + filename;
		int l_static = 1;
		goods.setL_name(l_name);
		goods.setL_price(l_price);
		goods.setL_info(l_info);
		goods.setL_type(l_type);
		goods.setL_out_time(l_out_time);
		goods.setL_in_time(l_in_time);
		goods.setL_addr(l_addr);
		goods.setU_id(u_id);
		goods.setL_image(sqlPath);
		goods.setL_static(l_static);
		// System.out.println(goods);
		goodsService.addGoods(goods);
		return "person";
	}
    //模糊、条件、分页查询
	@RequestMapping(value = "/findgoodslist.action")
	public String list(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "6") Integer rows,
			String l_name, String l_type, Integer l_static, Model model) {
		if(l_name!=null && l_name!=""){
			l_name = "%"+l_name+"%";
		}
		Page<Goods> goods = goodsService.findGoods_yList(page, rows, l_static, l_name, l_type);
		//添加参数
		model.addAttribute("page", goods);
		model.addAttribute("l_name", l_name);
		model.addAttribute("l_static", l_static);
		model.addAttribute("l_type", l_type);
		return "main";
	}

	/*@RequestMapping(value = "/goodslist.action")
	public String goods_showlist(String l_name, String l_type, Integer l_static, Model model) {
		Page<Goods> goods = goodsService.findGoods_yList(page, rows, l_static, l_name, l_type);
		model.addAttribute("page", goods);
		model.addAttribute("l_name", l_name);
		model.addAttribute("l_static", l_static);
		model.addAttribute("l_type", l_type);
		return "main";
	}*/
}
