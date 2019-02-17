package com.locker.dao;

import java.util.List;
import java.util.Map;

import com.yidu.domain.Pages;
import com.yidu.domain.Record;
import com.yidu.domain.User;

public interface RecordMapper {
    int deleteByPrimaryKey(String reId);

    int insert(Record record);

    int insertSelective(Record record);

    Record selectByPrimaryKey(String reId);

    int updateByPrimaryKeySelective(Record record);

    int updateByPrimaryKey(Record reId);

	Record backQuJian(Record reCode);

	void updateOut(Record cord3);

	Record backyuqi(String reCode);

	//分页一个类继承另一个类的方法
	List<Record> findAll(Record cord);

	int findAllCount(String uZh);

	//分页map方法
	List<Record> findAll(Map<String, Object> map);

	List<Record> findUser();

	List<Record> findMoneyById(String getuId);

	List<Record> findAllByZh(Record cord);

	int findAllCountById(Record cord);

	Record backLouCeng(Record reCode);

	


}