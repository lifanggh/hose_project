package com.zy.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.login.entity.User;
import com.zy.user.service.UserService;

@Controller
@RequestMapping("/UserManger")
public class UserController {

	@Autowired
	private UserService service;

	// 跳转到用户信息页面 此路径在数据库中
	@RequestMapping("/toUser")
	public String toUser() {
		return "user/user";
	}
	
	// 获取所有用户信息
	@RequestMapping("/getUserAll")
	@ResponseBody
	public List<User> getUserAll() {
		return service.getUserAll();

	}

	// 增加用户信息 1.跳转到页面
	@RequestMapping("/toAdd")
	public String toAdd(User user, Model model) {
		model.addAttribute("user", user);
		return "user/toAdd";
	}

	// 增加信息
	@RequestMapping("/addUser")
	@ResponseBody
	public Map<String, Object> addUser(User user) {
		HashMap<String, Object> map = new HashMap<>();
		try {
			service.addUser(user);
			map.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);
		}
		return map;

	}

	// 删除id 用户
	@RequestMapping("/delById")
	@ResponseBody
	public Map<String, Object> delById(Integer id) {
		HashMap<String, Object> map = new HashMap<>();
		try {
			service.delById(id);
			map.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);
		}
		return map;

	}

	// 修改用户信息
	@RequestMapping("/upUser")
	@ResponseBody
	public Map<String, Object> upUser(User user) {
		HashMap<String, Object> map = new HashMap<>();
		try {
			service.upUser(user);
			map.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);
		}
		return map;

	}

	// 批量删除
	@RequestMapping("/delByIds")
	@ResponseBody
	public Map<String, Object> delByIds(String ids) {
		HashMap<String, Object> map = new HashMap<>();
		try {
			service.delByIds(ids);
			map.put("success", true);

		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);
		}

		return map;
	}

}