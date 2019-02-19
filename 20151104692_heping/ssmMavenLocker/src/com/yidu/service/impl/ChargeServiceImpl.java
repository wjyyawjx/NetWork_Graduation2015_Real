package com.yidu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yidu.dao.ChargeMapper;
import com.yidu.domain.Charge;
import com.yidu.service.ChargeService;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 */
@Service
public class ChargeServiceImpl implements ChargeService {
	@Resource
	private ChargeMapper charge;
	
	@Override
	public List<Charge> findAll() {
		return charge.findAllAll();
	}

	@Override
	public int deletes(String chId) {
		return charge.deleteByPrimaryKey(chId);
	}

	@Override
	public int addAndUpdate(Charge charger) {
		if(charger.getChId()!=null && !"".equals(charger.getChId())) {
			return charge.updateByPrimaryKeySelective(charger);
		}else {
			return charge.insertSelective(charger);
		}
	}

	@Override
	public Charge findById(String chId) {
		return charge.selectByPrimaryKey(chId);
	}

}
