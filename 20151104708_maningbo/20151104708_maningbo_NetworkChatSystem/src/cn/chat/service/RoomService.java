
package cn.chat.service;

import java.util.List;

import cn.chat.pojo.Friend;
import cn.chat.pojo.Room;
import cn.chat.pojo.UserBean;

public interface RoomService {
	List<Room> findAllRooms();
	int add(Room room);
	Room findRoomsByName(String name);
}
