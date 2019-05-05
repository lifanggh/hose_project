package com.zy.login.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.login.entity.User;
import com.zy.login.service.loginService;

@Controller
public class loginUser {
@Autowired	
private loginService loginService;
	
//登录 	
	@RequestMapping("/login")
	@ResponseBody//返回的数据类型                         //方法传参
public Map<String, Object> loginUser(User user ,HttpServletRequest request) { //前端传来用户密码和name 
	Map<String, Object> map=new HashMap<>();
	
	try {
		map=loginService.getLogin(user,request);    //拿数据去数据库对比看是不是正确
	//map.put("success", true);
	} catch (Exception e) {
		e.printStackTrace();
		
	}
	return map;
}	
	@RequestMapping("/add")
	public String addUser() {
		
	return "resgister";
	
	}
	//进入首页
	@RequestMapping("/index")
	public String showye() {
		
		return"index";
	}
	@RequestMapping("/addResgister")
	public void addResgister(User user) {
		
		loginService.addResgister(user);
	}
	
	@RequestMapping("/getMenu")
	@ResponseBody
	public List<Map<String, Object>> getMenu(Integer pid) {
		return loginService.getMenuByPid(pid);
	}
}
