package com.imnu.auction;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.imnu.common.Message;
import com.imnu.model.AuMreload;
import com.imnu.service.AuMrecordService;



/**
 * 保证金记录
 */
@Controller
@RequestMapping("mreload")
public class AuMrecordAction {
	
	@Resource
	AuMrecordService mrecordService;
	
	@RequestMapping("addMrecord")
	@ResponseBody
	public int addMrecord(String comId,String userId,String money) {
		int rows=mrecordService.addMrecord(comId,userId,money);
		return rows;
	}
	
	@RequestMapping("selectMrecord")
	@ResponseBody
	public List<AuMreload> selectMrecord(String comId,String userId){
		List<AuMreload> list=mrecordService.selectMrecord(comId,userId);
		return list;
	}
	
	/**
	 * 增加或修改
	 * @param mrId
	 * @return
	 */
	@RequestMapping("addOrUpdate")
	@ResponseBody
	public Message addOrUpdate(AuMreload mreload){
		Message msg = new Message();
		int rows = mrecordService.addOrUpdate(mreload);
		if(rows > 0){
			msg.setState(1);
		}else{
			msg.setState(0);
		}
		return msg;
	}
	
	/**
	 *	修改上屏 
	 * @param comId
	 * @param userId
	 * @return
	 */
	@RequestMapping("findById")
	@ResponseBody
	public AuMreload findById(String mrId){
		AuMreload mreload = mrecordService.selectByPrimaryKey(mrId);
		return mreload;
	}
	
	/**
	 * 查询所有
	 * @return
	 */
	@RequestMapping("queryAll")
	@ResponseBody
	public List<AuMreload> queryAll(AuMreload mreload){
		return mrecordService.queryAll(mreload);
	}
	/**
	 * 删除
	 * @param mrId
	 * @return
	 */
	@RequestMapping("delete")
	@ResponseBody
	public Message delete(String mrId){
		Message msg = new Message();
		int rows = mrecordService.deleteByPrimaryKey(mrId);
		if(rows > 0){
			msg.setState(1);
		}else{
			msg.setState(0);
		}
		return msg;
	}
}
