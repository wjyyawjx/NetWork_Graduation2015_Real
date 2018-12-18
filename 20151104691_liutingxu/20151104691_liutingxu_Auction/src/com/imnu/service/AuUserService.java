package com.imnu.service;

import java.util.List;

import com.imnu.model.AuUser;


/**
 * 描述：用户服务类
 */
public interface AuUserService {
	int deleteByPrimaryKey(String userId);

    int insert(AuUser record);

    int insertSelective(AuUser record);

    AuUser selectByPrimaryKey(String  userId);

    int updateByPrimaryKeySelective(AuUser record);

    int updateByPrimaryKey(AuUser record);
    
    /**
     * 查询所有用户
     * @return 用户集合
     */
    public List<AuUser> queryAll();
    
   
    
    /**
     * 增加或者修改的方法
     * @param vo
     * @return
     */
    int addOrUpdate(AuUser user);

	/**
	 * 登录
	 * @return
	 */
    public AuUser login(AuUser user);

	List<AuUser> findAlls();
	/**
	 * 后台登录
	 * @param user
	 * @return
	 */
	AuUser htLogin(AuUser user);
	/**
	 * 判断用户名是否存在
	 * @param userName
	 * @return
	 */
	AuUser findUserName(String userName);
	/**
	 * 根据名字查询
	 * @param userName
	 * @return
	 */
	List<AuUser> findByUser(String userName);
}
