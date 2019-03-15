package com.imnu.auction;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.imnu.common.Message;
import com.imnu.common.Page;
import com.imnu.model.AuNotice;
import com.imnu.service.AuNoticerService;


/**
 * 公共表的action
 */
@Controller
@RequestMapping("/AuNotice")
public class AuNoticeAction {

	@Resource
	AuNoticerService noticerService;
	
	/**
	 * 查询显示所有
	 */
	@RequestMapping("findAll")
	@ResponseBody
	public List<AuNotice>findAll(String curPage,AuNotice auNotice){
		Page page=new Page();
		page.setCurPage(Integer.valueOf(curPage));
		return noticerService.findAll(page,auNotice);
	}
	
	
	/**
	 * 根据id删除
	 */
	@RequestMapping("delete")
	@ResponseBody
	public Message delete(String noId){
		Message msg=new Message();
		int rows=noticerService.deleteByPrimaryKey(noId);
		if(rows>0){
			msg.setState(1);
		}else{
			msg.setState(0);
		}
		return msg;
	}
	
	/**
	 * 增加或修改
	 */
	@RequestMapping("addOrUpdate")
	@ResponseBody
	public Message addOrUpdate(AuNotice auNotice){
		Message msg=new Message();
		int rows=noticerService.addOrUpdate(auNotice);
		if(rows>0){
			msg.setState(1);
		}else{
			msg.setState(0);
		}
		return msg;
		
 	}
	
	/**
	 * 根据id查询
	 */
	@RequestMapping("findById")
	@ResponseBody
	public AuNotice findById(String noId){
		return noticerService.findById(noId);
	}
	
	
	
	
	/**
	 * 分页查询总行数
	 */
	@RequestMapping("findCount")
	@ResponseBody
	public Page findCount(String curPage){
		int count=noticerService.findCount();
		Page page=new Page();
		page.setCurPage(Integer.valueOf(curPage));
		page.setTotalRows(count);
		return page;
	}
	
	/**
	 * 根据标题名字查询
	 * @return
	 */
	@RequestMapping("findNotice")
	@ResponseBody
	public List<Map<String, Object>> findNotice(){
		List<Map<String, Object>> list=noticerService.findNotice();
		return list;
	}
	
}
