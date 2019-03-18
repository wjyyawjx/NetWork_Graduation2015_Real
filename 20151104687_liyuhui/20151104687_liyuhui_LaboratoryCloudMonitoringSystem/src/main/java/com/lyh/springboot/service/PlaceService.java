package com.lyh.springboot.service;

import java.util.List;

import com.lyh.springboot.pojo.Laboratory;
import com.lyh.springboot.pojo.Place;

public interface PlaceService {

	List<Place> listPlace();

	Place selectPlace(Laboratory lab);

	List<Place> list();

	Place get(long id);

	void update(Place place);

	void add(Place place);

	void delete(long id);

}
