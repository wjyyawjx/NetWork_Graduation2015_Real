package cn.itheima.dao;

import java.util.List;

import cn.itheima.pojo.BaseDict;

public interface DictMapper {

	
	public List<BaseDict> findDictByCode(String code);
}
