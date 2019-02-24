package com.imnu.auction;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.imnu.common.Message;
import com.imnu.common.Page;
import com.imnu.common.Tools;
import com.imnu.model.AuType;
import com.imnu.service.AuTypeService;


/**
 * 
 * 描述:类型Action
 */
@Controller
@RequestMapping("/type")
public class AuTypeAction {
	@Resource
	private AuTypeService typeService;
	/**
	 * 查询所有类型
	 * @return
	 */
	@RequestMapping("queryType")
	@ResponseBody
	public List<AuType> queryType(){
		return typeService.queryType();
	}
	/**
	 * 查询所有类型
	 * @return
	 */
	@RequestMapping("queryAll")
	@ResponseBody
	public List<AuType> queryAll(String curPage,AuType type){
		Page page=new Page();
		page.setCurPage(Integer.valueOf(curPage));
		return typeService.queryAll(page,type);
	}
	/**
	 * 根据ID删除类型
	 * @return
	 */
	@RequestMapping("delete")
	@ResponseBody
	public Message delete(String typeId){
		Message msg = new Message();
		int rows = typeService.deleteByPrimaryKey(typeId);
		if(rows > 0){
			msg.setState(1);
		}else{
			msg.setState(0);
		}
		return msg;
	}
	/**
	 * 根据ID查询类型
	 * @return
	 */
	@RequestMapping("findById")
	@ResponseBody
	public AuType findById(String typeId){
		return typeService.selectByPrimaryKey(typeId);
	}
	/**
	 * 增加或修改
	 * @param type
	 * @return
	 */
	@RequestMapping("addOrUpdate")
	public ModelAndView addOrUpdate(@RequestParam(value="typeImg",required = false)MultipartFile file,AuType type,HttpServletRequest request) throws IllegalStateException, IOException{
		ModelAndView mv = new ModelAndView();
		String path = Tools.getRealPath(request, file);
		type.setTypeImage(path);
		
		typeService.addOrUpdate(type);
		mv.setViewName("redirect:/page/reception/index.html");
		return mv;
	}
	
	@RequestMapping("findCount")
	@ResponseBody
	public Page findCount(String curPage){
		int count=typeService.findCount();
		Page page=new Page();
		page.setCurPage(Integer.valueOf(curPage));
		page.setTotalRows(count);
		return page;
	}
	
	@RequestMapping("findAll")
	@ResponseBody
	public List<AuType> findAll(){
		List<AuType> list=typeService.findAll();
		return list;
	}
}
