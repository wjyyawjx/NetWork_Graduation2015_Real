package com.imnu.service.Impl;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.imnu.common.Page;
import com.imnu.common.Tools;
import com.imnu.dao.AuRecordMapper;
import com.imnu.model.AuRecord;
import com.imnu.service.AuRecordService;



/**
 * 出价记录service实现类
 */
@Service
public class AuRecordServiceImpl implements AuRecordService{
	//注入出价记录map
	@Resource
	AuRecordMapper recordMapper;

	@Override
	public int addRecord(String comId, String userId, String money) {
		AuRecord record=new AuRecord();
		record.setUserId(userId);
		record.setComId(comId);
		record.setReDate(Tools.getCurDateTime());
		record.setReState((long) 1);
		record.setReMoney(new BigDecimal(money));
		
		
		List<AuRecord> list=recordMapper.findComUser(record);
		int rows=0;
		if(list.size()==0) {
			//增加的方法
			rows=recordMapper.insert(record);
		}else {
			AuRecord auRecord=list.get(0);
			auRecord.setReMoney(new BigDecimal(auRecord.getReMoney().intValue()+Integer.valueOf(money)));
			rows=recordMapper.updateByPrimaryKeySelective(auRecord);
		}
		
		return rows;
	}

	@Override
	public List<Map<String, Object>> findRecord(String comId) {
		//根据商品id查询
		List<Map<String, Object>> map=recordMapper.findRecord(comId);
		return map;
	}

	@Override
	public List<Map<String, Object>> RecordOrder(String comId) {
		//插叙商品出价记录排行根据金额逆序
		List<Map<String, Object>> map=recordMapper.RecordOrder(comId);
		return map;
	}

	@Override
	public int findRecordCount(String comId) {
		//根据商品id查询行数
		int rows=recordMapper.findRecordCount(comId);
		return rows;
	}

	@Override
	public List<Map<String, Object>> findUserRecord(String userId) {
		//是根据用户id查询出价记录
		List<Map<String, Object>> map=recordMapper.findUserRecord(userId);
		return map;
	}

	@Override
	public List<AuRecord> query(String comName, String userName, String reDate, String reTime,Page page) {
		
		Map<String, Object> map=new HashMap<>();
		map.put("comName", comName);
		map.put("userName", userName);
		map.put("reDate", reDate);
		map.put("reTime", reTime);
		map.put("page", page);
		//条件查询查询所有
		List<AuRecord> list=recordMapper.query(map);
		return list;
	}

	@Override
	public int reCount(String comName, String userName, String reDate, String reTime) {
		Map<String, Object> map=new HashMap<>();
		map.put("comName", comName);
		map.put("userName", userName);
		map.put("reDate", reDate);
		map.put("reTime", reTime);
		//条件查询行数
		int rows=recordMapper.reCount(map);
		return rows;
	}

	@Override
	public int reDelete(String reId) {
		//删除的方法
		int rows=recordMapper.deleteByPrimaryKey(reId);
		return rows;
	}

	@Override
	public int addOrUpdate(AuRecord auRecord) {
		int rows=0;
		//如果出价id不为空
		if(auRecord.getReId()!=null && auRecord.getReId()!="") {
			//调用修改的方法
			rows=recordMapper.updateByPrimaryKeySelective(auRecord);
		}else {
			//调用增加的方法
			rows=recordMapper.insert(auRecord);
		}
		return rows;
	}

	@Override
	public AuRecord findById(String reId) {
		//根据id查询
		AuRecord auRecord=recordMapper.selectByPrimaryKey(reId);
		return auRecord;
	}

	@Override
	public List<Map<String, Object>> findUserId(String userId) {
		//查询该用户的出价记录
		return recordMapper.findUserId(userId);
	}

	@Override
	public List<AuRecord> findMaxComId(String comId) {
		//查询该商品的出价记录
		return recordMapper.findMaxComId(comId);
	}

	@Override
	public int update(AuRecord record) {
		//调用修改的方法
		return recordMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public List<AuRecord> findComUser(String comId, String userId) {
		AuRecord auRecord=new AuRecord();
		auRecord.setComId(comId);
		auRecord.setUserId(userId);
		//调用根据商品id和用户id查询的方法
		return recordMapper.findComUser(auRecord);
	}
	
	
}
