package com.lyh.springboot.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lyh.springboot.mapper.PlaceMapper;
import com.lyh.springboot.pojo.Laboratory;
import com.lyh.springboot.pojo.Place;
import com.lyh.springboot.pojo.PlaceExample;
import com.lyh.springboot.service.PlaceService;

@Service
public class PlaceServiceImpl implements PlaceService {

	@Autowired
	PlaceMapper placeMapper;
	
	@Override
	public List<Place> selectByPlaceId() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Place> listPlace() {
		// TODO Auto-generated method stub
		PlaceExample example = new PlaceExample();
		example.setOrderByClause("id desc");
		return placeMapper.selectByExample(example);
	}

	@Override
	public Place selectPlace(Laboratory lab) {
		// TODO Auto-generated method stub
		return placeMapper.selectByLabId(lab.getPlaceId());
	}


}
