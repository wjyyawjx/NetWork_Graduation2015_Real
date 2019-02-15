package cn.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.TextMessage;

import cn.chat.websocket.MyHandler;

import javax.servlet.http.HttpSession;

 
@Controller
public class WebSocketController {

    @Autowired
    MyHandler handler;

    //玩家登录
    @RequestMapping("/login/{userId}")
    public ModelAndView login(HttpSession session, @PathVariable("userId") Integer userId) {
        System.out.println("登录接口,userId=" + userId);
        session.setAttribute("userId", userId);
        System.out.println(session.getAttribute("userId"));
        return new ModelAndView("phone/websocket_test");
    }

    //模拟给指定玩家发消息
    @RequestMapping("/message")
    @ResponseBody
    public String sendMessage(Integer userId,String message) {
        boolean hasSend = handler.sendMessageToUser(userId, new TextMessage(message));
        System.out.println(hasSend);
        return "success";
    }


    //模拟给所有玩家发消息
    @RequestMapping("/message/all")
    @ResponseBody
    public String sendAll(String message) {
        boolean hasSend = handler.sendMessageToAllUsers(new TextMessage(message));
        System.out.println(hasSend);
        return "success";
    }

}