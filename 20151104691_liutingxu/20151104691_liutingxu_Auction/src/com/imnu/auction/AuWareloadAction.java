package com.imnu.auction;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.imnu.auction.vo.WareloadVo;
import com.imnu.common.Message;
import com.imnu.common.Page;
import com.imnu.model.AuWareload;
import com.imnu.service.AuWareloadService;


/**
 * 
 * 描述:钱包支出记录Action
 */
@Controller
@RequestMapping("/wareload")
public class AuWareloadAction {
	@Resource
	private AuWareloadService wareloadService;
	
	/**
	 * 查询总行数
	 * @return
	 */
	@RequestMapping("findCount")
	@ResponseBody
	public Page findCount(){
		Page page = new Page();
		Long l = wareloadService.findCount();
		page.setTotalRows(l.intValue());
		return page;
	}
	/**
	 * 查询所有钱包支出记录信息
	 * @return
	 */
	@RequestMapping("queryAll")
	@ResponseBody
	public List<AuWareload> queryAll(AuWareload wareload){
		Page page = new Page();
		if(wareload!=null&&wareload.getCurPage()!=null){
			page.setCurPage(wareload.getCurPage());
		}else{
			page.setCurPage(1);
		}
		return wareloadService.queryAll(wareload,page);
	}
	
	/**
	 * 删除
	 * @param wrId
	 * @return
	 */
	@RequestMapping("delete")
	@ResponseBody
	public Message delete(String wrId){
		Message msg = new Message();
		int rows = wareloadService.deleteByPrimaryKey(wrId);
		if(rows > 0){
			msg.setState(1);
		}else{
			msg.setState(0);
		}
		return msg;
	}
	
	/**
	 * 修改上屏
	 * @return
	 */
	@RequestMapping("findById")
	@ResponseBody
	public AuWareload findById(String wrId){
		return wareloadService.selectByPrimaryKey(wrId);
	}
	/**
	 * 增加或修改
	 * @param wareload
	 * @return
	 */
	@RequestMapping("addOrUpdate")
	@ResponseBody
	public Message addOrUpdate(WareloadVo vo){
		Message msg = new Message();
		int rows = wareloadService.addOrUpdate(vo);
		if(rows > 0){
			msg.setState(1);
		}else{
			msg.setState(0);
		}
		return msg;
	}
	
	@RequestMapping("xfRecord")
	@ResponseBody
	public List<Map<String, Object>> xfRecord(String userId){
		
		return wareloadService.xfRecord(userId);
	}
}
