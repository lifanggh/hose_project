package com.zy.contract.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.print.attribute.standard.Severity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyEmitterReturnValueHandler;

import com.zy.contract.pojo.Contract;
import com.zy.contract.service.ContractService;
import com.zy.house.pojo.House;
import com.zy.tenant.pojo.Tenant;

@Controller
@RequestMapping("/ContractManager")
public class ContractController {
	
	@Autowired
	private ContractService service;
	
	///ContractManager/toContract.do
	@RequestMapping("/toContract")
	public String toContract(){
		return "contract/shcontract";
	}
	
	//getContractAll  /ContractManager/getContractAll
	@RequestMapping("/getContractAll")
	@ResponseBody
	public List<Contract> getContractAll(){
		return service.getContractAll();
	}
	//delById.do
	@RequestMapping("/delById")
	@ResponseBody
	public Map<String, Object> delById(Integer coid){
		//设置返回值
		Map<String,Object> map=new HashMap<>();
		try {
			service.delById(coid);
			map.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);
		}
		
		return map;
	}
	//ContractManager/toAddContract
	@RequestMapping("/toAddContract")
	public String toGetContract(){
		
		return "contract/addcontract";
	}
	@RequestMapping("toAContract")
	public String toBGetContract(Integer coid,Model model){
		Contract contract=service.toById(coid);
		model.addAttribute("Contract",contract);
		return "contract/addcontract";
	}
	
	
	//AddContract.do
	@RequestMapping("/AddContract")
	@ResponseBody
	public Map<String, Object> addContract(Contract contract,Integer hid,String tname){
		
		return service.addContractAll(contract,hid,tname);
	}
	
	///ContractManager/upContract.do
		@RequestMapping("/upContract")
		@ResponseBody
		public Map<String, Object> upContractById(Contract contract,Integer hid,String tname){
			
			return service.upContractById(contract,hid,tname);
		}

}
