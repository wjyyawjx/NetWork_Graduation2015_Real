package com.wgh.dao;

import commerce.SubType;
import com.wgh.DB.connDB;
import com.wgh.DB.chStr;

public class SubtypeDaoImpl implements SubtypeDao {
  public SubtypeDaoImpl() {
  }
connDB conn=new connDB();
chStr chStr=new chStr();
public int insert(SubType st) {
int ret=-1;
try{
  String sql = "insert into tb_subType (superType,typename) values("+st.getsuperid()+",'" + chStr.chStr(st.gettypename()) +
      "')";
  ret = conn.executeUpdate(sql);
}catch (Exception e){
  ret=0;
}
return ret;
}

}

