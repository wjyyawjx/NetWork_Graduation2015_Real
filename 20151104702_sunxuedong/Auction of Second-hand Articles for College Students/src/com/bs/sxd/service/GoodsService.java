package com.bs.sxd.service;

import java.util.List;

import com.bs.common.utils.Page;
import com.bs.sxd.po.Goods;

/**
 * Service 接口
 * 
 * @author 孙雪冬
 *
 */
public interface GoodsService {

	// 增加商品
	public void addGoods(Goods goods);

	// 查询商品

	public Page<Goods> findGoods_yList(Integer page, Integer rows, Integer l_price, String l_name, String l_info,
			String l_image);

}
