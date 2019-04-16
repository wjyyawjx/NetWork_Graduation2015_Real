
package cn.chat.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.chat.dao.FriendDao;
import cn.chat.dao.UserDao;
import cn.chat.pojo.Friend;
import cn.chat.pojo.UserBean;
import cn.chat.service.RoomService;
import cn.chat.service.UserService;

@Controller
@RequestMapping("/friend")
public class FriendController {
	@Autowired
	private RoomService roomService;

	@Autowired
	private FriendDao friendDao;

	@Autowired
	private UserService userService;
	@Autowired
	private UserDao userDao;

	@RequestMapping("/{friend1}/{friend2}")
	public String roomInfo(@PathVariable("friend1")Integer friend1,@PathVariable("friend2")Integer friend2,Model model) {
		model.addAttribute("roomId", friend1+":one:"+friend2);
		model.addAttribute("friend",friend1+":one:"+friend2);
		model.addAttribute("friendId",friend2);
		return "friendroom";
	}
	@RequestMapping("/info/{friend2}")
	public String friendInfo(@PathVariable("friend2")String friend2,HttpSession session, HttpServletRequest request, HttpServletResponse response,
			Model model) {
		UserBean userBean = userDao.findUserByName(friend2);
		request.setAttribute("userBean", userBean);
		return "friendlinfo";
	}
	@RequestMapping("/delete/{friendUserName}")
	public String roomInfo(@PathVariable("friendUserName")String  friendUserName,Model model,HttpSession session) {
		UserBean suserBean = (UserBean)session.getAttribute("userBean");
		friendDao.deleteFrient(suserBean.getUserName(), friendUserName);
		friendDao.deleteFrient(friendUserName, suserBean.getUserName());
		model.addAttribute("msg", "<script>alert('删除成功!');</script>");	
		List<Friend> friend = userService.myFriend(suserBean.getUserName());
		model.addAttribute("friend", friend);
		return "friendlist";
	}
	@RequestMapping("/validate/{friendUserName}/{status}")
	public String validate(@PathVariable("friendUserName")String  friendUserName,@PathVariable("status")String  status,Model model,HttpSession session) {
		UserBean suserBean = (UserBean)session.getAttribute("userBean");
		friendDao.updateFriendIsValidate(friendUserName, suserBean.getUserName(),status);
		userService.addFriend(suserBean.getUserName(), friendUserName);
		friendDao.updateFriendIsValidate(suserBean.getUserName(),friendUserName,status);
		model.addAttribute("msg", "<script>alert('操作成功!');</script>");	
		List<Friend> list = friendDao.selectFriendIsValidate(suserBean.getUserName());
		model.addAttribute("listValidate", list);
		List<Friend> listO = friendDao.selectFriendIsValidateO(suserBean.getUserName());
		model.addAttribute("listO", listO);
		return "addfriend";
	}

}
