package com.imnu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.imnu.model.AuNotice;


/**
 * 公告表
 */
public interface AuNoticeMapper {
    int deleteByPrimaryKey(String noId);

    int insert(AuNotice record);

    int insertSelective(AuNotice record);

    AuNotice selectByPrimaryKey(String noId);
    
    AuNotice findById(String noId);

    int updateByPrimaryKeySelective(AuNotice record);

    int updateByPrimaryKey(AuNotice record);
    
    List<AuNotice> findAll (Map<String, Object> map);

    
    /**
     * 查询总行数
     */
    @Select("select count(*) from au_notice")
	int findCount();

    /**
     * 查询所有
     * @return
     */
    @Select("select * from au_notice")
	List<Map<String, Object>> findNotice();
}