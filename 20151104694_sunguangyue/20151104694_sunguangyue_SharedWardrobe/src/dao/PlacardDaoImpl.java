package com.wgh.dao;

import commerce.placard;
import com.wgh.DB.connDB;
import com.wgh.DB.chStr;

public class PlacardDaoImpl implements PlacardDao{
  connDB conn=new connDB();
  chStr chStr=new chStr();
  public int insert(placard p) {
    int ret=-1;
    try{
      String sql = "insert into tb_bbs (title,content) values('" +
          chStr.chStr(p.getTitle()) + "','" + chStr.chStr(p.getContent()) +
          "')";
      ret = conn.executeUpdate(sql);
    }catch (Exception e){
      ret=0;
    }
    return ret;
  }

}
