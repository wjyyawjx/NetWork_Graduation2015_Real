package com.imnu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.imnu.model.AuWallet;


public interface AuWalletMapper {
    int deleteByPrimaryKey(String waId);

    int insert(AuWallet record);

    int insertSelective(AuWallet record);

    AuWallet selectByPrimaryKey(String waId);
    /**
     * 根据id修改钱包的方法
     * @return
     */
    int updateByPrimaryKeySelective(AuWallet record);

    int updateByPrimaryKey(AuWallet record);
    
    /**
     * 查询所有
     * @return
     */
    public List<AuWallet> queryAll(Map<String, Object> map);
    /**
	 * 查询总行数
	 * @return
	 */
	Long findCount(AuWallet wallet);

	AuWallet selectWallet(AuWallet auWallet);
	
	AuWallet findWallet(String userId);

	List<AuWallet> selectUserId(Map<String, Object> map);
	
	AuWallet findState();
    
}