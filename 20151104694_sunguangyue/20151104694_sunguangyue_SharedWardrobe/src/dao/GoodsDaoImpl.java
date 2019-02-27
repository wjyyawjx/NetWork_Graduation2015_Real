package com.wgh.dao;

import commerce.goods;//导入商品javabean
import com.wgh.DB.chStr;//导入字符串处理javabean
import com.wgh.DB.connDB;//导入数据库操作javabean

public class GoodsDaoImpl implements GoodsDao {//声明GoodsDaoImpl类使用的接口
  connDB conn = new connDB();
  chStr chStr = new chStr();
  public int insert(goods g) {//实现GoodDao接口中的insert方法，对商品数据表进行插入操作
    int ret = -1;
    try {
      String sql = "Insert into tb_goods (TypeID,GoodsName,Introduce,Price,nowPrice,picture,newgoods,sale) values(" +
          g.getTypeID() + ",'" + chStr.chStr(g.getGoodsName()) + "','" +
          chStr.chStr(g.getIntroduce()) + "'," + g.getPrice() + "," +
          g.getPrice() + ",'" + chStr.chStr(g.getPicture()) + "'," +
          g.getNewGoods() + "," + g.getSale() + ")";

      ret = conn.executeUpdate(sql);
    }
    catch (Exception e) {
      ret = 0;
    }
    conn.close();
    return ret;
  }

  public int update(goods g) {
    int ret = -1;
    try {
     String sql = "update tb_Goods set TypeID=" +g.getTypeID() +
         ",GoodsName='" + chStr.chStr(g.getGoodsName()) + "',introduce='" +
         chStr.chStr(g.getIntroduce()) + "',price=" + g.getPrice() +
         ",nowprice=" + g.getNowPrice() +",picture='" + chStr.chStr(g.getPicture())+ "',newgoods=" +
         g.getNewGoods() + ",sale=" + g.getSale() + " where ID=" + g.getID();//一定要有where条件，不然更新数据库中全部数据
     ret = conn.executeUpdate(sql);
   }
   catch (Exception e) {
     ret = 0;
   }
   conn.close();
   return ret;
 }


  public int delete(goods g) {
    int ret=-1;
    try{
      String sql="Delete from tb_goods where ID="+g.getID();
      ret=conn.executeUpdate(sql);
    }catch(Exception e){
      ret=0;
    }
    conn.close();
    return ret;

  }

}
