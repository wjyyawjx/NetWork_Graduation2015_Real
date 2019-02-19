package com.imnu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.imnu.auction.vo.CommodityVo;
import com.imnu.model.AuCommodity;


public interface AuCommodityMapper {
    int deleteByPrimaryKey(String comId);

    int insert(AuCommodity record);

    int insertSelective(AuCommodity record);

    AuCommodity selectByPrimaryKey(String comId);

    int updateByPrimaryKeySelective(AuCommodity record);

    int updateByPrimaryKey(AuCommodity record);
    
    /**
     * 查询所有商品
     * @return 商品集合
     */
    public List<AuCommodity> queryAll(Map<String, Object> map);
    /**
     * 根据id查询
     * @param comId 商品id
     * @return 商品model对象
     */
	AuCommodity findById(String comId);
	/**
	 * 查询总行数
	 * @return
	 */
	Long findCount(CommodityVo vo);
	/**
	 * 查询
	 */
	List<AuCommodity> queryCom();

	List<AuCommodity> findAlls();
	
	@Select("SELECT * FROM au_commodity co,au_type ty ,au_user us WHERE co.type_id=ty.type_id AND co.user_id=us.user_id and us.user_id=#{userId}")
	List<Map<String, Object>> comUser(String userId);
}