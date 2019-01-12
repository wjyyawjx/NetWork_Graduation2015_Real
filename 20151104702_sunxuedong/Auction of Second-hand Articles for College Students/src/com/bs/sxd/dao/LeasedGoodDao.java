package com.bs.sxd.dao;

import java.util.List;

import com.bs.sxd.po.Leasedgoods;

public interface LeasedGoodDao {
	public List<Leasedgoods> selectLeasedGoodList(Leasedgoods leasdeGood);
}
