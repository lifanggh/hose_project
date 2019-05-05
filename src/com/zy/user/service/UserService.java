package com.zy.user.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.login.entity.User;

public interface UserService {

	List<User> getUserAll();

	void delById(Integer id);

	void addUser(User user);

	void upUser(User user);

	void delByIds(String ids);

}
