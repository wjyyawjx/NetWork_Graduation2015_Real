package com.yidu.controller;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yidu.common.Message;
import com.yidu.common.Tools;
import com.yidu.controller.vo.CollectVo;
import com.yidu.domain.Collect;
import com.yidu.domain.ToyType;
import com.yidu.domain.User;
import com.yidu.service.CollectService;


import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

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
@RequestMapping("/collect")
public class CollectController {
	@Resource
	private CollectService collectService;

	
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	@RequestMapping("deletes") 
	@ResponseBody
	public int deletes(String collectId){
		 System.out.println(collectId);
		
				
		return collectService.deleteByPrimaryKey(collectId);
	}
	
	/**
	 * 查询
	 * @param session
	 * @return
	 */
	@RequestMapping("selectfin")
	@ResponseBody
	public List<CollectVo> selectfin(HttpSession session){
		User user=(User) session.getAttribute("user");
		System.out.println("用户id:"+user.getUserId());
		return collectService.selectfin(user.getUserId());
	}
	
	
	/**
	 * 增加的方法
	 * @param toytype
	 * @return
	 */
	@RequestMapping("/insert")
	@ResponseBody
	public Message insert(Collect collect) {
		System.out.println("==================ID:"+collect.getCollectId()+"=========");
		Message message=new Message();	
		int rows = collectService.add(collect);
		if(rows>0) {
			message.setState(1);
			message.setMsg("操作成功");
		}else {
			message.setState(0);
			message.setMsg("操作失败");
		}
		
		return message;
	}
}

