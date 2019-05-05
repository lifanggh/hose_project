package com.zy.user.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.fabric.xmlrpc.base.Array;
import com.zy.login.entity.Role;
import com.zy.user.service.RoleService;

@Controller
@RequestMapping("/Role")
public class RoleController {
	@Autowired
	private RoleService service;

	@RequestMapping("/toRole")
	public String toRole() {

		return "user/roleM";
	}

	@RequestMapping("/getRoleAll")
	@ResponseBody
	public List<Role> getRoleAll() {
		List<Role> list = service.getRoleAll();

		return list;
	}
	
	// 根据rid删除一个
	@RequestMapping("/delOne")
	@ResponseBody
	public Map<String, Object> delById(Integer rid) {
		HashMap<String, Object> map = new HashMap<>();
		try {
			service.delById(rid);
			map.put("success", true);
		} catch (Exception e) {
			map.put("success", false);
		}

		return map;
	}
	
	//跳转到添加 角色信息的页面
	//修改时跳转到此页面携带的参数放到域中
	@RequestMapping("/toAddR")
	public String toAddR(Role role ,HttpServletRequest request) {
		request.setAttribute("role", role);
		return "user/toAddR";
	}
	//添加信息
	@RequestMapping("/addRole")
	@ResponseBody
	public Map<String,Object> addRole(Role role) {
		HashMap<String, Object> map = new HashMap<>();
		try {
			service.addRole(role);
			map.put("success", true);
		} catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
		}
		return map;
	}
	
   //修改信息
	@RequestMapping("/upRole")
	@ResponseBody
	public Map<String,Object> upRole(Role role) {
		HashMap<String, Object> map = new HashMap<>();
		
		try {
			service.upRole(role);
			map.put("success", true);
		} catch (Exception e) {
          e.printStackTrace();
          map.put("success", false);
		}
		
		return map;
		
	}
	
	//批删 /Role/delByIds
	@RequestMapping("/delByIds")
	@ResponseBody
	public Map<String, Object> delByIds(String rids) {
		HashMap<String, Object> map = new HashMap<>();
		try {
			service.delByIds(rids);
			System.out.println("----------"+rids.length());
			map.put("success", true);
		} catch (Exception e) {
			map.put("success", false);
		}

		return map;
	}
	
	//获取id为 ----的角色
	@RequestMapping("/getRole")
	@ResponseBody
  public List<Map<String, Object>> getRole(Integer id) {
	
	return service.getRole(id);
		
    }
	//setRole
	@RequestMapping("/setRole")
	@ResponseBody
	public Map<String, Object>setRole(Integer id,@RequestParam("ids[]")Integer[] ids) {
		HashMap<String, Object> map = new HashMap<>();
		             try {
						service.upRoles(id,ids);
						map.put("success", true);
					} catch (Exception e) {
						e.printStackTrace();
						map.put("success", false);
					}
		
	return 	map;
	}
	
}
