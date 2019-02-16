package com.yidu.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yidu.dao.AreaMapper;
import com.yidu.dao.CabinetMapper;
import com.yidu.domain.Area;
import com.yidu.domain.Cabinet;
import com.yidu.domain.Charge;
import com.yidu.domain.Locker;
import com.yidu.domain.Pages;
import com.yidu.domain.Record;
import com.yidu.service.CabinetService;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author wuqi
 * @since 2018-10-17
 */
@Service
public class CabinetServiceImpl implements CabinetService {
	@Resource
	private CabinetMapper cabinet;
	
	@Resource
	AreaMapper areaMapper;
	/**
	 * 模糊查询和查询所有
	 */
	@Override
	public List<Cabinet> selectAll(Cabinet net,Pages page) {
		Map<String, Object> map=new HashMap<>();
		map.put("net", net);
		map.put("page", page);
		return cabinet.selectAll(map);
	}

	/**
	 * 根据id删除
	 */
	@Override
	public int deleteByPrimaryKey(String caId) {
		return cabinet.deleteByPrimaryKey(caId);
	}

	/**
	 * 查询类型表所有
	 */
	@Override
	public List<Charge> selectAllType() {
		return cabinet.selectAllType();
	}

	/**
	 * 增加和修改
	 */
	@Override
	public int addOrUpdate(Cabinet bin) {
		int rows = 0;
		if(bin.getCaId()!=null && !"".equals(bin.getCaId())) {
			rows = cabinet.updateByPrimaryKeySelective(bin);
		}else {
			rows = cabinet.insertSelective(bin);
		}
		return rows;
	}
	
	/**
	 * 查询行数
	 */
	@Override
	public int count(Cabinet net) {
		return cabinet.count(net);
	}

	/**
	 * 前台查询储物柜所有
	 */
	@Override
	public List<Cabinet> backSelectAll(String arId) {
		return cabinet.backSelectAll(arId);
	}

	/**
	 * 可储物的储物柜
	 */
	@Override
	public Map<String,Object> backKon(Cabinet bin) {
		Map<String,Object> map = new HashMap<>();
		for(int i=1;i<=3;i++) {
			bin.setChId(String.valueOf(i));
			List<Cabinet> list = cabinet.backKon(bin);
			map.put(String.valueOf(i), list);
		}
		return map;
	}

	/**
	 * 查询该储物柜的价格
	 */
	@Override
	public Cabinet backTypeCharge(String caId) {
		return cabinet.backTypeCharge(caId);
	}

	/**
	 * 修改储物柜为满
	 */
	@Override
	public int update(Cabinet bin) {
		return cabinet.updateByPrimaryKeySelective(bin);
	}

	/**
	 * 查询所有
	 */
	@Override
	public List<Cabinet> findByGuiZi() {
		return cabinet.findByGuiZi();
	}

	/**
	 * 根据类型查询储物柜满了的数量
	 */
	@Override
	public int selectDaguizi(String chId) {
		return cabinet.selectDaguizi(chId);
	}
	/**
	 * 每楼的大中小储物柜统计图
	 */
	@Override
	public int selectDZXguizi(Cabinet bin, Locker ker) {
		Map<String, Object> map = new HashMap<>();
		map.put("bin", bin);
		map.put("ker", ker);
		return cabinet.selectDZXguizi(map);
	}

	@Override
	public Map<String, Object> findTJT() {
		Map<String, Object> map=new HashMap<>();
		List<Area> area=areaMapper.findAll();
		for (Area area2 : area) {
			List<Map<String, Object>> list= cabinet.findTJT(area2.getArId());
			map.put(area2.getArName(), list);
		}
		return map;
	}

	@Override
	public Cabinet selectAllCNM(String caId) {
		return cabinet.selectByPrimaryKey(caId);
	}

}
