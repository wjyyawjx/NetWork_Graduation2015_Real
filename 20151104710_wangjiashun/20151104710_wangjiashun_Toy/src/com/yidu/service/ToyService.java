package com.yidu.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.yidu.common.Pages;
import com.yidu.controller.vo.ToyVo;
import com.yidu.domain.Photo;
import com.yidu.domain.Toy;
import com.yidu.domain.ToyType;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 王佳顺
 * @since 2018-10-18
 */
public interface ToyService  {
	
	/**
	 * 查询所有
	 * @return
	 */
	public PageInfo<ToyVo> findAll(Integer page,Integer pageSize,ToyVo vo);
	
	
	/**
	 * 增加或修改的方法
	 * @param vo
	 * @return
	 */
	public int addOrUpdate(ToyVo vo);
	
	/**
	 * 根据id修改
	 * @param toy
	 * @return
	 */
	public int updateByPrimaryKeySelective(Toy toy);
	
	/**
	 * 增加
	 * @param toy
	 * @return
	 */
	public int insertSelective(Toy toy);
	/**
	 * 删除的方法
	 * @return
	 */
	public int delete(String id);
	
	/**
	 * 查询行数
	 * @return
	 */
	public int findRows();
	

	/**
	 * 根据id查询
	 * @return
	 */
	public ToyVo findById(String toyId);
	
	/**
	 * 查询所有玩具类型
	 */
	public List<ToyType> findType();
	
	/**
	 * 根据类型查询玩具
	 */
	public List<ToyVo> findByTypeId(String typeId);

	
	/**
	 * 查询所有（无分页）
	 * @return
	 */
	public List<ToyVo> selectAll();
	
	
	/**
	 * 分页显示玩具
	 * @param pages
	 * @return
	 */
	public List<ToyVo> queryAll(ToyVo toyVo);
}
