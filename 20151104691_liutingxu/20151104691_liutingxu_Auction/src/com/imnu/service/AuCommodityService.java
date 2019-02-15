package com.imnu.service;

import java.util.List;
import java.util.Map;

import com.imnu.auction.vo.CommodityVo;
import com.imnu.common.Page;
import com.imnu.model.AuCommodity;


/**
 * 描述:商品服务类
 */
public interface AuCommodityService {
	
	int deleteByPrimaryKey(String comId);

    int insert(AuCommodity record);

    int insertSelective(AuCommodity record);

    CommodityVo selectByPrimaryKey(String comId);

    int updateByPrimaryKeySelective(AuCommodity record);

    int updateByPrimaryKey(AuCommodity record);
	    
	/**
	 * 查询所有商品
	 * @return 商品集合
	 */
	public List<AuCommodity> queryAll(CommodityVo vo,Page page);
	
	/**
	 * 删除商品
	 * @return
	 */
	public int delete(String id);
	 /**
     * 增加或者修改的方法
     * @param vo
     * @return
     */
    int addOrUpdate(CommodityVo vo);
    /**
     * 根据id查询
     * @param comId
     * @return
     */
	AuCommodity findById(String comId);
	/**
	 * 查询总行数
	 * @return
	 */
    Long findCount(CommodityVo vo);
    /**
     * 查询所有
     * @return
     */
    List<AuCommodity> queryCom();

	List<AuCommodity> findAlls();
	
	int addCom(AuCommodity auCommodity, String[] phpImage);

	int findState(String comId);

	List<Map<String, Object>> comUser(String userId);
}
