package com.bs.sxd.dao;

import java.util.List;

import com.bs.common.utils.Page;
import com.bs.sxd.po.Goods;

public interface GoodsDao {
 public void addGoods(Goods goods);
 
 public List<Goods>  findGoods_yList(Goods goods);//查询物品列表
}
