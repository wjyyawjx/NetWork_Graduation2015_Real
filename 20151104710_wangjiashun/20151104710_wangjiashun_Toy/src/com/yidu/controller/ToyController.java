package com.yidu.controller;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.yidu.common.Message;
import com.yidu.common.Tools;
import com.yidu.controller.vo.PhotoVo;
import com.yidu.controller.vo.ToyVo;
import com.yidu.dao.PhotoMapper;
import com.yidu.domain.Photo;
import com.yidu.domain.Toy;
import com.yidu.domain.ToyType;
import com.yidu.service.PhotoService;
import com.yidu.service.ToyService;
import com.yidu.service.ToytypeService;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 王佳顺
 * @since 2018-10-18
 */
@Controller
@RequestMapping("/toy")
public class ToyController {
	
	@Resource
	ToyService toyService;
	
	@Resource
	PhotoService photoService;
	
	@RequestMapping("/findAll")
	@ResponseBody
	public Map<String, Object> findAll(Integer page,@RequestParam(value="limit") Integer pageSize,@RequestParam(value="key[toyName]",required=false) String name){
		ToyVo vo = new ToyVo();
		if(name==null||"".equals(name)) {
			vo.setToyName("");
		}else {
			vo.setToyName(name);
		}
		PageInfo<ToyVo> list = toyService.findAll(page,pageSize,vo);
		
		Map<String, Object> m = new HashMap<>();
		m.put("code", 0);
		m.put("msg", "");
		m.put("count", list.getTotal());
		m.put("data", list.getList());
		
		return m;
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public Message delete(String id) {
		System.out.println("iiiiiiiid:"+id);
		int row = toyService.delete(id);
		Message msg = new Message();
		if(row>0) {
			msg.setMsg("删除成功!!");
			msg.setState(1);
		}else {
			msg.setMsg("删除失败");
			msg.setState(0);
		}
		return msg;
	}
	
	@RequestMapping("/findById")
	@ResponseBody
	public ToyVo findById(String id){
		System.err.println("iiiiiiiiiiid:"+id);
		System.out.println("进来了根据id查询的方法........");
		return toyService.findById(id);
	}
	
	@RequestMapping("/findType")
	@ResponseBody
	public List<ToyType> findType(){
		return toyService.findType();
	}
	
	@RequestMapping("/addOrUpdate")
	public void addOrUpdate(
				@RequestParam(value = "photoPaths", required = false) 
				MultipartFile file,
				ToyVo vo,
				HttpServletRequest request) throws IllegalStateException, IOException{
		
		//将图片保存到upload文件夹,并且返回一个新的文件地址
		String path = Tools.getRealPath(request, file);
		System.out.println(1111);
		PhotoVo pVo = new PhotoVo();
		pVo.setPhotoPath(path);
		pVo.setPhotoRemark(null);
		photoService.addOrUpdate(pVo);
		
		
		Photo photo = photoService.findByPath(path);
		System.out.println("新增图片id："+photo.getPhotoId());
		if(photo.getPhotoId()!=null &&!"".equals(photo.getPhotoId())) {
			vo.setPhotoId(photo.getPhotoId());
		}
		toyService.addOrUpdate(vo);
		
	}
	
	@RequestMapping("/findTypeById")
	@ResponseBody
	public List<ToyVo> findTypeById(String typeId){
		System.out.println("11235465481651861111111"+typeId);
		
		return toyService.findByTypeId(typeId);
	}
	
	/**
	 * 查询所有
	 */
	@RequestMapping("/selectAll")
	@ResponseBody
	public List<ToyVo> selectAll() {
		return toyService.selectAll();
	}
	
	
	/**
	 * 显示所有玩具的方法 
	 */
	@RequestMapping("/queryAll")
	@ResponseBody
	public List<ToyVo> queryAll(ToyVo vo) {
		
		return toyService.queryAll(vo);
	}
	
	
}

