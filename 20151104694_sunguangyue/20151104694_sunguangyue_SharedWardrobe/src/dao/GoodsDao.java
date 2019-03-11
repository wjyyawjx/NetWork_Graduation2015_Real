package com.wgh.dao;
import commerce.goods;

public interface GoodsDao {
  public int insert(goods g);
  public int update(goods g);
  public int delete(goods g);
}
