package com.imnu.service.Impl;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.imnu.common.Page;
import com.imnu.common.Tools;
import com.imnu.dao.AuWalletMapper;
import com.imnu.dao.AuWareloadMapper;
import com.imnu.model.AuMreload;
import com.imnu.model.AuWallet;
import com.imnu.model.AuWareload;
import com.imnu.service.AuWalletService;


/**
 * 
 * 描述:钱包服务实现类
 */
@Service
public class AuWalletServiceImpl implements AuWalletService{
	
	@Resource
	private AuWalletMapper	walletDao;
	
	@Resource
	AuWareloadMapper  wareloadMapper;
	
	@Override
	public int deleteByPrimaryKey(String waId) {
		return walletDao.deleteByPrimaryKey(waId);
	}

	@Override
	public int insert(AuWallet record) {
		AuWareload auWareload=new AuWareload();
		auWareload.setWaId(record.getWaId());
		auWareload.setWrMoney(record.getWaBalance());
		auWareload.setWrDate(Tools.getCurDateTime());
		auWareload.setWrContent("增加了"+record.getWaBalance()+"元");
		wareloadMapper.insert(auWareload);
		return walletDao.insert(record);
	}

	@Override
	public int insertSelective(AuWallet record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public AuWallet selectByPrimaryKey(String waId) {
		return walletDao.selectByPrimaryKey(waId);
	}

	@Override
	public int updateByPrimaryKeySelective(AuWallet record,String money) {
		AuWareload auWareload=new AuWareload();
		auWareload.setWaId(record.getWaId());
		auWareload.setWrMoney(record.getWaBalance());
		auWareload.setWrDate(Tools.getCurDateTime());
		auWareload.setWrContent("增加了"+money+"元");
		wareloadMapper.insert(auWareload);
		return walletDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(AuWallet record, AuWareload auWareload) {
		//修改钱包金额
		int wall=walletDao.updateByPrimaryKeySelective(record);
		if(wall==1) {
			System.out.println("**********修改钱包金额扣除商品价格成功");
		}
		//增加钱包记录表
		int load=wareloadMapper.insert(auWareload);
		if(load==1) {
			System.out.println("***********钱包记录增加用户缴纳商品价格成功");
		}
		if(wall==1 && load==1) {
			return 1;
		}else {
			return 0;
		}
		
	}

	@Override
	public List<AuWallet> queryAll(AuWallet wallet,Page page) {
		Map<String, Object> map = new HashMap<>();
		map.put("userId", wallet.getUserId());
		map.put("startRows", page.getStartRows());
		map.put("rows", page.getRows());
		return walletDao.queryAll(map);
	}

	@Override
	public int addOrUpdate(AuWallet wallet) {
		int rows = 0;
		if(wallet.getWaId() != null && !"".equals(wallet.getWaId())){
			rows = walletDao.updateByPrimaryKeySelective(wallet);
		}else{
			rows = walletDao.insertSelective(wallet);
		}
		return rows;
	}

	@Override
	public Long findCount(AuWallet wallet) {
		return walletDao.findCount(wallet);
	}

	@Override
	public AuWallet selectWallet(AuWallet auWallet) {
		// TODO Auto-generated method stub
		return walletDao.selectWallet(auWallet);
	}

	@Override
	public AuWallet findWallet(String userId) {
		return walletDao.findWallet(userId);
	}



	@Override
	public int update(AuWallet wallet,AuWallet auWallet) {
		//添加钱包记录表
		System.out.println("=============增加钱包记录表=============");
		AuWareload auWareload=new AuWareload();
		auWareload.setWaId(wallet.getWaId());
		auWareload.setWrMoney(new BigDecimal(auWallet.getWrMoney()));
		auWareload.setWrDate(Tools.getCurDateTime());
		auWareload.setWrContent("将竞拍失败的用户退还金额"+auWallet.getWrMoney()+"元");
		//钱包出价记录的增加方法
		int b=wareloadMapper.insert(auWareload);
		if(b==1) {
			System.out.println("***************钱包记录增加成功");
		}
		//调用根据id修改钱包的方法
		int a=walletDao.updateByPrimaryKeySelective(wallet);
		if(a==1) {
			System.out.println("***************修改该用户的余额");
		}
		if(a==1&& b==1){
			return 1;
		}else {
			return 0;
		}
		
	}
	
	@Override
	public int update2(AuWallet wallet, AuMreload auMreload) {
		//添加钱包记录表
		System.out.println("=============增加钱包记录表=============");
		AuWareload auWareload=new AuWareload();
		auWareload.setWaId(wallet.getWaId());
		auWareload.setWrMoney(auMreload.getMrMoney());
		auWareload.setWrDate(Tools.getCurDateTime());
		auWareload.setWrContent("将得标用户保证金退还"+auMreload.getMrMoney()+"元");
		int b=wareloadMapper.insert(auWareload);
		if(b==1) {
			System.out.println("***************钱包记录增加成功");
		}
		int a=walletDao.updateByPrimaryKeySelective(wallet);
		if(a==1) {
			System.out.println("***************修改该用户的余额");
		}
		if(a==1&& b==1){
			return 1;
		}else {
			return 0;
		}
		
	}

	@Override
	public AuWallet findState() {
		return walletDao.findState();
	}

	@Override
	public int updateBy(AuWallet auWallets) {
		return walletDao.updateByPrimaryKey(auWallets);
	}

}
