 package com.yidu.controller;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.yidu.common.Pages;
import com.yidu.common.Tools;
import com.yidu.controller.vo.PhotoVo;
import com.yidu.domain.Photo;
import com.yidu.service.PhotoService;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
/**
 * 
* 项目名称：Toy2   
* 类名称：PhotoController   
* 类描述：   
* 创建人：   
* 创建时间：2018年10月22日 下午1:33:32   
* @version
 */
@Controller
@RequestMapping("/photo")
public class PhotoController {
	@Resource
	private PhotoService phoroService;
	

	@RequestMapping("/findAll")
	@ResponseBody
	public Map<String, Object> findAll(Integer page,@RequestParam(value="limit") Integer pageSize,@RequestParam(value="key[photoRemark]",required=false) String Photo) {
		PhotoVo us = new PhotoVo();
		if(Photo==null || "".equals(Photo)) {
			us.setPhotoRemark("");
		}else {
			us.setPhotoRemark(Photo);
		}
		HashMap<String , Object> map = new HashMap<>();
		PageInfo<Photo> list = phoroService.findAll(page,pageSize,us);
		//查询总行数
		map.put("code", 0);
		map.put("msg", "");
		map.put("count",list.getTotal());
		map.put("data", list.getList());
		
		return map;
	}

	
	/**
	 * 显示所有
	 * @param vo
	 * @return
	 */
	@RequestMapping("selectAll")
	@ResponseBody
	public Map<String,Object> selectAll(PhotoVo vo,HttpServletRequest request){
	
		String remark=request.getParameter("key[photoRemark]");
		vo.setPhotoRemark(remark);
		//分页的limit
		String limit = request.getParameter("limit");
		//分页的page
		String layPage = request.getParameter("page");
		//创建工具类Page
		Pages page=new Pages();
		//判断如果limit不等于空且不等于这个空值
		if (limit!=""&&!"".equals(limit)) {
			page.setFirstRows(Integer.valueOf(limit));
		}
		//判断如果layPage不等于空且不等于这个空值
		if (layPage!=""&&!"".equals(layPage)) {
			page.setCurPage(Integer.valueOf(layPage));
		}
		List<Photo> list=phoroService.selectAll(vo);
		//调用分页的方法
		int rows=phoroService.selectCount(vo);
		//创建一个map对象
		Map<String, Object> map=new HashMap<>();
		//map赋值code
		map.put("code", 0);
		//map赋值msg
		map.put("msg", "");
		//map赋值count
		map.put("count", rows);
		//map赋值data
		map.put("data", list);
		return map;
	}
	
	
	
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	@RequestMapping("delete") 
	public String getPages(String photoId){
		 System.out.println(photoId);
		phoroService.deleteByPrimaryKey(photoId);
				
		return "redirect:/pages/Photo/photo.html" ;
	}
	
	
	/**
	 * 增加或者修改
	 * @param file
	 * @param vo
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping("addOrUpdate")
	public ModelAndView addOrUpdate(
				@RequestParam(value = "pic", required = false) 
				MultipartFile file,
				PhotoVo vo,
				HttpServletRequest request) throws IllegalStateException, IOException{
		ModelAndView mv = new ModelAndView();
		System.out.println(1111);
		//将图片保存到upload文件夹,并且返回一个新的文件地址
		String path = Tools.getRealPath(request, file);
		
		vo.setPhotoPath(path);
		System.err.println(path);
		vo.setPhotoRemark(vo.getPhotoRemark());
		
		phoroService.addOrUpdate(vo);
		
		mv.setViewName("redirect:/pages/Photo/photo.html");
		return mv ;
		
	}
	/**
	 * 根据ID找到flower对象
	 * @return
	 */
	@RequestMapping("findById") 
	@ResponseBody
	public PhotoVo findById(String id){
 
		PhotoVo vo = phoroService.selectByPrimaryKey(id);
		
		return vo ;
	}
	

}

