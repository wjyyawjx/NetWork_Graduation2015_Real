package com.bs.sxd.controller;

import java.io.File;

import java.util.Date;
import java.util.UUID;

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
	public String addGoods(Goods goods, String l_name, String l_image, Integer l_price, String l_info, String l_type,
			String l_out_time, Date l_in_time, String l_addr,Integer u_id) throws Exception {
		System.out.println(l_name);
		l_price = Integer.valueOf(l_price).intValue();
		 //保存数据库的路径  
        String sqlPath = null;   
        //定义文件保存的本地路径  
        String localPath="D:\\File\\";  
        //定义 文件名  
        String filename=null;    
        if(!goods.getFile().isEmpty()){    
            //生成uuid作为文件名称    
            String uuid = UUID.randomUUID().toString().replaceAll("-","");    
            //获得文件类型（可以判断如果不是图片，禁止上传）    
            String contentType=goods.getFile().getContentType();    
            //获得文件后缀名   
            String suffixName=contentType.substring(contentType.indexOf("/")+1);  
            //得到 文件名  
            filename=uuid+"."+suffixName;   
            System.out.println(filename);  
            //文件保存路径  
            goods.getFile().transferTo(new File(localPath+filename));    
        }  
        //把图片的相对路径保存至数据库  
        sqlPath = "/images/"+filename;  
        System.out.println(sqlPath);  
       
        goods.setL_name(l_name);
        //goods.setL_image(l_image);
  		goods.setL_price(l_price);
  		goods.setL_info(l_info);
  		goods.setL_type(l_type);
  		goods.setL_out_time(l_out_time);
  		goods.setL_in_time(l_in_time);
  		goods.setL_addr(l_addr);
  		goods.setU_id(u_id);
        goods.setL_image(sqlPath); 
        System.out.println(goods);
        goodsService.addGoods(goods);
     
        return "person";

	    }  
	
}
