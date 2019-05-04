
package cn.chat.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.chat.dao.RoomDao;
import cn.chat.dao.UserDao;
import cn.chat.pojo.Friend;
import cn.chat.pojo.Room;
import cn.chat.pojo.UserBean;
import cn.chat.service.RoomService;
import cn.chat.service.UserService;


@Service
@Transactional
public class RoomServiceImpl implements RoomService {

	@Autowired
	private RoomDao roomDao;
	
	@Override
	public List<Room> findAllRooms() {
		return roomDao.findAllRooms();
	}

	@Override
	public int add(Room room) {
		// TODO Auto-generated method stub
		return roomDao.add(room);
	}

	@Override
	public Room findRoomsByName(String name) {
		// TODO Auto-generated method stub
		return roomDao.findRoomsByName(name);
	}
}
