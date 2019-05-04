package com.yidu.service.impl;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.xml.ws.soap.Addressing;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yidu.dao.AddressMapper;
import com.yidu.domain.Address;
import com.yidu.domain.User;
import com.yidu.service.AddressService;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author wujie
 * @since 2018-10-18
 */
@Service
public class AddressServiceImpl  implements AddressService {
	@Resource
	AddressMapper addressDao;
	@Override
	public PageInfo<Address> findAll(Integer page, Integer pageSize, Address addre) {
		//分页
		PageHelper.startPage(page,pageSize);
		//通过转过来的地址对象 查询出地址集合
		List<Address> address = addressDao.selectAll(addre);
		/**
		 * 循环获取配送地址将配送地址","替换""
		 */
		for (Address address2 : address) {
			address2.setAddressName(address2.getAddressName().replaceAll(",", ""));
		}
		//用PageInfo 把查询出来的地址集合装起来
		PageInfo<Address> addressPageInfo = new PageInfo<>(address);
		return addressPageInfo;
	}
	@Override
	public int delete(String addressId) {
		return addressDao.deleteByPrimaryKey(addressId);
	}
	@Override
	public int insertorUpdate(Address address) {
		System.out.println("前台页面传过来的id："+address.getAddressId());
		int rows=0;
		//判断转过来的地址id是否为空
		if(address.getAddressId()!=null && !"".equals(address.getAddressId())) {
			System.out.println("进入修改的方法");
			 rows=addressDao.updateByPrimaryKeySelective(address);
		}else {
			 System.out.println("进入增加的方法");
			 String  uuid=UUID.randomUUID().toString().replaceAll("-", "");
			 address.setAddressId(uuid);
			 rows=addressDao.insertSelective(address);
		}
		return rows;
	}
	@Override
	public Address selectId(String addressId) {
		Address addre = addressDao.selectByPrimaryKey(addressId);
		
		return addre;
	}
	@Override
	public int addUser(User user) {
//		
//		return addressDao.insertUser(user);
		return 0;
	}
	@Override
	public String findUserId() {
//		// TODO Auto-generated method stub
//		return addressDao.findUserId();
		return "1";
	}
	@Override
	public int insert(Address address) {
		//判断地址id是否为空
		if(address.getAddressId()!=null && !"".equals(address.getAddressId())) {
			System.out.println("进入前台修改");
			return addressDao.updateByPrimaryKeySelective(address);
		}else {
			String  uuid=UUID.randomUUID().toString().replaceAll("-", "");
			address.setAddressId(uuid);
			System.out.println("进入前台增加");
			return addressDao.insertSelective(address);
			
		}
	}
	@Override
	public List<Address> selectAll(String userId) {
		return addressDao.selectAllByUserId(userId);
	}

}
