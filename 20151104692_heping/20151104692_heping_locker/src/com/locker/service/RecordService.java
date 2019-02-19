package com.locker.service;

import java.text.ParseException;
import java.util.List;

import com.locker.domain.Pages;
import com.locker.domain.Record;
import com.locker.domain.User;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author liandyao
 * @since 2018-10-17
 */
public interface RecordService {

	int backSubmit(Record cord);

	Record backQuJian(Record reCode) throws ParseException;

	Record backyuqi(String reCode) throws ParseException;

	int backYuqiQujian(String reCharge);

	List<Record> findAll(Record cord);

	int findAllCount(String uZh);

	int findIdDelete(String reId);

	Record findById(String reId);

	List<Record> findUser();

	int addOrUpdate(Record cord);

	List<Record> findAllByZh(Record cord);

	int findAllCountById(Record cord);

	Record backLouCeng(Record reCode);


}
