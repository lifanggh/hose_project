package com.zy.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.login.entity.Pow;
import com.zy.user.service.PowService;

@Controller
@RequestMapping("/pow")
public class PowController {

	@Autowired
	private PowService service;

	@RequestMapping("/toPow")
	public String topow() {

		return "user/pow";
	}

	@RequestMapping("/getPowAll")
	@ResponseBody
	public List<Pow> Allpow() {

		return service.getPowAll();

	}

	@RequestMapping("/toAddpow")
	public String toAddpow(Pow pow, Model model) {
		model.addAttribute("pow", pow);
		return "user/Addpow";
	}

	@RequestMapping("/addpow")
	@ResponseBody
	public Map<String, Object> addpow(Pow pow) {
		System.out.println(pow.getPname());
		HashMap<String, Object> map = new HashMap<>();
		try {
			service.addpow(pow);
			map.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);
		}
		return map;
	}

	@RequestMapping("/getPow")
	@ResponseBody
	public List<Map<String, Object>> getPow(Integer rid) {
		List<Map<String, Object>> pow = service.getPow(rid);

		return pow;
	}

	@RequestMapping("/setPow")
	@ResponseBody
	public Map<String, Object> setPow(Integer rid, @RequestParam("ids[]") Integer[] ids) {
		HashMap<String, Object> map = new HashMap<>();
		try {
			service.setpow(rid, ids);
			map.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);
		}
		return map;
	}

	@RequestMapping("/delOne")
	@ResponseBody
	public Map<String, Object> delOne(Integer pid) {
		HashMap<String, Object> map = new HashMap<>();
		try {
			service.delOne(pid);
			map.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);
		}
		return map;
	}
	
	@RequestMapping("/upPow")
	@ResponseBody
	public Map<String , Object>upPow(Pow pow) {
		
		HashMap<String, Object> map = new HashMap<>();
		try {
			service.upPow(pow);
			map.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);
		}
		return map;
		
		
	}
	
	@RequestMapping("/delByIds")
	@ResponseBody
	public Map<String ,Object> delByIds(String ids) {
		System.out.println("---------------"+ids);
		HashMap<String,Object> map = new HashMap<>();
		try {
			service.delByIds(ids);
			map.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success",false);
		}
		return map;
		
	}
	

}
