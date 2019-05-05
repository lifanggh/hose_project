package com.zy.login.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.zy.login.entity.User;


public interface loginService {

	Map<String, Object> getLogin(User user, HttpServletRequest request);

	void addResgister(User user);

	List<Map<String, Object>> getMenuByPid(Integer pid);

	

}
