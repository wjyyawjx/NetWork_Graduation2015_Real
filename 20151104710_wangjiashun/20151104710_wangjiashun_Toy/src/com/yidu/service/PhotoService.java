package com.yidu.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.yidu.common.Pages;
import com.yidu.controller.vo.PhotoVo;
import com.yidu.domain.Photo;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 王佳顺
 * @since 2018-10-18
 */
public interface PhotoService  {
		int deleteByPrimaryKey(String integer);
	  int insertSelective(Photo record);
	  int updateByPrimaryKeySelective(Photo record);
	  
	  PhotoVo selectByPrimaryKey(String flId);
	 /**
     * 增加或者修改的方法
     * @param vo
     * @return
     */
    int addOrUpdate(PhotoVo vo);
    
    /**
     * 查询所有
     * @param vo
     * @return
     */
    List<Photo> selectAll(PhotoVo vo);
    
    /**
     * 根据图片路径查询
     * @param id
     * @return
     */
    Photo findByPath(String path);
    
    /**
     * 查询所有
     * @return
     */
    int selectCount(PhotoVo vo);
	PageInfo<Photo> findAll(Integer page, Integer pageSize, PhotoVo us);
	
}
