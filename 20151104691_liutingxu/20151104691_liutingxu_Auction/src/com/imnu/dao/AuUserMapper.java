package com.imnu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import com.imnu.model.AuUser;



public interface AuUserMapper {
    int deleteByPrimaryKey(String userId);

    int insert(AuUser record);

    int insertSelective(AuUser record);

    AuUser selectByPrimaryKey(String  userId);

    int updateByPrimaryKeySelective(AuUser record);

    int updateByPrimaryKey(AuUser record);
    
    public List<AuUser> queryAll();
    
    /**
     * 登录
     * @param user
     * @return
     */
    public AuUser login(AuUser user);

	List<AuUser> findAlls();
	/**
	 * 后台登录注册
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
	@Select({"<script>",
			" select * from au_user where 1=1",
			"<if test='userName!=null' >",
			" and user_name like concat('%',#{userName},'%') ",
			"</if>",	
			"</script>"})
	@ResultMap("com.yidu.dao.AuUserMapper.BaseResultMap")
	List<AuUser> findByUser(@Param("userName")String userName);
}