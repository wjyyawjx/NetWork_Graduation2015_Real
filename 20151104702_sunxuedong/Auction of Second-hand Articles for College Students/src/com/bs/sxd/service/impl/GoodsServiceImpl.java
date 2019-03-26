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
	public Page<Goods> findGoods_yList(Integer page, Integer rows, Integer l_static, String l_name, String l_type) {
		Goods goods = new Goods();
		// 当前页
		goods.setStart((page - 1) * rows);
		// 每页数
		goods.setRows(rows);
		//存起来，不然xml文件取不到值
		goods.setL_name(l_name);
		goods.setL_type(l_type);
		goods.setL_static(l_static);
		List<Goods> good = goodsDao.findGoods_yList(goods);
		// 查询商品列表总记录数
				Integer count = goodsDao.selectgoodsListCount(goods);	
		// 创建Page返回对象
				Page<Goods> result = new Page<Goods>();	
				result.setPage(page);
				result.setRows(good);
				result.setSize(rows);
				result.setTotal(count);
				return result;
	}
	//下架商品
	@Override
	public void updategoodstype_n(Goods goods) {
		goodsDao.updategoodstype_n(goods);
		
	}
	//删除商品
	@Override
	public void deletegoods(Integer id) {
		goodsDao.deletegoods(id);
		
	}	
}
