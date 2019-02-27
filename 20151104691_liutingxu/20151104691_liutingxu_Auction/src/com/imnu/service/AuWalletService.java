package com.imnu.service;

import java.util.List;
import java.util.Map;

import com.imnu.common.Page;
import com.imnu.model.AuMreload;
import com.imnu.model.AuWallet;
import com.imnu.model.AuWareload;



/**
 * 描述:钱包服务类
 */
public interface AuWalletService {
	 	int deleteByPrimaryKey(String waId);

	    int insert(AuWallet record);

	    int insertSelective(AuWallet record);

	    AuWallet selectByPrimaryKey(String waId);

	    int updateByPrimaryKeySelective(AuWallet record, String money);
	    /**
	     * 更改钱包余额和增加钱包记录的方法
	     * @return
	     */
	    int updateByPrimaryKey(AuWallet record, AuWareload auWareload);
	    /**
	     * 查询所有钱包信息
	     * @return	
	     */
	    List<AuWallet> queryAll(AuWallet wallet,Page page);
	    /**
	     * 增加或者修改的方法
	     * @param vo
	     * @return
	     */
	    int addOrUpdate(AuWallet wallet);
	    /**
		 * 查询总行数
		 * @return
		 */
	    Long findCount(AuWallet wallet);

		AuWallet selectWallet(AuWallet auWallet);

		AuWallet findWallet(String userId);
		/**
		 * 修改钱包余额和增加钱包记录的方法
		 * @param wallet
		 * @param auWallet
		 * @return
		 */
		int update(AuWallet wallet, AuWallet auWallet);

		int update2(AuWallet wallet, AuMreload auMreload);

		AuWallet findState();

		int updateBy(AuWallet auWallets);
}
