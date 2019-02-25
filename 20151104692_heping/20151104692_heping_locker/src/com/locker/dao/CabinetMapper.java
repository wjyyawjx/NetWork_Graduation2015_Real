package com.locker.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.yidu.domain.Cabinet;
import com.yidu.domain.Charge;
import com.yidu.domain.Pages;
import com.yidu.domain.Record;

public interface CabinetMapper {

	int deleteByPrimaryKey(String caId);

    int insert(Cabinet record);

    int insertSelective(Cabinet record);

    Cabinet selectByPrimaryKey(String caId);

    int updateByPrimaryKeySelective(Cabinet record);

    int updateByPrimaryKey(Cabinet record);

	List<Cabinet> selectAll(Map<String, Object> map);

	List<Charge> selectAllType();

	int count(Cabinet net);

	List<Cabinet> backSelectAll(String arId);

	List<Cabinet> backKon(Cabinet bin);

	Cabinet backTypeCharge(String caId);

	List<Cabinet> findByGuiZi();

	int selectDaguizi(String chId);

	int selectDZXguizi(Map<String, Object> map);
	@Select("SELECT COUNT(*) as count,ch_type as type FROM tb_locker lo,tb_charge ch,tb_cabinet ca \r\n" + 
			"WHERE  ca.lo_id=lo.lo_id  \r\n" + 
			"AND ch.ch_id=ca.ch_id  \r\n" + 
			"AND lo.lo_id='2'\r\n" + 
			"AND ca.ca_whether='满'\r\n" + 
			"GROUP BY ch.ch_type")
	List<Map<String, Object>> findTJT(String arId);



}