package cn.chat.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.CloseReason;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import cn.chat.pojo.Msg;
import cn.chat.service.MsgService;
import cn.chat.utils.JsonUtils;
import cn.chat.utils.SpringUtil;

@ServerEndpoint("/websocket/{roomId}")
public class EchoSocket {
	//	public static Map<String, Session> conns = new HashMap<String, Session>();// session的map
	public static Map<String,Map<String, Session>> conns = new HashMap<String, Map<String, Session>>();// session的map
	/**
	 * 客户端有连接时调用这个方法
	 */
	@OnOpen
	public void open(@PathParam("roomId") String roomId,Session session, EndpointConfig config) {
		if(roomId.contains(":one:")) {
			openChatFriend(roomId,session,config);
		}else {
			openChatALL(roomId,session,config);
		}

	}
	//好友房间
	private void openChatFriend(String roomId,Session session, EndpointConfig config) {
		Session s = null;
		String room[]=roomId.split(":");
		String froomId=room[2]+":"+room[1]+":"+room[0];
		if(conns.containsKey(roomId)) {
			Map<String, Session> map = conns.get(roomId);
			map.put(room[0], session);
		}else if(conns.containsKey(froomId)){
			Map<String, Session> map = conns.get(froomId);
			map.put(room[0], session);
		}else {
			Map<String, Session> map = conns.get(roomId);
			synchronized (conns) {
				if(map==null) {
					map=new HashMap<>();
					conns.put(roomId, map);
				}
			}
			map.put(room[0], session);
		}
		try {
			MsgService service = SpringUtil.getBean(MsgService.class);
			List<Msg> list = service.findMsgBySF(room[2], room[0]);//查找数据库中的数据
			session.getBasicRemote().sendText(JsonUtils.objectToJson(list));
			Msg msg=new Msg();
			msg.setIsread("1");
			msg.setUsername(room[2]);
			msg.setFrom(room[0]);
			service.updateMsg(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//聊天室房间
	private void openChatALL(String roomId,Session session, EndpointConfig config) {
		Session s = null;
		Map<String, Session> map = conns.get(roomId);
		synchronized (conns) {
			if(map==null) {
				map=new HashMap<>();
				conns.put(roomId, map);
			}
			for (String conn : map.keySet()) {// 遍历已有的session（即已有的连接）
				s = map.get(conn);
				try {
					s.getBasicRemote().sendText(session.getId() + "进入了聊天室");// 根据session发送到对应页面
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

		}
		map.put(session.getId(), session);
	}
	/**
	 * 客户端连接断开就会调用此方法
	 */
	@OnClose
	public void close(@PathParam("roomId") String roomId,Session session, CloseReason reason) {
		if(roomId.contains(":one:")) {
			openChatFriendclose(roomId,session,reason);
		}else {
			openChatALLclose(roomId,session,reason);
		}

	}

	private void openChatALLclose(String roomId, Session session, CloseReason reason) {
		Map<String, Session> map = conns.get(roomId);
		map.remove(session.getId());
	}
	private void openChatFriendclose(String roomId, Session session, CloseReason reason) {
		Session s = null;
		// TODO Auto-generated method stub
		String room[]=roomId.split(":");
		String froomId=room[2]+":"+room[1]+":"+room[0];
		if(conns.containsKey(roomId)) {
			Map<String, Session> map = conns.get(roomId);
			map.remove(room[0]);
		}else if(conns.containsKey(froomId)){
			Map<String, Session> map = conns.get(froomId);
			map.remove(room[0]);
		}else {

		}
	}
	/**
	 * 接收到客户端的信息
	 * 
	 * @param msg
	 * @param last
	 */
	@OnMessage
	public void message(@PathParam("roomId") String roomId,Session session, String message) {
		if(roomId.contains(":one:")) {
			openChatFriendmessage(roomId,session,message);
		}else {
			openChatALLmessage(roomId,session,message);
		}
	}
	private void openChatALLmessage(String roomId, Session session, String message) {
		// TODO Auto-generated method stub
		Session s = null;
		Map<String, Session> map = conns.get(roomId);
		for (String conn : map.keySet()) {
			s = map.get(conn);
			synchronized (s) {
				try {
					s.getBasicRemote()
					.sendText(message);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	private void openChatOnetoOnemessage(String roomId, Session session, String message) {
		// TODO Auto-generated method stub
		Msg msg = JsonUtils.jsonToPojo(message, Msg.class);
		MsgService service = SpringUtil.getBean(MsgService.class);
		Session s = null;
		Map<String, Session> map = conns.get(roomId);
		if(map.size()<2) {//说明已经离线
			if(map.containsKey(msg.getUsername())) {//将消息存入数据库
				try {
					msg.setIsread("0");
					service.saveMsg(msg);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		for (String conn : map.keySet()) {
			s = map.get(conn);
			try {
				s.getBasicRemote()
				.sendText(message);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	private void openChatFriendmessage(String roomId, Session session, String message) {
		String room[]=roomId.split(":");
		String froomId=room[2]+":"+room[1]+":"+room[0];
		if(conns.containsKey(roomId)) {
			openChatOnetoOnemessage(roomId,session,message);
		}else if(conns.containsKey(froomId)){
			openChatOnetoOnemessage(froomId,session,message);
		}else {

		}
	}
	/*	@OnMessage
	public void message(Session session, String message,String userName) {
		System.out.println("页面传值："+message+"页面传的名字："+userName);
	}*/
	/**
	 * 错误监听（当没有关闭socket连接就关闭浏览器会异常）
	 */
	@OnError
	public void error(@PathParam("roomId") String roomId,Session session, Throwable error) {
		String id = session.getId();
		System.out.println("出错的session的id是" + id);
		if(roomId.contains(":one:")) {
			openChatFriendError(roomId,session,error);
		}else {
			openChatALLError(roomId,session,error);
		}
	}

	private void openChatFriendError(String roomId, Session session, Throwable error) {
		// TODO Auto-generated method stub
		Session s = null;
		// TODO Auto-generated method stub
		String room[]=roomId.split(":");
		String froomId=room[2]+":"+room[1]+":"+room[0];
		if(conns.containsKey(roomId)) {
			Map<String, Session> map = conns.get(roomId);
			map.remove(room[0]);
		}else if(conns.containsKey(froomId)){
			Map<String, Session> map = conns.get(froomId);
			map.remove(room[0]);
		}else {

		}
	}
	private void openChatALLError(String roomId, Session session, Throwable error) {
		// TODO Auto-generated method stub
		Map<String, Session> map = conns.get(roomId);
		map.remove(session.getId());
	}
	public EchoSocket() {
		System.out.println("Socket对象已创建");
		// 通过对象的创建可以知道不同socket之间的通信不会共享成员变量
	}

}
