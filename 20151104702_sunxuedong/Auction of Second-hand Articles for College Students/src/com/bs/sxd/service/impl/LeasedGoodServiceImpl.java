package com.bs.sxd.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bs.common.utils.Page;
import com.bs.sxd.dao.LeasedGoodDao;
import com.bs.sxd.po.Leasedgoods;
import com.bs.sxd.service.LeasedGoodService;


@Service("leasedGoodService")
@Transactional
public class LeasedGoodServiceImpl implements LeasedGoodService {

	@Autowired
	private LeasedGoodDao leasedgoodsdao;
	public Page<Leasedgoods> findselectLeasedGoodList(Integer page, Integer rows, String l_name) {
		// TODO Auto-generated method stub
		Leasedgoods leasedgoods = new Leasedgoods();
		if(StringUtils.isNotBlank(l_name)){
			leasedgoods.setL_name(l_name);
		}
		leasedgoods.setSart((page-1) * rows);
		leasedgoods.setRows(rows);
		List<Leasedgoods> leasedgoods1 = leasedgoodsdao.selectLeasedGoodList(leasedgoods);
		
		List<Leasedgoods> count = leasedgoodsdao.selectLeasedGoodList(leasedgoods);
		// 创建Page返回对象
		Page<Leasedgoods> result = new Page<Leasedgoods>();
		result.setPage(page);
		result.setRows(leasedgoods1);
		result.setSize(rows);
		return result;
		
	}
	

}
