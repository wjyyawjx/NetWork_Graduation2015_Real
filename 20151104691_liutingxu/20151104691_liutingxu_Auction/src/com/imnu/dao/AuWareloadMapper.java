package com.imnu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.imnu.model.AuWareload;


/**
 * 
 * 描述:钱包支出记录Dao
 */
public interface AuWareloadMapper {
    int deleteByPrimaryKey(String wrId);

    int insert(AuWareload record);

    int insertSelective(AuWareload record);

    AuWareload selectByPrimaryKey(String wrId);

    int updateByPrimaryKeySelective(AuWareload record);

    int updateByPrimaryKey(AuWareload record);
    
    /**
     * 查询所有钱包支出记录信息
     * @param wareload
     * @return
     */
    List<AuWareload> queryAll(Map<String, Object> map);
    /**
	 * 查询总行数
	 * @return
	 */
	Long findCount();
	/**
	 * 根据id查询钱包记录的方法
	 * @param userId
	 * @return
	 */
	@Select("SELECT * FROM au_wareload wr,au_wallet wl WHERE wr.wa_id=wl.wa_id AND wl.user_id=#{userId}")
	List<Map<String, Object>> xfRecord(String userId);
}