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
 
}
