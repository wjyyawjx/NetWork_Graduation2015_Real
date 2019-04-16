
package cn.chat.service;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import cn.chat.pojo.Friend;
import cn.chat.pojo.Msg;
import cn.chat.pojo.UserBean;

public interface MsgService {
	int saveMsg(Msg msg);
	int updateMsg(Msg msg);
	List<Msg> findMsgBySF(String sendusername,String fromusername);
}
