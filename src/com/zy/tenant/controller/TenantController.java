package com.zy.tenant.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.tenant.pojo.Tenant;
import com.zy.tenant.service.TenantService;

@Controller
@RequestMapping("/TenantManager")
public class TenantController {
	@Autowired
	private TenantService service;
	
	@RequestMapping("/toTenant")
	public String toUser(){
		return "tenant/tenant";
	}
	@RequestMapping("/toAddTenant")
	public String toTab(Integer tid,Model model){
		model.addAttribute("tenant",service.getTenantById(tid));
		return "tenant/add";
	}
	
	@RequestMapping("/getTenant")
	@ResponseBody
	public Map<String,Object> getHouse(Tenant tenant,Integer page,Integer rows){
		List<Tenant> list = service.getTenant(tenant);
		Map<String,Object> map = new HashMap<>();
		map.put("total", list.size());
		//(page-1)*rows>list.size()?0:(page-1)*rows    鎴彇list寮�濮嬬殑浣嶇疆     浣跨敤涓夌洰杩愮畻绗﹀垽鏂紑濮嬬殑浣嶇疆濡傛灉澶т簬杩斿洖鐨勬暟鎹�绘潯鏁扮殑璇�  璁剧疆鎴�0
		// rows*page > list.size()?list.size():rows*page)  缁撴潫鐨勪綅缃�  浣跨敤涓夌洰杩愮畻绗﹀垽鏂粨鏉熺殑浣嶇疆濡傛灉澶т簬杩斿洖鏁版嵁鐨勬�绘潯鏁扮殑璇�  鍚ф�绘潯鏁颁綔涓虹粨鏉熺殑浣嶇疆
		
		map.put("rows", list.subList((page-1)*rows>list.size()?0:(page-1)*rows , rows*page > list.size()?list.size():rows*page));
		System.out.println(map);
		return map;
	}
	
	
	@RequestMapping("/addTenant")
	@ResponseBody
	public Map<String, Object> addTenant(Tenant tenant){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			System.out.println(tenant.getTnative());
			service.addTenant(tenant);
			map.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);
		}
		return map;
	}
	
	@RequestMapping("/upTenant")
	@ResponseBody
	public Map<String, Object> upTenant(Tenant tenant){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			service.upTenant(tenant);
			map.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);
		}
		return map;
	}
	
	@RequestMapping("/delById")
	@ResponseBody
	public Map<String,Object> delById(Integer tid){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			service.delById(tid);
			map.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);
		}
		return map;
	}
	
	@RequestMapping("/delByIds")
	@ResponseBody
	public Map<String,Object> delByIds(String tids){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			service.delByIds(tids);
			map.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);
		}
		return map;
	}
	
}
