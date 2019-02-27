package com.imnu.service.Impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;

import com.imnu.common.Page;
import com.imnu.common.Tools;
import com.imnu.dao.AuCommodityMapper;
import com.imnu.dao.AuIndentMapper;
import com.imnu.model.AuCommodity;
import com.imnu.model.AuIndent;
import com.imnu.model.AuMreload;
import com.imnu.model.AuRecord;
import com.imnu.model.AuUser;
import com.imnu.model.AuWallet;
import com.imnu.model.AuWareload;
import com.imnu.service.AuIndentService;
import com.imnu.service.AuMrecordService;
import com.imnu.service.AuRecordService;
import com.imnu.service.AuWalletService;


/**
 * 订单service实现类
 */
@Service
public class AuIndentServiceImpl implements AuIndentService{
	//注入订单mapper
	@Resource
	AuIndentMapper mapper;
	//注入钱包mapper
	@Resource
	AuWalletService walletService;
	//注入出价记录mapper
	@Resource
	AuRecordService recordService;
	@Resource
	AuMrecordService mrecordService;
	
	@Resource
	AuCommodityMapper comMapper;
	
	@Override
	public List<AuIndent> query(String comName, String inDate, String inTime,Page page) {
		Map<String, Object> map=new HashMap<>();
		map.put("comName", comName);
		map.put("inDate", inDate);
		map.put("inTime", inTime);
		map.put("page", page);
		//调用查询所有的方法
		return mapper.query(map);
	}

	@Override
	public int inDelete(String inId) {
		//调用删除的方法
		int rows=mapper.deleteByPrimaryKey(inId);
		return rows;
	}

	@Override
	public int inCount(String comName, String inDate, String inTime) {
		Map<String, Object> map=new HashMap<>();
		map.put("comName", comName);
		map.put("inDate", inDate);
		map.put("inTime", inTime);
		//条件查询行数
		int rows=mapper.inCount(map);
		return rows;
	}

	@Override
	public int addOrUpdate(AuIndent auIndent) {
		auIndent.setInDate(auIndent.getInDate()+" 00:00:00");
		
		int rows=0;
		//如果id不为空
		//如果订单id为空
		if(auIndent.getInId()!=null && auIndent.getInId()!="") {
			//调用修改的方法
			rows=mapper.updateByPrimaryKeySelective(auIndent);
		}else {
			//调用增加的方法
			rows=mapper.insert(auIndent);
		}
		return rows;
	}

	@Override
	public AuIndent findById(String inId) {
		//根据id查询
		return mapper.selectByPrimaryKey(inId);
	}

	@Override
	public List<Map<String, Object>> selectUser(String userId) {
		//根据用户id查询订单
		return mapper.selectUser(userId);
	}

	@Override
	public int insert(AuIndent indent) {
		//增加
		return mapper.insert(indent);
	}

	@Override
	public int updateState(String inId,String state,HttpSession session) {
		System.out.println("============进来了----------------------");
		//根据id查询订单表
		AuIndent auIndent=mapper.selectByPrimaryKey(inId);
		
		auIndent.setInState(state);
		//修改订单状态
		int rows=mapper.updateByPrimaryKeySelective(auIndent);
		
		
		//根据查询该用户的钱包金额
		AuUser user=(AuUser) session.getAttribute("user");
		AuWallet auWallet=walletService.findWallet(user.getUserId());
		
		List<AuMreload> lists=mrecordService.selectMrecord(auIndent.getComId(), user.getUserId());
		if(!lists.isEmpty()) {
			AuMreload auMreload=lists.get(0);
			System.out.println("=========================保证金:"+auMreload.getMrMoney()+"=========钱包余额:"+auWallet.getWaBalance());
			
			//修改钱包余额
			auWallet.setWaBalance(new BigDecimal(auWallet.getWaBalance().intValue()+auMreload.getMrMoney().intValue()));
			//修改用户钱包加上保证金退还
			int row=walletService.update2(auWallet,auMreload);
			//根据商品id和用户id查询订单集合 根据订单金额逆序
			List<AuRecord> list=recordService.findComUser(auIndent.getComId(),auIndent.getUserId());
			AuRecord auRecord=list.get(0);
			auRecord.setReState((long) 2);
			//将这条出价记录修改为无效
			recordService.update(auRecord);
		}
		
		//如果状态是1就是点击确认购买
		if("1".equals(state)) {
			System.err.println("===================确认购买====================");
			
			System.out.println("************扣除商品金额"+auIndent.getInMoney());
			//将钱包金额减去商品的金额
			auWallet.setWaBalance(new BigDecimal(auWallet.getWaBalance().intValue()-auIndent.getInMoney().intValue()));
			//将钱包记录数据封装
			AuWareload auWareload=new AuWareload();
			auWareload.setWaId(auWallet.getWaId());
			auWareload.setWrMoney(new BigDecimal(auIndent.getInMoney().intValue()));
			auWareload.setWrDate(Tools.getCurDateTime());
			auWareload.setWrContent("将得标用户扣除竞拍价格"+auIndent.getInMoney()+"元");
			//调用更改钱包余额和增加钱包记录的方法
			int a=walletService.updateByPrimaryKey(auWallet,auWareload);
			
			//查询出该订单的商品
			AuCommodity com=comMapper.selectByPrimaryKey(auIndent.getComId());
			//查询出发布人的钱包
			AuWallet wallet=walletService.findWallet(com.getUserId());
			
			Double mo=(double) (auIndent.getInMoney().intValue()/100*5);
			
			wallet.setWaBalance(new BigDecimal(wallet.getWaBalance().intValue()+auIndent.getInMoney().intValue()-mo));
			
			auWareload.setWaId(wallet.getWaId());
			auWareload.setWrMoney(new BigDecimal(auIndent.getInMoney().intValue()));
			auWareload.setWrDate(Tools.getCurDateTime());
			auWareload.setWrContent("将发布人的钱包加上平台扣除手续费的商品价格"+(auIndent.getInMoney().intValue()-mo)+"元");
			//调用更改钱包余额和增加钱包记录的方法
			int b=walletService.updateByPrimaryKey(wallet,auWareload);
			
			AuWallet w= walletService.findState();
			w.setWaBalance(new BigDecimal(w.getWaBalance().intValue()+mo));
			System.err.println("===================修改平台金额====================");
			walletService.updateByPrimaryKeySelective(w,"");
		}
		if(rows==1) {
			return 1;
		}else {
			return 0;
		}
	}

	@Override
	public int findState(String inId) {
		AuIndent auIndent=mapper.selectByPrimaryKey(inId);
		//修改状态为2
		auIndent.setInState("2");
		//调用修改的方法
		int rows=mapper.updateByPrimaryKeySelective(auIndent);
		return rows;
	}
	
	@Override
	public int findStates(String inId) {
		AuIndent auIndent=mapper.selectByPrimaryKey(inId);
		//修改状态为9
		auIndent.setInState("9");
		//调用修改的方法
		int rows=mapper.updateByPrimaryKeySelective(auIndent);
		return rows;
	}

	@Override
	public List<String>  selectTjt() {
		List<String> lists=new ArrayList<>();
		for (int i = 4; i <12; i++) {
			List<String> list=new ArrayList<>();
			if(i<10) {
				list=mapper.selectTjt("2018-0"+i);
			}else {
				list=mapper.selectTjt("2018-"+i);
			}
			lists.add(list.get(0)+","+list.get(1)+","+list.get(2));
		}	
		
		return lists;
	}

	
}
