package com.yidu.dao;

import java.util.List;

import com.yidu.common.Pages;
import com.yidu.controller.vo.ToyVo;
import com.yidu.domain.Toy;
import com.yidu.domain.ToyType;

public interface ToyMapper {
	
	/**
	 * 根据类型id查询
	 * @param typeId
	 * @return
	 */
	public List<ToyVo> findByTypeId(String typeId);
	
	/**
	 * 查询类型
	 * @return
	 */
	public List<ToyType> findType();
	
	/**
	 * 查询行数
	 * @return
	 */
	public int findRow();
	
	/**
	 * 查询所有
	 * @param toyVo
	 * @return
	 */
	public List<ToyVo> findAll(ToyVo toyVo);
	
    int deleteByPrimaryKey(String toyId);

    int insert(Toy record);

    int insertSelective(Toy record);

    ToyVo selectByPrimaryKey(String toyId);

    int updateByPrimaryKeySelective(Toy record);

    int updateByPrimaryKey(Toy record);
    
    /**
     * 没有分页的查询所有
     * @return
     */
	public List<ToyVo> selectAll();
	
	/**
	 * 分页显示所有玩具
	 * @param pages
	 * @return
	 */
	public List<ToyVo> queryAll(ToyVo toyvo);
}