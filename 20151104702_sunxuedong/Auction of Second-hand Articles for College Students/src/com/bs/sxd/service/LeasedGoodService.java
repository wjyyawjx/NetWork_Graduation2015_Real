package com.bs.sxd.service;

import com.bs.common.utils.Page;
import com.bs.sxd.po.Leasedgoods;

public interface LeasedGoodService {
  public Page<Leasedgoods> findselectLeasedGoodList(Integer page, Integer rows,String l_name);

}