package com.zy.house.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.zy.house.service.HouseService;
import com.zy.login.entity.House;
import com.zy.util.FileUtil;

@Controller
@RequestMapping("/House")
public class HouseController {
	@Autowired
	private HouseService service;
	///House/toHouse
	@RequestMapping("/toHouse")
	public String toHouse() {
		return "house/house";
	}
	
	
	@RequestMapping("/getHouse")
	@ResponseBody
	public Map<String, Object> getHouse(String col,String val,Double begin,Double end,House house,Integer page,Integer rows) {
	List<House>	list=service.getHouse(col,val,begin,end,house);
	HashMap<String, Object> map = new HashMap<>();
	map.put("total", list.size());
	//(page-1)*rows>list.size()?0:(page-1)*rows    截取list开始的位置     使用三目运算符判断开始的位置如果大于返回的数据总条数的话  设置成0
			// rows*page > list.size()?list.size():rows*page)  结束的位置  使用三目运算符判断结束的位置如果大于返回数据的总条数的话  吧总条数作为结束的位置
	map.put("rows", list.subList((page-1)*rows>list.size()?0:(page-1)*rows, rows*page>list.size()?list.size():rows*page));
		
		
		return map;
		
	}
	
	@RequestMapping("/addHouse")
	public String addHouse(Integer hid,Model model) {
		model.addAttribute("house",service.getHouseById(hid));
		return "house/add";
	}
	@RequestMapping("/addHouses")
	public Map<String,Object> addHouses(MultipartFile img,House house,HttpServletRequest request) {
		HashMap<String, Object> map = new HashMap<>();
		try {
			if (img!=null) {
				house.setHimg(FileUtil.upLoad(img,img.getOriginalFilename(),"img",request));
			}
			service.addHouses(house);
			map.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);
		}
		
		return map;
	}
	
	//toShow
	@RequestMapping("/toShow")
	public String toShow(Integer hid,Model model){
	House h=service.getHouseById(hid);
	model.addAttribute("house", h);
		return "house/show";
	}
	
	@RequestMapping("/delById")
	@ResponseBody
	public Map<String, Object> delById(String ids,HttpServletRequest request){
		System.out.println("-----------------"+ids);
		Map<String, Object> map = new HashMap<>();
		try {
			service.delById(ids,request);
			map.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);
		}
		return map;
	}
	
}
