package com.imnu.service.Impl;

import java.math.BigDecimal;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.imnu.auction.vo.WareloadVo;
import com.imnu.common.Page;
import com.imnu.common.Tools;
import com.imnu.dao.AuWareloadMapper;
import com.imnu.model.AuWareload;
import com.imnu.service.AuWareloadService;


/**
 * 
 * 描述:钱包支出记录服务实现类
 */
@Service
public class AuWareloadServiceImpl implements AuWareloadService{

	@Resource
	private AuWareloadMapper wareloadDao;
	
	@Override
	public int deleteByPrimaryKey(String wrId) {
		return wareloadDao.deleteByPrimaryKey(wrId);
	}

	@Override
	public int insert(AuWareload record) {
		return 0;
	}

	@Override
	public int insertSelective(AuWareload record) {
		return wareloadDao.insertSelective(record);
	}

	@Override
	public AuWareload selectByPrimaryKey(String wrId) {
		return wareloadDao.selectByPrimaryKey(wrId);
	}

	@Override
	public int updateByPrimaryKeySelective(AuWareload record) {
		return wareloadDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(AuWareload record) {
		return 0;
	}

	@Override
	public List<AuWareload> queryAll(AuWareload wareload,Page page) {
		Map<String, Object> map = new HashMap<>();
		map.put("startRows", page.getStartRows());
		map.put("rows", page.getRows());
		return wareloadDao.queryAll(map);
	}

	@Override
	public int addOrUpdate(WareloadVo vo) {
		AuWareload wareload = new AuWareload();
		BeanUtils.copyProperties(vo, wareload);
		Date date = null ;
		try {
			date = DateUtils.parseDate(vo.getWrDate2(), "yyyy-MM-dd");
		} catch (ParseException e) { 
			e.printStackTrace();
		}
		wareload.setWrDate(Tools.getDateStr(date));
		wareload.setWrMoney(new BigDecimal(vo.getWrMoney()));
		int rows = 0;
		if(vo.getWrId() != null && !"".equals(vo.getWrId())){
			rows = wareloadDao.updateByPrimaryKeySelective(wareload);
		}else{
			rows = wareloadDao.insertSelective(wareload);
		}
		return rows;
	}

	@Override
	public Long findCount() {
		return wareloadDao.findCount();
	}

	@Override
	public List<Map<String, Object>> xfRecord(String userId) {
		return wareloadDao.xfRecord(userId);
	}
	
}
