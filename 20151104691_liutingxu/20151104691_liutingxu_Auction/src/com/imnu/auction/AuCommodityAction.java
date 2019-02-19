package com.imnu.auction;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.imnu.auction.vo.CommodityVo;
import com.imnu.common.Message;
import com.imnu.common.Page;
import com.imnu.common.Tools;
import com.imnu.model.AuCommodity;
import com.imnu.model.AuIndent;
import com.imnu.model.AuRecord;
import com.imnu.model.AuUser;
import com.imnu.model.AuWallet;
import com.imnu.service.AuCommodityService;
import com.imnu.service.AuIndentService;
import com.imnu.service.AuRecordService;
import com.imnu.service.AuWalletService;
import com.imnu.service.AuWareloadService;


/**
 * 
 * 描述:商品Action
 */
@Controller
@RequestMapping("/commodity")
public class AuCommodityAction {
	@Resource
	private AuCommodityService commodityService;
	
	@Resource
	AuRecordService recordService;
	
	@Resource
	AuIndentService indentService;
	
	@Resource
	AuWalletService walletService;
	
	@Resource
	AuWareloadService wareloadService;
	/**
	 * 查询
	 * @return
	 */
	@RequestMapping("queryCom")
	@ResponseBody
	public List<AuCommodity> queryCom(){
		return commodityService.queryCom();
	}
	
	@RequestMapping("findAlls")
	@ResponseBody
	public List<AuCommodity> findAlls(){
		return commodityService.findAlls();
	}
	
	/**
	 * 查询所有商品
	 * @return 商品集合
	 */
	@RequestMapping("queryAll")
	@ResponseBody
	public List<AuCommodity> queryAll(CommodityVo vo){
		Page page = new Page();
		if(vo!=null&&vo.getCurPage()!=null){
			page.setCurPage(vo.getCurPage());
		}else{
			page.setCurPage(1);
		}
		return commodityService.queryAll(vo,page);
	}
	
	/**
	 * 根据ID删除商品
	 * @param comId 商品ID
	 * @return 信息类
	 */
	@RequestMapping("delete")
	@ResponseBody
	public Message delete(String comId){
		Message msg = new Message();
		int row = commodityService.delete(comId);
		if(row > 0){
			msg.setState(1);
		}else{
			msg.setState(0);
		}
		return msg;
	}
	/**
	 * 增加或修改
	 * @param file
	 * @param vo
	 * @param request
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping("addOrUpdate")
	public ModelAndView addOrUpdate(@RequestParam(value="comPhoto",required = false)MultipartFile file,CommodityVo vo,HttpServletRequest request) throws IllegalStateException, IOException{
			ModelAndView mv = new ModelAndView();
			String path = Tools.getRealPath(request, file);
			vo.setComImage(path);
			commodityService.addOrUpdate(vo);
			mv.setViewName("redirect:/page/reception/index.html");
		return mv;
	}
	
	/**
	 * 根据Id 查询商品
	 * @param id	商品ID
	 * @return	商品VO对象
	 */
	@RequestMapping("findById") 
	@ResponseBody
	public CommodityVo findById(String comId){
		CommodityVo vo = commodityService.selectByPrimaryKey(comId);
		return vo;
	}
	/**
	 * 查询总行数
	 * @return
	 */
	@RequestMapping("findRows")
	@ResponseBody
	public Page findRows(CommodityVo vo){
		Page page = new Page();
		Long l = commodityService.findCount(vo);
		page.setTotalRows(l.intValue());
		return page;
	}
	
	@RequestMapping("addCom")
	@ResponseBody
	public int addCom(AuCommodity auCommodity,String [] phpImage,HttpServletRequest request,HttpSession session) throws IllegalStateException, IOException {
		AuUser user=(AuUser) session.getAttribute("user");
		auCommodity.setUserId(user.getUserId());
		auCommodity.setComImage("upload/"+phpImage[0]);
		
		auCommodity.setComState((long) 0);
		
		int rows=commodityService.addCom(auCommodity,phpImage);
		return rows;
	}
	
	/**
	 * 竞拍时间倒计时的方法
	 * @param dates 开始时间
	 * @param time 结束时间
	 * @param comId 商品id
	 * @param session httpSession
	 * @return 2 竞拍还没有开始 3 竞拍开始 5 该商品没有人进行竞拍  1竞拍已经结束 4 竞拍进行中
	 * @throws ParseException
	 */
	@RequestMapping("findDate")
	@ResponseBody
	public int findDate(String dates,String time,String comId,HttpSession session) throws ParseException {
		//得到当前时间
		String date=Tools.getCurDateTime();
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		//将得到的字符串转换为date类型
		Date date2=dateFormat.parse(date);
		
		//定义结束时间的对象
		Date time2=null;
		//定义开始时间的对象
		Date dates2=null;
		if(time!=null && time!="") {
			//将结束时间赋值
			time2=dateFormat.parse(time);
		}
		if(dates!=null && dates!="") {
			//将开始时间赋值
			dates2=dateFormat.parse(dates);
		}
		//如果开始时间大于当前时间
		if(dates2.getTime()>date2.getTime()) {
			System.out.println("==================================2");
			return 2;
		//如果开始时间等于当前时间
		}else if(dates2.getTime()==date2.getTime()) {
			return 3;
		//如果结束时间等于当前时间
		}else if(date2.getTime()==time2.getTime()) {
			//增加订单表
			System.out.println("==================================0");
			//根据商品id查询出价记录表
			List<AuRecord> list=recordService.findMaxComId(comId);
			if(list.size()==0) {
				return 5;
			}
			//得到最大的竞拍者
			AuRecord record=list.get(0);
			//将数据封装
			AuIndent indent=new AuIndent();
			indent.setComId(comId);
			indent.setInDate(Tools.getCurDateTime());
			indent.setUserId(record.getUserId());
			indent.setInMoney(record.getReMoney());
			indent.setInState("0");
			//增加订单表
			indentService.insert(indent);
			
			/*record.setReState((long) 2);
			//修改出价记录最高的为得标者
			recordService.update(record);*/
			//创建商品对象
			AuCommodity auCommodity=new AuCommodity();
			auCommodity.setComId(comId);
			auCommodity.setComState((long) 2);
			//调用商品根据id修改的方法
			int com=commodityService.updateByPrimaryKeySelective(auCommodity);
			if(com==1) {
				System.out.println("===============将商品下架成功===============");
			}
			//将过期的商品出价记录修改为不可用
			for (int i = 0; i <list.size(); i++) {
				//将所有的出价记录状态改为2
				list.get(i).setReState((long) 2);
				//调用修改出价记录表的方法
				recordService.update(list.get(i));
				//如果不是最高的出价记录 并且该出价的用户不等于出价最高的用户
				if(i!=0 && list.get(i).getUserId()!=list.get(1).getUserId() && list.get(i).getUserId().equals(list.get(1).getUserId())) {
					//竞拍失败的用户退还保证金
					AuUser user=(AuUser) session.getAttribute("user");
					
					
					//调用根据用户id和保证金模糊查询的方法
					AuWallet auWallet=walletService.findWallet(user.getUserId());
					System.out.println("========================="+auWallet.getUserId()+"========="+auWallet.getWrMoney());
					
					//修改钱包余额
					//将数据封装
					AuWallet wallet=walletService.selectWallet(auWallet);
					System.out.println("-------------"+wallet.getWaBalance()+"-------"+auWallet.getWrMoney());
					wallet.setWaBalance(new BigDecimal(wallet.getWaBalance().intValue()+Integer.valueOf(auWallet.getWrMoney())));
					//调用修改钱包余额和增加钱包记录的方法
					int rows=walletService.update(wallet,auWallet);
					/*//添加钱包记录表
					System.out.println("=============增加钱包记录表=============");
					AuWareload auWareload=new AuWareload();
					auWareload.setWaId(wallet.getWaId());
					auWareload.setWrMoney(new BigDecimal(auWallet.getWrMoney()));
					auWareload.setWrDate(Tools.getCurDateTime());
					auWareload.setWrContent("将竞拍失败的用户退还金额"+auWallet.getWrMoney()+"元");
					int b=wareloadService.insert(auWareload);
					if(b==1) {
						System.out.println("***************钱包记录增加成功");
					}*/
				}
			}
			
			return 0;
		//当前时间大于截止时间
		}else if(date2.getTime()>time2.getTime()) {
			System.out.println("==================================1");
			//竞拍已经结束
			return 1;
		//竞拍进行中
		}else {
			System.out.println("==================================4");
			return 4;
		}
		
	}
	
	
	@RequestMapping("findState")
	@ResponseBody
	public int findState(String comId) {
		return commodityService.findState(comId);
	}
	
	@RequestMapping("comUser")
	@ResponseBody
	public List<Map<String, Object>> comUser(String userId){
		
		return commodityService.comUser(userId);
	}
	
	/**
	 * 直接购买
	 * @return
	 */
	@RequestMapping("zhijieMoney")
	@ResponseBody
	public int zhijieMoney(String userId,String comId,String money,HttpSession session) {
//		System.err.println("-------------------减少用户钱包金额----------------------");
//		AuWallet auw=new AuWallet();
//		auw.setUserId(userId);
//		AuWallet auwa=walletService.selectWallet(auw);
//		System.err.println(auwa.getWaBalance()+"*****"+money);
//		auwa.setWaBalance(new BigDecimal(auwa.getWaBalance().intValue()-Double.valueOf(money)));
//		walletService.updateBy(auwa);
		
		//增加订单表
		System.out.println("==================================0");
		//根据商品id查询出价记录表
		List<AuRecord> list=recordService.findMaxComId(comId);
		
		//将数据封装
		AuIndent indent=new AuIndent();
		indent.setComId(comId);
		indent.setInDate(Tools.getCurDateTime());
		indent.setUserId(userId);
		indent.setInMoney(new BigDecimal(money));
		indent.setInState("0");
		//增加订单表
		indentService.insert(indent);
		
		/*record.setReState((long) 2);
		//修改出价记录最高的为得标者
		recordService.update(record);*/
		//创建商品对象
		AuCommodity auCommodity=new AuCommodity();
		auCommodity.setComId(comId);
		auCommodity.setComState((long) 2);
		auCommodity.setComTime(Tools.getCurDateTime());
		//调用商品根据id修改的方法
		int com=commodityService.updateByPrimaryKeySelective(auCommodity);
		if(com==1) {
			System.out.println("===============将商品下架成功===============");
		}
		//将过期的商品出价记录修改为不可用
		for (int i = 0; i <list.size(); i++) {
			//将所有的出价记录状态改为2
			list.get(i).setReState((long) 2);
			//调用修改出价记录表的方法
			recordService.update(list.get(i));
			//如果不是最高的出价记录 并且该出价的用户不等于出价最高的用户
			if(i!=0 && list.get(i).getUserId()!=list.get(1).getUserId() && list.get(i).getUserId().equals(list.get(1).getUserId()) && list.get(i).getUserId()!=userId && userId.equals(list.get(i).getUserId())) {
				//竞拍失败的用户退还保证金
				AuUser user=(AuUser) session.getAttribute("user");
				
				
				//调用根据用户id和保证金模糊查询的方法
				AuWallet auWallet=walletService.findWallet(user.getUserId());
				System.out.println("========================="+auWallet.getUserId()+"========="+auWallet.getWrMoney());
				
				//修改钱包余额
				//将数据封装
				AuWallet wallet=walletService.selectWallet(auWallet);
				System.out.println("-------------"+wallet.getWaBalance()+"-------"+auWallet.getWrMoney());
				wallet.setWaBalance(new BigDecimal(wallet.getWaBalance().intValue()+Integer.valueOf(auWallet.getWrMoney())));
				//调用修改钱包余额和增加钱包记录的方法
				int rows=walletService.update(wallet,auWallet);
				/*//添加钱包记录表
				System.out.println("=============增加钱包记录表=============");
				AuWareload auWareload=new AuWareload();
				auWareload.setWaId(wallet.getWaId());
				auWareload.setWrMoney(new BigDecimal(auWallet.getWrMoney()));
				auWareload.setWrDate(Tools.getCurDateTime());
				auWareload.setWrContent("将竞拍失败的用户退还金额"+auWallet.getWrMoney()+"元");
				int b=wareloadService.insert(auWareload);
				if(b==1) {
					System.out.println("***************钱包记录增加成功");
				}*/
			}
		}
		return com;
	}
}
