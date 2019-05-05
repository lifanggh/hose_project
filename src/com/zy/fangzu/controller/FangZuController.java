package com.zy.fangzu.controller;

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

import com.zy.fangzu.service.FangZuService;
import com.zy.fangzu.pojo.FangZu;

import com.zy.util.FileUtil;

@Controller
@RequestMapping("/FangZuManager")
public class FangZuController {
	@Autowired
	private FangZuService service;
	
	@RequestMapping("/toFangZu")
	public String FangZu(){
		return "fangzu/fangzu";
	}
	
	@RequestMapping("/toAddFangZu")
	public String toAddFangZu(Integer fid,Model model){
		model.addAttribute("fangzu", service.getFangZuById(fid));
		return "fangzu/add";
	}
	@RequestMapping("/getFangZu")//getFangZu
	@ResponseBody
	public Map<String,Object> getFangZu(FangZu fangZu,Integer page,Integer rows){
		
		List<FangZu> list = service.getFangZu(fangZu);
		Map<String,Object> map = new HashMap<>();
		map.put("total", list.size());
		
		map.put("rows", list.subList((page-1)*rows>list.size()?0:(page-1)*rows , rows*page > list.size()?list.size():rows*page));
		return map;
	}
	
	@RequestMapping("/addFangZu")
	@ResponseBody
	public Map<String, Object> addFangZu(FangZu fangZu,HttpServletRequest request){
		Map<String, Object>  map = new HashMap<>();
		try {
			
			service.addFangZu(fangZu);
			map.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);
		}
		
		return map;
	}
	
	@RequestMapping("/delById")
	@ResponseBody
	public Map<String,Object> delById(Integer fid){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			service.delById(fid);
			map.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);
		}
		return map;
	}
	
	@RequestMapping("/delByIds")
	@ResponseBody
	public Map<String,Object> delByIds(String fids){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			service.delByIds(fids);
			map.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);
		}
		return map;
	}
	
	
	
	
	
	
	
	
}
