package com.imnu.auction;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.imnu.common.Message;
import com.imnu.common.Page;
import com.imnu.common.Tools;
import com.imnu.model.AuImage;
import com.imnu.service.AuImageMapperService;



/**
 * 图片表的action
 */
@Controller
@RequestMapping("/image")
public class AuImageMapperAction {
	
	
	@Resource
	AuImageMapperService service;
	
	/**
	 * 查询显示全部
	 * @return
	 */
	@RequestMapping("findAll")
	@ResponseBody
	public List<AuImage>findAll(String curPage,AuImage auImage) {
		Page page=new Page();
		page.setCurPage(Integer.valueOf(curPage));
		return service.findAll(page,auImage);
	}
	
	/**
	 *根据id删除
	 * @param imId
	 * @return
	 */
	@RequestMapping("delete")
	@ResponseBody
	public Message delete(String imId){
		Message msg = new Message();
		int rows=service.delete(imId);
		if(rows>0){
			msg.setState(1);
		}else{
			msg.setState(0);
		}
		return msg;
	}
	
	/**
	 * 增加或者修改
	 */
	@RequestMapping("addOrUpdate")
	public ModelAndView addOrUpdate(@RequestParam(value="imUploads",required=false) MultipartFile File,  HttpServletRequest request, AuImage record) throws IllegalStateException, IOException{
		ModelAndView msg = new ModelAndView();
		//将图片保存到upload文件夹,并且返回一个新的文件地址
		String path = Tools.getRealPath(request, File);
		record.setImUpload(path);
		service.addOrUpdate(record);
		msg.setViewName("redirect:/page/reception/index.html");
		return msg;
	}
	
	/**
	 * 根据id查询
	 */
	@RequestMapping("findById") 
	@ResponseBody
	public AuImage findById(String imId){
		AuImage img=service.selectByPrimaryKey(imId);
		return img;
		
	}

	
	/**
	 * 查询分页
	 */
	@RequestMapping("findCount") 
	@ResponseBody
	public Page findCount(String curPage){
		int count=service.findCount();
		Page page=new Page();
		page.setCurPage(Integer.valueOf(curPage));
		page.setTotalRows(count);
		return page;
	}
	
	
	/**
	 * 根据商品id查询
	 * @return
	 */
	@RequestMapping("findBycomId") 
	@ResponseBody
	public List<AuImage> findBycomId(String comId,String imType) {
		List<AuImage> image=service.findBycomId(comId,imType);
		return image;
	}
}
