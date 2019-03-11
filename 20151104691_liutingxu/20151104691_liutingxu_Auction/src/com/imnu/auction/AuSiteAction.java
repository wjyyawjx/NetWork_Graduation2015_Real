package com.imnu.auction;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.imnu.common.Message;
import com.imnu.common.Page;
import com.imnu.model.AuSite;
import com.imnu.model.AuUser;
import com.imnu.service.AuSiteService;



/**
 * 
 * 描述:地址表
 */
@Controller
@RequestMapping("/site")
public class AuSiteAction {
	
	@Resource
	public AuSiteService siteService;
	
	/**
	 * 修改上屏
	 * @return
	 */
	@RequestMapping("findById")
	@ResponseBody
	public AuSite findById(String siId){
		return siteService.selectByPrimaryKey(siId);
	}
	/**
	 * 查询总行数
	 * @return
	 */
	@RequestMapping("findCount")
	@ResponseBody
	public Page findCount(AuSite site){
		Page page = new Page();
		Long l = siteService.findCount(site);
		page.setTotalRows(l.intValue());
		return page;
	}
	/**
	 * 查询所有
	 * @return
	 */
	@RequestMapping("queryAll")
	@ResponseBody
	public List<AuSite> queryAll(AuSite site){
		Page page = new Page();
		if(site!=null&&site.getCurPage()!=null){
			page.setCurPage(site.getCurPage());
		}else{
			page.setCurPage(1);
		}
		return siteService.queryAll(site,page);
	}

	/**
	 * 增加或者修改
	 * @param site
	 * @return
	 */
	@RequestMapping("addOrUpdate")
	@ResponseBody
	public Message addOrUpdate(AuSite site){
		Message msg = new Message();
		int rows = siteService.addOrUpdate(site);
		if(rows > 0){
			msg.setState(1);
		}else{
			msg.setState(0);
		}
		return msg;
	}
	/**
	 * 根据ID删除商品
	 * @param comId 商品ID
	 * @return 信息类
	 */
	@RequestMapping("delete")
	@ResponseBody
	public Message delete(String siId){
		Message msg = new Message();
		int row = siteService.deleteByPrimaryKey(siId);
		if(row > 0){
			msg.setState(1);
		}else{
			msg.setState(0);
		}
		return msg;
	}
	
	@RequestMapping("findByUserId")
	@ResponseBody
	public List<Map<String, Object>> findByUserId(String userId) {
		List<Map<String, Object>> list=siteService.findByUserId(userId);
		return list;
	}
	
	@RequestMapping("addSite")
	@ResponseBody
	public int addSite(AuSite site,String s_province,String s_city,String s_county,HttpSession session) {
		AuUser user= (AuUser) session.getAttribute("user");
		site.setUserId(user.getUserId());
		site.setSiContent(s_province+s_city+s_county+site.getSiContent());
		int rows=siteService.insert(site);
		return rows;
	}
}
