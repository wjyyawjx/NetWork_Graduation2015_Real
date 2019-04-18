package com.yidu.service;

import java.util.List;

import com.yidu.controller.vo.CollectVo;
import com.yidu.domain.Collect;



/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 王佳顺
 * @since 2018-10-18
 */
public interface CollectService  {
	/**
     * 查询所有
     * @param vo
     * @return
     */
    List<CollectVo> selectfin(String  id);
    
    int add(Collect collect);
    
    int deleteByPrimaryKey(String collectId);
}
