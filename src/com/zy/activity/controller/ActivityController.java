package com.zy.activity.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.activity.pojo.Activity;
import com.zy.activity.service.ActivityService;

@Controller
@RequestMapping("/ActivityManager")
public class ActivityController {
	
	@Autowired
	private ActivityService service;
	
//	/ActivityManager/toActivity.do  /ActivityManager/getActivityAll
	@RequestMapping("/getActivityAll")
	@ResponseBody
	public List<Activity> getActivity(){
		
		return service.getActivityAll();
	}
	
	@RequestMapping("/toActivity")
	public String toActivity(){
		return "activity/shactivity";
	}
	///ActivityManager/toAddActivity toAddActivity
	
	@RequestMapping("/toAddActivity")
	public String getAddActivity(Integer acid,Model model){
		Activity activity=service.getActivityId(acid);
		System.out.println("-------------------"+activity);
		model.addAttribute("activity", activity);
		return "activity/addactivity";
	}
	
	///ActivityManager/addHouse.do
	@RequestMapping("/addActivity")
	@ResponseBody
	public Map<String, Object> addActivityId(Activity activity){
		//System.out.println("333");
		Map<String, Object> map = new HashMap<>();
		try {
			service.addGetIdAll(activity);
			map.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);
			
		}
		return map;
	}
	
	//delByAcid.do
	@RequestMapping("/delByAcid")
	@ResponseBody
	public Map<String, Object> delActivityById(Integer acid){
		Map<String, Object> map = new HashMap<>();
		try {
			service.delByIdActivity(acid);
			map.put("success", true);
		} finally {
            map.put("success", false);
		}
		return map;
	}
	///ActivityManager/updaActivity.do
	
	@RequestMapping("/updaActivity")
	@ResponseBody
	public Map<String, Object> upDaActivity(Activity activity){
		Map<String, Object> map=new HashMap<>();
		try {
			service.upDaActivity(activity);
			map.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);
		}
		return map;
	}
	
   
}
