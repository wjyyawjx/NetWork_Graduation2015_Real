package cn.chat.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import javax.websocket.CloseReason;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/websocket")
public class EchoSocket {
	public static Map<String, Session> conns = new HashMap<String, Session>();// session的map
	/**
	 * 客户端有连接时调用这个方法
	 */
	@OnOpen
	public void open(Session session, EndpointConfig config) {
		Session s = null;
        for (String conn : conns.keySet()) {// 遍历已有的session（即已有的连接）
            s = conns.get(conn);
            synchronized (s) {
                try {
                    s.getBasicRemote().sendText(session.getId() + "进入了聊天室");// 根据session发送到对应页面
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        conns.put(session.getId(), session);
	}

	/**
	 * 客户端连接断开就会调用此方法
	 */
	@OnClose
	public void close(Session session, CloseReason reason) {
		 //System.out.println("---------close---------" + session.getId());
        Session s = null;
        for (String conn : conns.keySet()) {
            s = conns.get(conn);
            if (s != session)
                synchronized (s) {
                    try {
                        s.getBasicRemote().sendText(session.getId() + "离开了聊天室");
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
        }
        conns.remove(session.getId());
	}

	/**
	 * 接收到客户端的信息
	 * 
	 * @param msg
	 * @param last
	 */
	@OnMessage
	public void message(Session session, String message) {
	
		 Session s = null;
	        for (String conn : conns.keySet()) {
	            s = conns.get(conn);
	            synchronized (s) {
	                try {
	                    s.getBasicRemote()
	                            .sendText((session.getId() == s.getId() ? "我" : session.getId()) + " 说:" + message);
	                } catch (IOException e) {
	                    e.printStackTrace();
	                }
	            }
	        }
	}

	/**
	 * 错误监听（当没有关闭socket连接就关闭浏览器会异常）
	 */
	@OnError
	public void error(Session session, Throwable error) {
		String id = session.getId();
		System.out.println("出错的session的id是" + id);
	}

	public EchoSocket() {
		System.out.println("Socket对象已创建");
		// 通过对象的创建可以知道不同socket之间的通信不会共享成员变量
	}

}
