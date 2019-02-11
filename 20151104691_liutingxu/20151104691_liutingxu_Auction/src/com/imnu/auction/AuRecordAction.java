package com.imnu.auction;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.imnu.common.Page;
import com.imnu.model.AuRecord;
import com.imnu.model.AuUser;
import com.imnu.service.AuRecordService;



/**
 * 出价记录表
 */
@Controller
@RequestMapping("record")
public class AuRecordAction {
	//注入出价记录service
	@Resource
	AuRecordService recordService;
	/**
	 * 增加出价记录表
	 * @param comId 商品id
	 * @param userId 用户id
	 * @param money 金额
	 * @return 0 增加失败 1 增加成功
	 */
	@RequestMapping("addRecord")
	@ResponseBody
	public int addRecord(String comId,String userId,String money) {
		//调用增加成功的方法
		int rows=recordService.addRecord(comId,userId,money);
		return rows;
	}
	/**
	 * 查询出价记录
	 * @param comId 商品id
	 * @return 返回出价记录的map集合
	 */
	@RequestMapping("findRecord")
	@ResponseBody
	public List<Map<String, Object>> findRecord(String comId){
		//根据商品id查询出价记录
		List<Map<String, Object>> list= recordService.findRecord(comId);
		return list;
	}
	/**
	 * 查询出价排行
	 * @param comId 商品id
	 * @return 出价记录的map集合
	 */
	@RequestMapping("RecordOrder")
	@ResponseBody
	public List<Map<String, Object>> RecordOrder(String comId){
		//根据商品id查询根据出价金额逆序
		List<Map<String, Object>> list= recordService.RecordOrder(comId);
		return list;
	}
	/**
	 * 查询记录行数
	 * @return 行数
	 */
	@RequestMapping("findRecordCount")
	@ResponseBody
	public int findRecordCount(String comId) {
		//调用查询行数的方法
		int rows=recordService.findRecordCount(comId);
		return rows;
	}
	
	
	/**
	 * 查询该用户的出价记录
	 * @param comId 商品id
	 * @return 出价记录map集合出价记录
	 */
	@RequestMapping("findUserRecord")
	@ResponseBody
	public List<Map<String, Object>> findUserRecord(String userId){
		//调用根据用户id查询出价记录
		List<Map<String, Object>> list= recordService.findUserRecord(userId);
		return list;
	}
	/**
	 * 查询所有
	 * @param comName 商品名称
	 * @param userName 用户名
	 * @param reDate 开始时间
	 * @param reTime 截止时间
	 * @param curPage 开始页数
	 * @return 出价记录集合
	 */
	@RequestMapping("query")
	@ResponseBody
	public List<AuRecord> query(String comName,String userName,String reDate,String reTime,String curPage){
		Page page=new Page();
		page.setCurPage(Integer.valueOf(curPage));
		page.setRows(3);
		//查询所有
		List<AuRecord> list=recordService.query(comName,userName,reDate,reTime,page);
		return list;
	}
	/**
	 * 查询行数
	 * @param comName 商品名称
	 * @param userName 用户名
	 * @param reDate 开始时间
	 * @param reTime 截止时间
	 * @param curPage 开始页数
	 * @return 总页数
	 */
	@RequestMapping("reCount")
	@ResponseBody
	public int reCount(String comName,String userName,String reDate,String reTime,String curPage){
		//查询总行数
		int rows=recordService.reCount(comName,userName,reDate,reTime);
		Page page=new Page();
		page.setCurPage(Integer.valueOf(curPage));
		page.setRows(3);
		page.setTotalRows(rows);
		return page.getTotalPages();
	}
	/**
	 * 根据id删除
	 * @param reId 出价id
	 * @return 0 删除失败 1 删除成功
	 */
	@RequestMapping("reDelete")
	@ResponseBody
	public int reDelete(String reId) {
		//根据id删除
		int rows=recordService.reDelete(reId);
		return rows;
	}
	/**
	 * 增加或者修改
	 * @param auRecord 出价记录model
	 * @return
	 */
	@RequestMapping("addOrUpdate")
	@ResponseBody
	public int addOrUpdate(AuRecord auRecord) {
		auRecord.setReDate(auRecord.getReDate()+" 00:00:00");
		//增加或者修改
		int rows=recordService.addOrUpdate(auRecord);
		return rows;
	}
	/**
	 * 根据id查询
	 * @param reId 出价记录id
	 * @return 出价记录model
	 */
	@RequestMapping("reUpdate")
	@ResponseBody
	public AuRecord reUpdate(String reId) {
		//根据id查询
		AuRecord auRecord=recordService.findById(reId);
		return auRecord;
	}
	/**
	 * 根据session查询出价记录
	 * @param session 用户登录session
	 * @return 出价记录map集合
	 */
	@ResponseBody
	@RequestMapping("findByIds")
	public List<Map<String, Object>> findByIds(HttpSession session){
		AuUser user=(AuUser) session.getAttribute("user");
		//根据session中保存的用户id查询出价记录
		List<Map<String, Object>> list=recordService.findUserId(user.getUserId());
		return list;
	}
}
