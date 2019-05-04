package com.yidu.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yidu.controller.vo.CarVo;
import com.yidu.controller.vo.CartogramVo;
import com.yidu.controller.vo.RecordVo;
import com.yidu.dao.RecordMapper;
import com.yidu.domain.Record;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 王佳顺
 * @since 2018-10-18
 */
@Service
public interface RecordService  {
	public List<RecordVo> findAll();
	
	public int findCount();

	int add(Record record);
	
	List<CartogramVo> pieChart();
	
	List<RecordVo> findByUserId(String userId);
	
	
	List<RecordVo> selectLease(String userId);
	
	int update(Record record);
	
	RecordVo selectByid(String recordId);
	
}
