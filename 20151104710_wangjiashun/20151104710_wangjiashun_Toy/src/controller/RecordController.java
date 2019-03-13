package com.yidu.controller;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yidu.common.Message;
import com.yidu.common.Tools;
import com.yidu.controller.vo.CarVo;
import com.yidu.controller.vo.CartogramVo;
import com.yidu.controller.vo.RecordVo;
import com.yidu.domain.Payment;
import com.yidu.domain.Record;
import com.yidu.domain.User;
import com.yidu.service.CarService;
import com.yidu.service.PaymentService;
import com.yidu.service.RecordService;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSpinnerUI;
import javax.tools.Tool;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author wujie
 * @since 2018-10-18
 */
@Controller
@RequestMapping("/record")
public class RecordController {
	@Resource
	RecordService recordService;
	@Resource
	PaymentService paymentService;
	@Resource
	CarService carService;
	
	/**
	 * 查询所有
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("findAll")
	public Map<String, Object> findAll(HttpServletRequest request){
		String name = request.getParameter("[key]userName");
		List<RecordVo> list = recordService.findAll();
		int rows = recordService.findCount();
		System.out.println("=========================="+rows);
		Map<String, Object> map = new HashMap<>();
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", rows);
		map.put("data", list);
		return map;
		
	}
	
	
	/**
	 * 提交订单
	 * @param vo
	 * @param session
	 * @return
	 * @throws ParseException
	 */
	@ResponseBody
	@RequestMapping("commit")
	public Message commit(CarVo vo,HttpSession session) throws ParseException {
		int rows =0;
		int rowss = 0;
		System.out.println(vo.getCarEndTime());
		//获取玩具ID数组
		String[] arr = vo.getToyId().split(",");
		
		String[] dates = vo.getCarEndTime().split(",");
		//获取session中的user对象
		User user = (User) session.getAttribute("user");
		//设置日期格式
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//创建一个record对象
		Record record = new Record();
		//循环数组
		for (int i = 0; i < arr.length; i++) {
			//给record时间赋值
			record.setRecordTime(Tools.stringToDate(df.format(new Date())));
			//给record用户ID赋值
			record.setUserId(String.valueOf(user.getUserId()));
			for (int j = 0; j < i+1; j++) {
				//租借时间
				record.setRecordEndTime(Tools.stringToDate(dates[j]));
			}
			//给record玩具ID赋值
			record.setToyId(arr[i]);
			//租赁状态
			record.setRecordState("1");
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			record.setRecordId(uuid);
			
			//如果record对象不为空
			if(record!=null) {
				//添加记录到表中
				rows =  recordService.add(record);
			}
		}
		
		
		
		//创建一个payment对象
		Payment payment = new Payment();
		String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		payment.setPaymentId(uuid);
		//给payment用户ID赋值
		payment.setUserId(String.valueOf(user.getUserId()));
		//给payment时间赋值
		payment.setPaymentTime(Tools.stringToDate(df.format(new Date())));
		//给payment交易金额赋值
		payment.setPaymentMoney(vo.getSum());
		//如果payment对象不为空
		if(payment!=null) {
			//添加支付记录到payment表中
			rowss = paymentService.add(payment);
		}
		//如果record对象和payment对象都添加成功
		if(record!=null&&payment!=null) {
			//将购物车清空
			carService.deleteAll();
		}
		//创建mes对象
		Message mes =  new Message();
		//如果两项都添加成功
		if(rows>0&&rowss>0) {
			mes.setState(1);
			mes.setMsg("提交成功");
		}else {
			mes.setState(0);
			mes.setMsg("提交失败");
		}
		return mes;
	}
	
	@ResponseBody
	@RequestMapping("pieChart")
	public Map<String, Object> pieChart(){
		List<CartogramVo> list = new ArrayList<>();
		Map<String, Object> map = new HashMap<String, Object>();
		
		list = recordService.pieChart();
		
		int[] count = new int[list.size()];
		
		String[] name = new String[list.size()];
		
		int i = 0;
		
		for (CartogramVo cvo : list) {
			count[i] = cvo.getCount();
			name[i] = cvo.getName();
			i++;
		}
		map.put("name", name);
		map.put("count", count);
		
		return map;
		
	}
	
	/**
	 * 根据用户ID查询
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping("findByUserId")
	public List<RecordVo> findByUserId(HttpSession session){
		List<RecordVo> list = null;
		User user = (User) session.getAttribute("user");
		if(user!=null) {
			 list =  recordService.findByUserId(String.valueOf(user.getUserId()));
				if(!list.isEmpty()) {
					return list;
				}
		}
		return null;
	}
	
	/**
	 * 查询租赁记录
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping("selectLeasa")
	public List<RecordVo> selectLeasa(HttpSession session){
		List<RecordVo> list = null;
		User user = (User) session.getAttribute("user");
		if(user!=null) {
			 list =  recordService.selectLease(String.valueOf(user.getUserId()));
				if(!list.isEmpty()) {
					return list;
				}
		}
		return null;
	}
	@ResponseBody
	@RequestMapping("update")
	public Message update(Record record) {
		Message mes = new Message();
		//设置日期格式
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		int rows = 0;

		RecordVo records = recordService.selectByid(record.getRecordId());

		//long timea = df.format();
		long timea = records.getRecordTime().getTime();
		long timeb = records.getRecordEndTime().getTime();
		Date date = new Date();
		long timec = date.getTime();
		System.out.println("开始时间："+timea+"          "+"结束时间："+timeb+"          "+"当前时间："+timec);
		if(timec>timea && timec<timeb) {
			record.setRecordState("2");
			if(record!=null) {
				rows = recordService.update(record);
			}
			if(rows > 0 ) {
				mes.setState(1);
				mes.setMsg("归还成功，未逾期！！！");
			}else {
				mes.setState(0);
				mes.setMsg("归还失败");
			}
		}else {
			record.setRecordState("2");
			long timed =  timec-timeb;
			long timef = (long) Math.ceil(timed/86400000);
			if(timef>0 && timef<=3) {
				record.setOverdueId("1");
				recordService.update(record);
			}else if(timef>3 && timef<=7) {
				record.setOverdueId("2");
				recordService.update(record);
			}else {
				record.setOverdueId("3");
				recordService.update(record);
			}
			if(record!=null) {
				rows = recordService.update(record);
			}
			if(rows > 0 ) {
				mes.setState(1);
				mes.setMsg("归还成功，已逾期"+timef+"天！");
			}else {
				mes.setState(0);
				mes.setMsg("归还失败");
			}
		}
		return mes;
		
	}
}
