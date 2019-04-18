package com.yidu.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.yidu.controller.vo.UserVo;
import com.yidu.domain.User;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 王佳顺
 * @since 2018-10-18
 */
public interface UserService  {
	
	/**
	 * 注册会员的方法
	 * @param user 用户对象
	 * @return int
	 */
	public int register(User user);
	
	
	/**
	 * 查询用户对象
	 * @param user 用户对象
	 * @return 用户对象
	 */
	public User findByUser(User user);
	
	/**
	 * 登录前台会员的方法
	 * @param user  用户对象
	 * @return 用户对象
	 */
	public User login(User user);
	/**
	 * 查询所有的方法
	 * @return 用户对象集合
	 */
	public List<User> findAll();
	/**
	 * 查询总行数的方法
	 * @param 用户对象
	 * @return int
	 */
	public int queryRows(User user);
	/**
	 * 删除的方法
	 * @param userId 用户id
	 * @return int
	 */
	public int delete(String userId);
	/**
	 * 增加和修改的方法
	 * @param  用户对象
	 * @return int
	 */
	public int insertorUpdate(User user);
	/**
	 * 通过id查询出User对象
	 * @param userId 用户id
	 * @return 用户对象
	 */
	public User selectId(String userId);
	
	/**
	 * 条件查询，查询所有，分页
	 * @param page 开始的行数
	 * @param pageSize 总页数
	 * @param user 用户对象
	 * @return 用户对象集合
	 */
	public PageInfo<User> findAll(Integer page, Integer pageSize, User user);
	/**
	 * 登录后台 
	 * @param user 用户对象
	 * @return 用户对象
	 */
	public User backLogin(User user);
	
	
	public List<UserVo> findByBill(String userName);
	
}
