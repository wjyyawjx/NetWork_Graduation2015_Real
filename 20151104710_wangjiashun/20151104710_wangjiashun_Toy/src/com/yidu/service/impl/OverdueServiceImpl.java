package com.yidu.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yidu.dao.OverdueMapper;
import com.yidu.domain.Overdue;
import com.yidu.service.OverdueService;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author wujie
 * @since 2018-10-18
 */
@Service
public class OverdueServiceImpl  implements OverdueService {
	@Resource
	OverdueMapper dao;
	

	@Override
	public int delete(String overdueId) {
		return dao.deleteByPrimaryKey(overdueId);
		
	}

	@Override
	public Overdue findById(String overdueId) {
		Overdue overdue = dao.selectByPrimaryKey(overdueId);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		overdue.setOverdueTimeVo(sdf.format(overdue.getOverdueTime()));
		return overdue;
	}
	
	@Override
	public int findRows() {
		return dao.findRows();
	}
	
	@Override
	public PageInfo<Overdue> findAll(Integer page, Integer pageSize,Overdue us) throws ParseException {
		PageHelper.startPage(page,pageSize);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		if(us.getOverdueTimeVo()!="") {
			us.setOverdueTime(sdf.parse(us.getOverdueTimeVo()));
		}
		
		List<Overdue> types = dao.findAlls(us);
		
		
		for (Overdue overdue : types) {
			overdue.setOverdueTimeVo(sdf.format(overdue.getOverdueTime()));
			System.err.println("转换后的时间String"+overdue.getOverdueTimeVo());
		}
		PageInfo<Overdue> typesPageInfo = new PageInfo<>(types);
		return typesPageInfo;
	}

	@Override
	public int add(Overdue overdue) {
		System.out.println("转过来的id"+overdue.getOverdueId());
		if(overdue.getOverdueId()==null) {
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			overdue.setOverdueId(uuid);
			return dao.insertSelective(overdue);
		}else {
			return dao.updateByPrimaryKeySelective(overdue);
		}
	}
}
