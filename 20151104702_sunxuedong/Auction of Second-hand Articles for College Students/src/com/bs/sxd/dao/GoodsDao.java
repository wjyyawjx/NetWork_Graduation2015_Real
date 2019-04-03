package com.bs.sxd.dao;
import java.util.List;
import com.bs.sxd.po.Goods;
public interface GoodsDao {
//添加商品
 public void addGoods(Goods goods);
//查询物品列表
 public List<Goods>  findGoods_yList(Goods goods);
//总商品数
public Integer selectgoodsListCount(Goods goods);
//下架商品
public void updategoodstype_n(Goods goods);
//删除商品
public void deletegoods(Integer id);
//用于显示购买界面商品信息
public Goods findThegoods(Integer id);
//用于查询个人商品
public List<Goods> findGoods_uList(Goods goods);
//用于查询个人商品总数
public Integer selectgoodsList_uCount(Goods goods);
//删除个人商品
public void deletemygoods(Integer id);
//修改个人商品信息
public void updatemygoods(Goods goods);
//添加商品信息到订单表
public void addToPurchases(Goods pur);
//将商品添加到订单表同时更改商品状态
public void updategoodsstatic(Integer id);
}
