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
	// 注入GoodsDao
	@Autowired
	private GoodsDao goodsDao;
	@Override
	public void addGoods(Goods goods) {
		goodsDao.addGoods(goods);
	}
	//用户管理员/用户查询所有商品
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
	//用于用户查询个人商品
	@Override
	public Page<Goods> findGoods_uList(Integer page, Integer rows, Integer l_static, String l_name, String l_type,
			Integer u_id) {
		Goods goods = new Goods();
		// 当前页
		goods.setStart((page - 1) * rows);
		// 每页数
		goods.setRows(rows);
		//存起来，不然xml文件取不到值
		goods.setL_name(l_name);
		goods.setL_type(l_type);
		goods.setL_static(l_static);
		goods.setU_id(u_id);
		List<Goods> good = goodsDao.findGoods_uList(goods);
		// 查询商品列表总记录数
				Integer count = goodsDao.selectgoodsList_uCount(goods);	
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
	  //用于显示购买界面商品信息
	@Override
	public Goods findThegoods(Integer id) {
		Goods goods = this.goodsDao.findThegoods(id);
		return goods;
	}
	//删除个人商品
	@Override
	public void deletemygoods(Integer id) {
		goodsDao.deletemygoods(id);
		
	}
	//修改个人商品信息
	@Override
	public void updatemygoods(Goods goods) {
		goodsDao.updatemygoods(goods);
	}
	//添加商品信息到订单表
	@Override
	public void addToPurchases(Goods pur) {
		goodsDao.addToPurchases(pur);
		
	}
	//将商品添加到订单表同时更改商品状态
	@Override
	public void updategoodsstatic(Integer id) {
		goodsDao.updategoodsstatic(id);
		
	}
}
