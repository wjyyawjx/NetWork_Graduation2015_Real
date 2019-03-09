package com.bs.sxd.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

}
