package com.imnu.service.Impl;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.imnu.common.Tools;
import com.imnu.dao.AuMreloadMapper;
import com.imnu.dao.AuWalletMapper;
import com.imnu.dao.AuWareloadMapper;
import com.imnu.model.AuMreload;
import com.imnu.model.AuWallet;
import com.imnu.model.AuWareload;
import com.imnu.service.AuMrecordService;



/**
 * 保证金记录service实现类
 */
@Service
public class AuMrecordServiceImpl implements AuMrecordService{
	@Resource
	AuMreloadMapper mreloadMapper;
	
	@Resource
	AuWalletMapper walletMapper;
	
	@Resource
	AuWareloadMapper wareloadMapper;

	@Override
	public int addMrecord(String comId, String userId, String money) {
		AuMreload mreload=new AuMreload();
		mreload.setComId(comId);
		mreload.setMrDate(Tools.getCurDateTime());
		mreload.setMrState((long) 1);
		mreload.setUserId(userId);
		mreload.setMrMoney(new BigDecimal(money));
		int rows=mreloadMapper.insert(mreload);
		//修改钱包金额减去保证金
		AuWallet auWallet=new AuWallet();
		auWallet.setUserId(userId);
		AuWallet wallet=walletMapper.selectWallet(auWallet);
		wallet.setWaBalance(new BigDecimal(wallet.getWaBalance().intValue()-Integer.valueOf(money)));
		walletMapper.updateByPrimaryKeySelective(wallet);
		//增加钱包记录
		AuWareload auWareload=new AuWareload();
		auWareload.setWaId(wallet.getWaId());
		auWareload.setWrMoney(new BigDecimal(money));
		auWareload.setWrDate(Tools.getCurDateTime());
		auWareload.setWrContent("用户缴纳保证金"+money+"元");
		wareloadMapper.insert(auWareload);
		return rows;
	}

	@Override
	public List<AuMreload> selectMrecord(String comId, String userId) {
		AuMreload mreload=new AuMreload();
		mreload.setComId(comId);
		mreload.setUserId(userId);
		List<AuMreload> list=mreloadMapper.selectMrecord(mreload);
		return list;
	}

	@Override
	public List<AuMreload> queryAll(AuMreload mreload) {
		return mreloadMapper.queryAll(mreload);
	}

	@Override
	public int deleteByPrimaryKey(String mrId) {
		// TODO Auto-generated method stub
		return mreloadMapper.deleteByPrimaryKey(mrId);
	}

	@Override
	public int insert(AuMreload record) {
		return mreloadMapper.insert(record);
	}

	@Override
	public int insertSelective(AuMreload record) {
		return mreloadMapper.insertSelective(record);
	}

	@Override
	public AuMreload selectByPrimaryKey(String mrId) {
		return mreloadMapper.selectByPrimaryKey(mrId);
	}

	@Override
	public int updateByPrimaryKeySelective(AuMreload record) {
		return mreloadMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(AuMreload record) {
		return mreloadMapper.updateByPrimaryKey(record);
	}

	@Override
	public int addOrUpdate(AuMreload record) {
		int rows = 0;
		if(record.getMrId() != null && !"".equals(record.getMrId())){
			rows = mreloadMapper.updateByPrimaryKeySelective(record);
		}else{
			rows = mreloadMapper.insertSelective(record);
		}
		return rows;
	}
	
}
