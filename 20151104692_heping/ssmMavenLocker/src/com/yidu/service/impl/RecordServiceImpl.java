package com.yidu.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yidu.dao.CabinetMapper;
import com.yidu.dao.RecordMapper;
import com.yidu.domain.Cabinet;
import com.yidu.domain.Pages;
import com.yidu.domain.Record;
import com.yidu.domain.User;
import com.yidu.service.RecordService;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author wuqi
 * @since 2018-10-17
 */
@Service
public class RecordServiceImpl implements RecordService {
	//记录表id
	String reId=null;
	//柜子id
	String caId=null;
	@Resource 
	private RecordMapper record;
	
	@Resource
	private CabinetMapper cabinet;
	/**
	 * 付款提交
	 */
	@Override
	public int backSubmit(Record cord) {
		return record.insertSelective(cord);
	}

	/**
	 * 取件码取件
	 * @throws ParseException 
	 */
	@Override
	public Record backQuJian(Record reCode) throws ParseException {
		Record cord = record.backQuJian(reCode);
		
		if(cord!=null) {
			//赋柜子表id的值
			caId = cord.getCaId();
			//赋记录id的值
			reId = cord.getReId();
			
			//设置日期格式
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			// new Date()为获取当前系统时间
			Date date = new Date();
			//当前时间转成long
			long time = date.getTime();
			
			//数据库时间转为long类型
			long time2 = df.parse(cord.getReDeposit()).getTime();
			
			
			long time3 = Long.valueOf(cord.getReTime());
			long time4 = time3*3600000;
			if((time-time2)>time4) {
				Record cord2 = new Record();
				//String str = String.valueOf((int)((Math.random()*9+1)*100000));
				//根据id修改逾期的柜子
				cord2.setReId(cord.getReId());
				//已逾期
				cord2.setReOverdue("已逾期");
				//逾期取件码赋值
				//cord2.setReCodeyin(str);
				record.updateByPrimaryKeySelective(cord2);
				return cord2;
			}else {
				//修改没有逾期取出来的快递              取出取件码，取件时间
				Record cord3 = new Record();
				String str3 = df.format(date);
				cord3.setReCode("");
				
				cord3.setReOut(str3);
				cord3.setReId(cord.getReId());
				record.updateOut(cord3);
				//取完柜子变空
				Cabinet bin = new Cabinet();
		
				bin.setCaId(cord.getCaId());
				bin.setCaWhether("空");
				cabinet.updateByPrimaryKeySelective(bin);
				
				
				return cord;
			}
		}
		Record cord4 = new Record();
		cord4.setReOverdue("错误的取件码");
		return cord4;
	}

	/**
	 * 逾期要支付的金额
	 * @throws ParseException 
	 */
	@Override
	public Record backyuqi(String reCode) throws ParseException {
		Record cord = record.backyuqi(reCode);
		//设置日期格式
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//获取当前时间
		Date date = new Date();
		//把当前时间换为毫秒
		long str = date.getTime();
		//把数据库数据转换为毫秒
		long str2 = df.parse(cord.getReDeposit()).getTime();
		//存放时设置的时间
		long str3 = Long.valueOf(cord.getReTime())*3600000;
		
		long str4 =  (long) Math.ceil((str-str2)/str3);
		System.err.println("减"+str+"被减"+str2+"可以滴"+str3+"===="+str4);
		//柜子的价格
		long str5 = Long.valueOf(cord.getChOverdue());
		//逾期的金额
		long str6 = str4*str5;
		//转为string
		String str7 = String.valueOf(str6);
		System.err.println("柜子逾期价格"+str5+"要付的钱"+str6);
		cord.setReCharge(str7);
		return cord;
	}

	/**
	 * 取件码去除，增加取件时间，柜子变空
	 */
	@Override
	public int backYuqiQujian(String reCharge) {
		//new个对象
		Record cord = new Record();
		//逾期费用赋值上去
		cord.setReCharge(reCharge);
		//把取件码清空
		cord.setReCode("1");
		//把当前时间增加到表中
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date2 = df.format(date);
		cord.setReOut(date2);
		//记录表id
		cord.setReId(reId);
		record.updateByPrimaryKeySelective(cord);
		
		//取完柜子变空
		Cabinet bin = new Cabinet();
		//
		bin.setCaId(caId);
		System.err.println("清空的id==="+caId);
		bin.setCaWhether("空");
		cabinet.updateByPrimaryKeySelective(bin);
		
		return 1;
	}

	/**
	 * 查询所有，模糊查询
	 */
	@Override
	public List<Record> findAll(Record cord) {
		return record.findAll(cord);
	}

	/**
	 * 查询记录表所有行数和模糊查询行数
	 */
	@Override
	public int findAllCount(String uZh) {
		return record.findAllCount(uZh);
	}

	/**
	 * 根据id删除记录表数据
	 */
	@Override
	public int findIdDelete(String reId) {
		return record.deleteByPrimaryKey(reId);
	}

	/**
	 * 根据id查询
	 */
	@Override
	public Record findById(String reId) {
		return record.selectByPrimaryKey(reId);
	}

	/**
	 * 查询用户表
	 */
	@Override
	public List<Record> findUser() {
		return record.findUser();
	}

	/**
	 * 增加和修改
	 */
	@Override
	public int addOrUpdate(Record cord) {
		int rows = 0;
		if(cord.getReId()!=null && !"".equals(cord.getReId())) {
			rows = record.updateByPrimaryKeySelective(cord);
		}else {
			rows = record.insertSelective(cord);
		}
		return rows;
	}

	/**
	 * 根据用户查询表
	 */
	@Override
	public List<Record> findAllByZh(Record cord) {
		return record.findAllByZh(cord);
	}

	@Override
	public int findAllCountById(Record cord) {
		return record.findAllCountById(cord);
	}

	/**
	 * 显示楼层
	 */
	@Override
	public Record backLouCeng(Record reCode) {
		return record.backLouCeng(reCode);
	}

}
