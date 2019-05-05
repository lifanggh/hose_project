package com.zy.maintain.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sun.org.apache.xerces.internal.impl.xs.SchemaSymbols;
import com.zy.backoffice.entity.Back;
import com.zy.maintain.entity.Maintain;
import com.zy.maintain.service.maintainService;

@Controller
@RequestMapping("/Maintain")
public class maintainController {

	@Autowired
	private maintainService service;

	@RequestMapping("/toMaintain")
	public String toMaintain() {

		return "maintain/weixuAll";
	}

	// 2
	@RequestMapping("/toMaintain2")
	public String toMaintain2() {

		return "maintain/weixuAll2";
	}

	// 2
	@RequestMapping("/getAllmaintain2")
	@ResponseBody
	public Map<String, Object> getAllmaintain2(String col,String val,String jg,String jgd,Double begin,Double end,Maintain maintain,Integer page,Integer rows) {
		
		System.out.println(maintain.getHptsss());
		System.out.println(maintain.getHouse());
		
		List<Maintain> list = service.getAllmaintain2(col,val,jgd,jg,begin,end,maintain);
		
		
		
		
		System.out.println("-----------"+begin);
		HashMap<String, Object> map = new HashMap<>();
		map.put("total", list.size());
		map.put("rows", list.subList((page-1)*rows>list.size()?0:(page-1)*rows, rows*page>list.size()?list.size():rows*page));

		return map;
	}
/*	@RequestMapping("/getBackAll")
	@ResponseBody
	public  Map<String, Object> getBackAll(String col,String val,String jg,Double begin,Double end,Back back,Integer page,Integer rows) {
		List<Back> list=service.getBackAll(col,val,jg,begin,end,back);
		HashMap<String, Object> map = new HashMap<>();
		map.put("total", list.size());
		map.put("rows", list.subList((page-1)*rows>list.size()?0:(page-1)*rows, rows*page>list.size()?list.size():rows*page));

		return  map;

	}*/
	@RequestMapping("/getAllmaintain")
	@ResponseBody
	public List<Maintain> getAllmaintain() {
		return service.getAllmaintain();
	}

	@RequestMapping("/delById")
	@ResponseBody
	public Map<String, Object> delById(Integer mid) {
		HashMap<String, Object> map = new HashMap<>();
		try {
			service.delById(mid);
			map.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);
		}

		return map;
	}
	//批量删除
	@RequestMapping("/delByIds")
	@ResponseBody
	public Map<String,Object> delByIds(String ids) {
		Map<String, Object> map = new HashMap<>();
		try {
			service.delByIds(ids);
			map.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);
		}

		return map;
	}

	
	@RequestMapping("/toAdd")
	public String  toAdd(Maintain maintain,Model model) {
		model.addAttribute("maintain",maintain);
		return"maintain/add";
	}
	@RequestMapping("/addMaintain")
	@ResponseBody
	public Map<String,Object> addMaintain(Maintain maintain) {
		Map<String, Object> map = new HashMap<>();
		try {
			service.addMaintain(maintain);
			map.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);
		}

		return map;
	}
	@RequestMapping("/toUpdate")
	public String update(Integer mid,Model model) {		
	Maintain maintain=	service.getdate(mid);
	model.addAttribute("maintain", maintain);
	
	
	System.out.println(maintain);
		return "maintain/update";
		
	}
	
	@RequestMapping("/toUpdate2")
	@ResponseBody
	public Map<String,Object> upMaintain(Maintain maintain) {
		Map<String, Object> map = new HashMap<>();
		try {
			service.upMaintain(maintain);
			map.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);
		}

		return map;
	}
	
}
