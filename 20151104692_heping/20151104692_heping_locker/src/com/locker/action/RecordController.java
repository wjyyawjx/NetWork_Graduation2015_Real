package com.locker.action;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.locker.domain.Cabinet;
import com.locker.domain.JsonMessage;
import com.locker.domain.Pages;
import com.locker.domain.Record;
import com.locker.domain.User;
import com.locker.service.CabinetService;
import com.locker.service.RecordService;

/**
 * <p>
 *  前端控制器
 * </p>

 */
@Controller
@RequestMapping("/record")
public class RecordController {
	//得到记录表service
	@Resource
	private RecordService record;
	//得到柜子service
	@Resource
	private CabinetService cabinet;
	
	
	@RequestMapping("backLouCeng")
	@ResponseBody
	public Record backLouCeng(Record reCode) {
		return record.backLouCeng(reCode);
	}
	
	/**
	 * 增加和修改
	 * @param cord
	 * @return
	 */
	@RequestMapping("addOrUpdate")
	@ResponseBody
	public JsonMessage addOrUpdate(Record cord) {
		JsonMessage jm = new JsonMessage();
		int rows = record.addOrUpdate(cord);
		if(rows>0) {
			jm.setState(1);
		}else {
			jm.setState(0);
		}
		return jm;
	}
	
	/**
	 * 查询用户表
	 * @return
	 */
	@RequestMapping("findUser")
	@ResponseBody
	public List<Record> findUser() {
		return record.findUser();
	}
	
	/**
	 * 根据id查询
	 * @param reId
	 * @return
	 */
	@RequestMapping("findById")
	@ResponseBody
	public Record findById(String reId) {
		return record.findById(reId);
	}
	
	/**
	 * 根据id删除记录表数据
	 * @param reId
	 * @return
	 */
	@RequestMapping("findIdDelete")
	@ResponseBody
	public JsonMessage findIdDelete(String reId) {
		JsonMessage jm = new JsonMessage();
		int rows = record.findIdDelete(reId);
		if(rows>0) {
			jm.setState(1);
		}else {
			jm.setState(0);
		}
		return jm;
	}
	
	/**
	 * 查询记录表所有行数和模糊查询行数
	 * @param uZh
	 * @return
	 */
	@RequestMapping("findAllCount")
	@ResponseBody
	public Pages findAllCount(String uZh) {
		int count = record.findAllCount(uZh);
		Pages page = new Pages();
		page.setTotalRows(count);
		return page;
	}
	/**
	 * 个人记录的查询记录表
	 * @param cord
	 * @param session
	 * @return
	 */
	@RequestMapping("findAllCountById")
	@ResponseBody
	public Pages findAllCountById(Record cord,HttpSession session) {
		//获取用户
		User user = (User) session.getAttribute("useryh");
		cord.setuId(user.getuId());
		int count = record.findAllCountById(cord);
		Pages page = new Pages();
		page.setTotalRows(count);
		return page;
	}
	
	/**
	 * 查询所有，模糊查询
	 * @param uZh
	 * @return
	 */
	@RequestMapping("findAll")
	@ResponseBody
	public List<Record> findAll(Record cord){
		return record.findAll(cord);
	}
	
	@RequestMapping("findAllByZh")
	@ResponseBody
	public List<Record> findAllByZh(Record cord,HttpSession session){
		//获取用户
		User user = (User) session.getAttribute("useryh");
		cord.setuId(user.getuId());
		System.err.println("用户"+cord.getuId());
		return record.findAllByZh(cord);
	}
	
	
	/**
	 * 根据取件码修改柜子
	 * @param reCode
	 * @return
	 */
	@RequestMapping("backYuqiQujian")
	@ResponseBody
	public int backYuqiQujian(String reCharge) {
		return record.backYuqiQujian(reCharge);
	}
	
	/**
	 * 逾期要支付的金额
	 * @param reCode
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping("backyuqi")
	@ResponseBody
	public Record backyuqi(String reCode) throws ParseException {
		return record.backyuqi(reCode);
	}
	
	
	/**
	 * 付款提交
	 * @param cord
	 * @return
	 */
	@RequestMapping("backSubmit")
	@ResponseBody
	public JsonMessage backSubmit(HttpSession session , Record cord) {
		//修改储物柜为满
		Cabinet bin = new Cabinet();
		bin.setCaId(cord.getCaId());
		bin.setCaWhether("满");
		cabinet.update(bin);
		
		
		JsonMessage jm = new JsonMessage();
		
		//获取当前时间
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String df2 = df.format(new Date());
		cord.setReDeposit(df2);
		//随机获得随机码
		String str = String.valueOf((int)((Math.random()*9+1)*100000));
		cord.setReCode(str);
		//获取用户
		User user = (User) session.getAttribute("useryh");
		cord.setuId(user.getuId());
		
		int rows = record.backSubmit(cord);
		if(rows>0) {
			jm.setState(1);
		}else {
			jm.setState(0);
		}
		return jm;
	}
	/**
	 * 通过取件码取件
	 * @param reCode
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping("backQuJian")
	@ResponseBody
	public Record backQuJian(Record reCode) throws ParseException {
		Record cord = record.backQuJian(reCode);
		return cord;
	}
}

