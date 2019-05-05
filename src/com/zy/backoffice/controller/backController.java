package com.zy.backoffice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.backoffice.entity.Back;
import com.zy.backoffice.service.backservice;
import com.zy.login.entity.House;

import javafx.scene.input.TouchPoint;
@Controller
@RequestMapping("/Back")
public class backController {
	@Autowired
	private backservice service;
	@RequestMapping("/toBack")
	public String toBack() {
		return "backoffice/backAll";
	}
	@RequestMapping("/getBackAll")
	@ResponseBody
	public  Map<String, Object> getBackAll(String col,String val,String jg,Double begin,Double end,Back back,Integer page,Integer rows) {
		List<Back> list=service.getBackAll(col,val,jg,begin,end,back);
		HashMap<String, Object> map = new HashMap<>();
		map.put("total", list.size());
		map.put("rows", list.subList((page-1)*rows>list.size()?0:(page-1)*rows, rows*page>list.size()?list.size():rows*page));

		return  map;

	}
	@RequestMapping("/toaddBack")
	public String toAddBack() {
		
		return "backoffice/add";
	}
	
	@RequestMapping("/addBack")
	@ResponseBody
	public Map<String,Object> addBack(Back back) {
		
		HashMap<String, Object> map = new HashMap<>();
		try {
			service.addBack(back);
			map.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
           map.put("success", false);
		}
		
		return map;
	}
	@RequestMapping("/delById")
	@ResponseBody
	public Map<String,Object> delById(Integer bid) {
		HashMap<String, Object> map = new HashMap<>();
		try {
			service.delById(bid);
			map.put("success", true);
			} catch (Exception e) {
				e.printStackTrace();
	           map.put("success", false);
			}
			
			return map;
		
		
	}
	@RequestMapping("/up")
	public String toup(){
		
		return"backoffice/update";
	}
	
	@RequestMapping("/upBack")
public String upBack(Integer bid,HttpServletRequest re) {
	Back back=service.getBack(bid);

	re.getSession().setAttribute("back", back);
	return "backoffice/update";
//	return"forward:/Back/up.action";
}	
    @RequestMapping("/updata")
    @ResponseBody
	public Map<String,Object> updata(Back back) {
    	
    	HashMap<String, Object> map = new HashMap<>();
		try {
			service.updata(back);
			map.put("success", true);
			} catch (Exception e) {
				e.printStackTrace();
	           map.put("success", false);
			}
			
			return map;
	}
	@RequestMapping("/delByIds")
	@ResponseBody
    public Map<String,Object> delByIds(String ids) {
		
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
