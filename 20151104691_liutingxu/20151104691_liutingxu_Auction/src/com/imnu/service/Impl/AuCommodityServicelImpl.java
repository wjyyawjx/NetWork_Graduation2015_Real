package com.imnu.service.Impl;

import java.math.BigDecimal;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.imnu.auction.vo.CommodityVo;
import com.imnu.common.Page;
import com.imnu.dao.AuCommodityMapper;
import com.imnu.dao.AuImageMapper;
import com.imnu.model.AuCommodity;
import com.imnu.model.AuImage;
import com.imnu.service.AuCommodityService;



/**
 * 
 * 描述:商品服务实现类
 */
@Service
public class AuCommodityServicelImpl implements AuCommodityService{
	@Resource
	private AuCommodityMapper dao;
	@Resource
	AuImageMapper imageMapper;
	
	@Override
	public List<AuCommodity> queryAll(CommodityVo vo,Page page) {
		Map<String, Object> map = new HashMap<>();
		map.put("comName", vo.getComName());
		map.put("comDate", vo.getComDate());
		map.put("comTime", vo.getComTime());
		map.put("startRows", page.getStartRows());
		map.put("rows", page.getRows());
		return dao.queryAll(map);
	}

	@Override
	public int delete(String id) {
		return dao.deleteByPrimaryKey(id);
	}

	@Override
	public int deleteByPrimaryKey(String comId) {
		return dao.deleteByPrimaryKey(comId);
	}

	@Override
	public int insert(AuCommodity record) {
		return dao.insert(record);
	}

	@Override
	public int insertSelective(AuCommodity record) {
		return dao.insertSelective(record);
	}

	@Override
	public CommodityVo selectByPrimaryKey(String comId) {
		AuCommodity commodity = dao.selectByPrimaryKey(comId);
		CommodityVo vo = new CommodityVo();
		BeanUtils.copyProperties(commodity, vo);
		//vo.setComDate(DateFormatUtils.format(commodity.getComDate(),"yyyy-MM-dd"));
		//vo.setComTime(DateFormatUtils.format(commodity.getComTime(),"yyyy-MM-dd"));
		vo.setComMoney(String.valueOf(commodity.getComMoney()));
		vo.setComState(String.valueOf(commodity.getComState()));
		vo.setComMargin(String.valueOf(commodity.getComState()));
		return vo;
	}

	@Override
	public int updateByPrimaryKeySelective(AuCommodity record) {
		return dao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(AuCommodity record) {
		return dao.updateByPrimaryKey(record);
	}
	
	@Override
	public int addOrUpdate(CommodityVo vo) {
		AuCommodity commodity = new AuCommodity();
		BeanUtils.copyProperties(vo, commodity);
		//如果copy不了的属性,则自己手动增加
		Date datea = null ;
		Date dateb = null ;
		try {
			datea = DateUtils.parseDate(vo.getComDate(), "yyyy-MM-dd");
			dateb = DateUtils.parseDate(vo.getComTime(), "yyyy-MM-dd");
		} catch (ParseException e) { 
			e.printStackTrace();
		}
		//commodity.setComDate(datea);
		//commodity.setComTime(dateb);
		commodity.setComMoney(new BigDecimal(vo.getComMoney()));
		commodity.setComMargin(new BigDecimal(vo.getComMargin()));
		commodity.setComState(Long.valueOf(vo.getComState()));
		
		int rows = 0;
		if(vo.getComId() !=null &&!"".equals(vo.getComId())){
			rows = updateByPrimaryKeySelective(commodity);
		}else{
			rows = insertSelective(commodity);
		}
		return rows;
	}

	@Override
	public AuCommodity findById(String comId) {
		return dao.findById(comId);
	}

	@Override
	public Long findCount(CommodityVo vo) {
		return dao.findCount(vo);
	}

	@Override
	public List<AuCommodity> queryCom() {
		return dao.queryCom();
	}

	@Override
	public List<AuCommodity> findAlls() {
		return dao.findAlls();
	}

	@Override
	public int addCom(AuCommodity auCommodity, String[] phpImage) {
		int rows=dao.insert(auCommodity);
		int row=0;
		for (int i = 0; i < phpImage.length; i++) {
			if(i!=0) {
				AuImage image=new AuImage();
				image.setComId(auCommodity.getComId());
				image.setImUpload("upload/"+phpImage[i]);
				if(i<5) {
					image.setImType("1");
				}else {
					image.setImType("2");
				}
				row=imageMapper.insert(image);
			}
		}
		if(rows==1 && row==1) {
			return 1;
		}else {
			return 0;
		}
	}

	@Override
	public int findState(String comId) {
		AuCommodity auCommodity=dao.selectByPrimaryKey(comId);
		auCommodity.setComState((long) 1);
		return dao.updateByPrimaryKeySelective(auCommodity);
	}

	@Override
	public List<Map<String, Object>> comUser(String userId) {
		return dao.comUser(userId);
	}
}
