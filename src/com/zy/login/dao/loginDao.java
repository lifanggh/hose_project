package com.zy.login.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.login.entity.Pow;
import com.zy.login.entity.User;

public interface loginDao {

	User getLogin(String name);

	void addResgister(User user);

	List<Pow> getPow(Integer id);

	List<Pow> getPowByName(String name);

	List<Pow> getMenuByPid(Integer pid);

	List<User> getUserAll();

	void delById(Integer id);

	void addUser(User user);

	void upUser(User user);

	void delByIds(@Param("ids") String ids);

	 
	

}
