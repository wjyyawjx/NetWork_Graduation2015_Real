package com.yidu.service.impl;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yidu.common.Pages;
import com.yidu.controller.vo.PhotoVo;
import com.yidu.dao.PhotoMapper;
import com.yidu.domain.Photo;
import com.yidu.service.PhotoService;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author wujie
 * @since 2018-10-18
 */
@Service
public class PhotoServiceImpl  implements PhotoService {

	@Resource
	private PhotoMapper photoMapper;
	
	
	@Override
	public int addOrUpdate(PhotoVo vo) {
		Photo fl = new Photo();
		BeanUtils.copyProperties(vo, fl);
		//如果copy不了的属性,则自己手动增加
		
		
		System.out.println("ID                         ："+fl.getPhotoId());
		int rows = 0;
		if(fl.getPhotoId()!=null && !"".equals(fl.getPhotoId())){
			System.out.println("111111111111111111111111111111111");
			rows = updateByPrimaryKeySelective(fl) ;
		}else{
			String  uuid=UUID.randomUUID().toString().replaceAll("-", "");
			fl.setPhotoId(uuid);
			rows = insertSelective(fl);
		}
		
		return rows;
	}

	@Override
	public int insertSelective(Photo record) {
		
		return  photoMapper.insertSelective(record);
	}

	@Override
	public int updateByPrimaryKeySelective(Photo record) {
		
		return photoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public List<Photo> selectAll(PhotoVo vo) {
		
		return photoMapper.selectAll(vo);
	}

	@Override
	public int deleteByPrimaryKey(String integer) {
		
		return photoMapper.deleteByPrimaryKey(integer);
	}

	@Override
	public PhotoVo selectByPrimaryKey(String flId) {
		Photo flower = photoMapper.selectByPrimaryKey(flId);
		
		PhotoVo vo = new PhotoVo();
		
		BeanUtils.copyProperties(flower, vo);
	
		return vo ;
	}

	@Override
	public int selectCount(PhotoVo vo) {
		
		return photoMapper.selectCount(vo);
	}

	@Override
	public PageInfo<Photo> findAll(Integer page, Integer pageSize, PhotoVo us) {
		PageHelper.startPage(page,pageSize);
		List<Photo> user = photoMapper.selectAll(us);
		PageInfo<Photo> userPageInfo = new PageInfo<>(user);
		return userPageInfo;

		
	}

	@Override
	public Photo findByPath(String path) {
		
		return photoMapper.findByPath(path);
	}


	

	
}
