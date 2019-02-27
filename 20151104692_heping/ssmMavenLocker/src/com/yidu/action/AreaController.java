package com.yidu.action;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yidu.domain.Area;
import com.yidu.domain.JsonMessage;
import com.yidu.service.AreaService;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author wuqi
 * @since 2018-10-17
 */
@Controller
@RequestMapping("/area")
public class AreaController {
	@Resource
	private AreaService area;
	/**
	 * 查询所有
	 * @return
	 */
	@RequestMapping("selectAll")
	@ResponseBody
	public List<Area> selectAll(){
		List<Area> list = area.selectAll();
		return list;
	}
	/**
	 * 删除
	 * @param arId
	 * @return
	 */
	@RequestMapping("deleteByPrimaryKey")
	@ResponseBody
	public JsonMessage deleteByPrimaryKey(String arId) {
		JsonMessage jm = new JsonMessage();
		int rows = area.deleteByPrimaryKey(arId);
		if(rows>0) {
			jm.setState(1);
		}else {
			jm.setState(0);
		}
		return jm;
	}
	/**
	 * 根据id查询
	 * @param arId
	 * @return
	 */
	@RequestMapping("selectByPrimaryKey")
	@ResponseBody
	public Area selectByPrimaryKey(String arId) {
		Area q = area.selectByPrimaryKey(arId);
		return q;
	}
	/**
	 * 增加或修改
	 * @param vo
	 * @return
	 */
	@RequestMapping("addOrUpdate")
	@ResponseBody
	public JsonMessage addOrUpdate(Area vo) {
		System.out.println("id"+vo.getArId()+"name"+vo.getArName());
		JsonMessage jm = new JsonMessage();
		int rows = area.addOrUpdate(vo);
		if(rows>0) {
			jm.setState(1);
		}else {
			jm.setState(0);
		}
		return jm;
	}
}































