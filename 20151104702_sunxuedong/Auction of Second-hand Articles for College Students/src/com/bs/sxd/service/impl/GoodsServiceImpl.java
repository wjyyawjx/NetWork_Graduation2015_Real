package com.bs.sxd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bs.common.utils.Page;
import com.bs.sxd.dao.GoodsDao;
import com.bs.sxd.po.Goods;
import com.bs.sxd.service.GoodsService;

/**
 * 用户Service接口实现类
 * 
 * @author 孙雪冬
 *
 */
@Service("goodsService")
@Transactional
public class GoodsServiceImpl implements GoodsService {
	// 注入UserDao
	@Autowired
	private GoodsDao goodsDao;

	@Override
	public void addGoods(Goods goods) {
		goodsDao.addGoods(goods);

	}

	@Override
	public Page<Goods> findGoods_yList(Integer page, Integer rows, Integer l_price, String l_name, String l_info,
			String l_image) {
		Goods goods = new Goods();
		// 当前页
		goods.setStart((page - 1) * rows);
		// 每页数
		goods.setRows(rows);
		List<Goods> good = goodsDao.findGoods_yList(goods);
		// 创建Page返回对象
				Page<Goods> result = new Page<Goods>();
				result.setPage(page);
				result.setRows(good);
				result.setSize(rows);
				return result;
	}

}
