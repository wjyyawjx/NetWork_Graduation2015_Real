package com.yidu.dao;

import java.util.List;

import com.yidu.common.Pages;
import com.yidu.controller.vo.PhotoVo;
import com.yidu.domain.Photo;


public interface PhotoMapper {
    int deleteByPrimaryKey(String integer);

    int insert(Photo record);

    int insertSelective(Photo record);

    Photo selectByPrimaryKey(String photoId);

    int updateByPrimaryKeySelective(Photo record);

    int updateByPrimaryKey(Photo record);
    
    /**
     * 查询所有
     * @param vo
     * @return
     */
    List<Photo> selectAll(PhotoVo vo);
    
    /**
     * 查询所有
     * @return
     */
    int selectCount(PhotoVo vo);
    
    Photo findByPath(String id);
}