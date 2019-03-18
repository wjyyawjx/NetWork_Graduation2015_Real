package com.lyh.springboot.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lyh.springboot.pojo.Place;
import com.lyh.springboot.service.PlaceService;

@Controller
@RequestMapping("config")
public class PlaceController {
	@Autowired
	PlaceService placeService;

	@RequestMapping("listPlace")
	public String list(Model model) {
		List<Place> ps = placeService.list();
		model.addAttribute("ps", ps);
		return "listPlace";
	}

	@RequestMapping("editPlace")
	public String list(Model model, long id) {
		Place place = placeService.get(id);
		model.addAttribute("place", place);
		return "editPlace";
	}

	@RequestMapping("updatePlace")
	public String update(Place place) {

		placeService.update(place);
		return "redirect:listPlace";
	}

	@RequestMapping("addPlace")
	public String list(Model model, Place place) {
		placeService.add(place);
		return "redirect:listPlace";
	}

	@RequestMapping("deletePlace")
	public String delete(Model model, long id) {
		placeService.delete(id);
		return "redirect:listPlace";
	}

}