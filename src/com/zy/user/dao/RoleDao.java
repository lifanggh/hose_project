package com.zy.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.login.entity.Role;
import com.zy.login.entity.User_Role;

public interface RoleDao {

	List<Role> getRoleAll();

	void delById(Integer rid);

	void addRole(Role role);

	void upRole(Role role);

	void delByIds(@Param("rids") String rids);

	List<User_Role> getRoleById(Integer id);

	void delBy(Integer id);

	void addRoles(@Param("id")Integer id, @Param("ids")Integer[] ids);

	

}
