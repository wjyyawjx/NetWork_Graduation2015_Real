package com.yidu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yidu.controller.vo.CarVo;
import com.yidu.controller.vo.CartogramVo;
import com.yidu.controller.vo.RecordVo;
import com.yidu.dao.RecordMapper;
import com.yidu.domain.Record;
import com.yidu.service.RecordService;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author wujie
 * @since 2018-10-18
 */
@Service
public class RecordServiceImpl  implements RecordService {
	@Resource
	RecordMapper recordMapper;
	/**
	 * 订单显示
	 * @param recordVo
	 * @return
	 */
	public List<RecordVo> findAll(){
		return recordMapper.selectAll();
	}
	@Override
	public int findCount() {
		return recordMapper.selectCount();
	}
	@Override
	public int add(Record record) {
		
		return recordMapper.insertSelective(record);
	}
	@Override
	public List<CartogramVo> pieChart() {
		
		return recordMapper.pieChart();
	}
	@Override
	public List<RecordVo> findByUserId(String userId) {
		return recordMapper.findByUserId(userId);
	}
	@Override
	public List<RecordVo> selectLease(String userId) {
		return recordMapper.selectLease(userId);
	}
	@Override
	public int update(Record record) {
		
		return recordMapper.updateByPrimaryKeySelective(record);
	}
	@Override
	public RecordVo selectByid(String recordId) {
		
		return recordMapper.selectByPrimaryKey(recordId);
	}
	
	
}
