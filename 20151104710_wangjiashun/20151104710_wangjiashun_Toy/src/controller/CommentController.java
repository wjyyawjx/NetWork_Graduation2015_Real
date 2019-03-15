package com.yidu.controller;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.yidu.common.Message;
import com.yidu.common.Pages;
import com.yidu.common.Tools;
import com.yidu.controller.vo.CommentVo;
import com.yidu.controller.vo.PhotoVo;
import com.yidu.controller.vo.ToyVo;
import com.yidu.domain.Comment;
import com.yidu.domain.Photo;
import com.yidu.domain.Toy;
import com.yidu.domain.ToyType;
import com.yidu.domain.User;
import com.yidu.service.CommentService;
import com.yidu.service.PhotoService;

import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author wujie
 * @since 2018-10-18
 */
@Controller
@RequestMapping("/comment")
public class CommentController {

	@Resource
	CommentService commentService;
	
	@Resource
	PhotoService photoService;
	
	/**
	 * 查询所有
	 * @param page
	 * @param pageSize
	 * @param name
	 * @return
	 */
	@RequestMapping("/findAll")
	@ResponseBody
	public Map<String, Object> findAll(Integer page,@RequestParam(value="limit") Integer pageSize,@RequestParam(value="key[commentContent]",required=false) String name){
		CommentVo vo = new CommentVo();
		if(name==null||"".equals(name)) {
			vo.setCommentContent("");
		}else{
			vo.setCommentContent(name);
		}
		
		PageInfo<CommentVo> list = commentService.findAll(page, pageSize, vo);
		
		Map<String, Object> m = new HashMap<>();
		m.put("code", 0);
		m.put("msg", "");
		m.put("count", list.getTotal());
		m.put("data", list.getList());
		
		return m;
	}
	/**
	 * 删除的方法
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Message delete(String id) {
		System.out.println("iiiiiiiid:"+id);
		int row = commentService.delete(id);
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
	
	
	/**
	 * 根据玩具id查询
	 * @param id
	 * @return
	 */
	@RequestMapping("/findByToyId")
	@ResponseBody
	public List<CommentVo> findByToyId(String id){
		return commentService.findByToyId(id);
	}
	
	/**
	 * 查询评论行数
	 * @param id
	 * @return
	 */
	@RequestMapping("/findCommentRow")
	@ResponseBody
	public Message findCommentRow(String id){
		Message message = new Message();
		Integer row = commentService.findCommentRow(id);
		message.setState(row);
		return message;
	}
	
	/**
	 * 增加和修改的方法
	 * @param file
	 * @param vo
	 * @param request
	 * @throws IllegalStateException
	 * @throws IOException
	 * @throws ParseException
	 */
	@RequestMapping("/addOrUpdate")
	@ResponseBody
	public Message addOrUpdate(
				@RequestParam(value = "commentPhotos", required = false) 
				MultipartFile file,
				CommentVo vo,
				HttpServletRequest request) throws IllegalStateException, IOException, ParseException{
		System.out.println("评论时间："+vo.getCommentTime());
		//将图片保存到upload文件夹,并且返回一个新的文件地址
		String path = Tools.getRealPath(request, file);
		PhotoVo pVo = new PhotoVo();
		pVo.setPhotoPath(path);
		if(vo.getCommentEvaluate().equals("1")) {
			vo.setCommentEvaluate("满意");
		}else if(vo.getCommentEvaluate().equals("2")) {
			vo.setCommentEvaluate("一般");
		}else if(vo.getCommentEvaluate().equals("3")) {
			vo.setCommentEvaluate("不满意");
		}
		photoService.addOrUpdate(pVo);
		
		HttpSession session = request.getSession();
		User user= (User) session.getAttribute("user");
		vo.setUserId(user.getUserId());
		System.out.println("userid:     "+vo.getUserId());
		Photo photo = photoService.findByPath(path);
		System.out.println("saddddddddddddddddddddddddddddddddd"+vo.getCommentId());
		System.out.println("新增图片id："+photo.getPhotoId());
		if(photo.getPhotoId()!=null &&!"".equals(photo.getPhotoId())) {
			vo.setCommentPhoto(photo.getPhotoId());
		}
		commentService.addOrUpdate(vo);
		
		Message message = new Message();
		message.setMsg("操作成功");
		message.setState(1);
		
		return message;
	}
	
	/**
	 * 获取session
	 * @param session
	 * @return
	 */
	@RequestMapping("/getSession")
	@ResponseBody
	public User getSession(HttpSession session) {
		User user = (User) session.getAttribute("user");
		System.err.println("进入session"+user);
		if(user!=null&&!"".equals(user)) {
			return user;
		}else {
			User users = new User();
			return users;
		}
		
		
	}
	
}

