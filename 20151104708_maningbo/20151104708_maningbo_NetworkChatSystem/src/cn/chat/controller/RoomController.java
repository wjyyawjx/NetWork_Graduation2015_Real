
package cn.chat.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.chat.dao.RoomDao;
import cn.chat.pojo.Room;
import cn.chat.pojo.UserBean;
import cn.chat.service.RoomService;

@Controller
@RequestMapping("/room")
public class RoomController {
	@Autowired
	private RoomService roomService;
	
	@Autowired
	private RoomDao roomDao;

	
	
	@RequestMapping("/list.action")
	public String toRoomList(Model model) {
		model.addAttribute("rooms", roomService.findAllRooms());
		return "roomlist";
	}
	@RequestMapping("/addpage.action")
	public String addpage(Model model,HttpSession session) {
		UserBean userBean =(UserBean) session.getAttribute("userBean");
		List<Room> list = roomDao.findAllRoomsByUserId(userBean.getId());
		model.addAttribute("roomList", list);
		return "addpage";
	}
	@RequestMapping("/add")
	public String add(Room room,HttpSession session,Model model) {
		if(room.getName()==null||"".equals(room.getName())) {
			model.addAttribute("success", "<script>alert('name不能为空!');</script>");	
			return "addpage";
		}
		Room dbRoom = roomService.findRoomsByName(room.getName());
		if(dbRoom!=null) {
			model.addAttribute("success", "<script>alert('房间名称已经存在!');</script>");	
			return "addpage";
		}
		UserBean userBean =(UserBean) session.getAttribute("userBean");
		room.setUserid(userBean.getId());
		room.setStatus("00");
		roomService.add(room);
		model.addAttribute("success", "<script>alert('提交成功等待审核!');</script>");
		List<Room> list = roomDao.findAllRoomsByUserId(userBean.getId());
		model.addAttribute("roomList", list);
		return "addpage";
	}
	
	@RequestMapping("/roominfo/{id}")
	public String roomInfo(@PathVariable("id")Integer id,Model model) {
		model.addAttribute("roomId", id);
		return "chatroom";
	}
	@RequestMapping(value="/updateName", consumes = "application/json")
	@ResponseBody
	public HashMap<String, Object> updateName(@RequestBody Room room,Model model) {
		roomDao.updateRoomName(room.getId(), room.getName());
		HashMap<String, Object> msg=new HashMap<>();
		msg.put("code", 200);
		msg.put("msg", "修改成功");
		return msg;
	}
	@RequestMapping(value="/updateStatus", consumes = "application/json")
	@ResponseBody
	public HashMap<String, Object> updateStatus(@RequestBody Room room,Model model) {
		roomDao.updateRoomStatus(room.getId(), room.getStatus());
		HashMap<String, Object> msg=new HashMap<>();
		msg.put("code", 200);
		msg.put("msg", "修改成功");
		return msg;
	}

}
