package com.wgh.dao;

import commerce.member;
import java.util.List;

public interface MemberDao {
  public int insert(member m);
  public int update(member m);
  public int delete(member m);
  public List select();
  public member select1();
  public int findPassWord(member m);
}
