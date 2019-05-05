package com.zy.contract.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.zy.contract.dao.ContractDao;
import com.zy.contract.pojo.Contract;
import com.zy.contract.service.ContractService;

import com.zy.house.pojo.House;
import com.zy.tenant.pojo.Tenant;

@Service
public class ContractServiceImpl implements ContractService{

	
	@Autowired
	private ContractDao dao;

	@Override
	public List<Contract> getContractAll() {
		List<Contract> list=new ArrayList<>();
		list=dao.getContractAll();
		return list;
	}
	@Override
	public void delById(Integer coid) {
		dao.delById(coid);
	}
	@Override
	public Map<String, Object> addContractAll(Contract contract, Integer hid, String tname) {
		Map<String, Object> map=new HashMap<>();
		System.out.println(tname);
		if(tname!=null&&tname!=""){
			//查询tid
			Integer tid=dao.getByTname(tname);
			if(tid!=null){
				if(hid!=null){
					Integer hid1=dao.getByHid(hid);
					if(hid1!=null){
						//查询
						//hid
						House house=new House();
						house.setHid(hid1);
						//tid
						Tenant tenant=new Tenant();
						tenant.setTid(tid);
						//赋值 hid tid
						contract.setCohid(house);
						contract.setCotid(tenant);
						//添加contract的信息
						dao.addByHidTid(contract);
						map.put("success", true);
					}else{
						map.put("success", false);
						map.put("mags", "房屋编号不存在");
					}
				}else{
					map.put("success", false);
					map.put("mags", "房屋编号为空");
				}
			}else{
				map.put("success", false);
				map.put("mags", "用户名不存在");
			}
		}else{
			map.put("success", false);
			map.put("mags", "用户名为空");
		}
		return map;
	}

	@Override
	public Contract toById(Integer coid) {
		return dao.toById(coid);
	}

	@Override
	public Map<String, Object> upContractById(Contract contract,Integer hid,String tname) {
		Map<String, Object> map=new HashMap<>();
		if(tname!=null&&tname!=""){
			//查询tid
			Integer tid=dao.getByTname(tname);
			if(tid!=null){
				if(hid!=null){
					Integer hid1=dao.getByHid(hid);
					if(hid1!=null){
						//查询
						//hid
						House house=new House();
						house.setHid(hid1);
						//tid
						Tenant tenant=new Tenant();
						tenant.setTid(tid);
						//赋值 hid tid
						contract.setCohid(house);
						contract.setCotid(tenant);
						//添加contract的信息
						dao.upByHidTid(contract);
						map.put("success", true);
					}else{
						map.put("success", false);
						map.put("mags", "房屋编号不存在");
					}
				}else{
					map.put("success", false);
					map.put("mags", "房屋编号为空");
				}
			}else{
				map.put("success", false);
				map.put("mags", "用户名不存在");
			}
		}else{
			map.put("success", false);
			map.put("mags", "用户名为空");
		}
		return map;
	}

	
    
	
	
}
