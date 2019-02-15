package com.imnu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.imnu.model.AuCommodity;
import com.imnu.model.AuImage;


/**
 * 图片表的dao
 *
 */
public interface AuImageMapper {
    int delete(String id);

    int insert(AuImage record);

    int insertSelective(AuImage record);

    AuImage fingById(String imId);

    int updateByPrimaryKeySelective(AuImage record);

    int update(AuImage record);
    

    AuImage selectByPrimaryKey(String imId);
    
    AuImage selectByType(String imId);
    /**
     * 查询显示所有
     * @return
     */
    List<AuImage> findAll(Map<String, Object> map);
    
    /**
     * 查询显示类型
     * @return
     */
	public List<AuCommodity> findByType();
	
	
		/**
		 * 查询总行数
		 * @return
		 */
	 @Select("select count(*) from au_image")
	 int findCount();
	/**
	 * 根据商品id查询
	 * @param image
	 * @return
	 */
	List<AuImage> findBycomId(AuImage image);
    
}