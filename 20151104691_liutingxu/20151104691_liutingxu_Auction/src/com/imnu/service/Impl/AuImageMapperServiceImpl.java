package com.imnu.service.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.imnu.common.Page;
import com.imnu.dao.AuImageMapper;
import com.imnu.model.AuCommodity;
import com.imnu.model.AuImage;
import com.imnu.service.AuImageMapperService;




/**
 * 
 * 描述:图片表的实现类
 */
@Service
public class AuImageMapperServiceImpl implements AuImageMapperService{

	@Resource
	AuImageMapper AuImageMapperDao;
	
	/**
	 * 实现显示所有
	 */
	@Override
	public List<AuImage> findAll(Page page,AuImage auImage) {
		Map<String,Object> map=new HashMap<>();
		map.put("img",  auImage);
		map.put("curPage",page);
		//调用查询所有的方法
		return AuImageMapperDao.findAll(map);
	}

	/**
	 * 根据id删除
	 */
	@Override
	public int delete(String id) {
		//根据id删除
		return AuImageMapperDao.delete(id);
	}

	/**
	 * 增加的方法
	 * 判断增加或修改
	 */
	@Override
	public int addOrUpdate(AuImage record) {
		int rows=0;
		//判断图片id不为空
		if(record.getImId()!=null && !"".equals(record.getImId())){
			System.out.println("id+++++++++++"+record.getImId());
			//调用修改方法
			rows = AuImageMapperDao.updateByPrimaryKeySelective(record);
			System.out.println("id+++++++++++"+record.getImId());
		}else{
			//调用增加方法
			rows = AuImageMapperDao.insertSelective(record);
		}
		return rows;
	}

	@Override
	public AuImage selectByPrimaryKey(String imId) {
		return AuImageMapperDao.selectByPrimaryKey(imId);
	}

	@Override
	public AuImage selectByType(String imId) {
		return AuImageMapperDao.selectByType(imId);
	}

	@Override
	public List<AuCommodity> findByType() {
		return AuImageMapperDao.findByType();
	}

	
	
	/**
	 * 查询总行数
	 */
	@Override
	public int findCount() {
		return AuImageMapperDao.findCount();
	}
		
	/**
	 * 根据id查询
	 */
	@Override
	public List<AuImage> findBycomId(String comId,String imType) {
		AuImage image=new AuImage();
		image.setComId(comId);
		image.setImType(imType);
		//调用根据商品id查询
		return AuImageMapperDao.findBycomId(image);
	}

}
