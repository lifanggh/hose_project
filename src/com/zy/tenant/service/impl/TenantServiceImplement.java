package com.zy.tenant.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zy.house.pojo.House;

import com.zy.tenant.dao.TenantDao;
import com.zy.tenant.pojo.Tenant;
import com.zy.tenant.service.TenantService;

@Service
public class TenantServiceImplement implements TenantService {

	
	@Autowired
	private TenantDao dao;
	@Override
	public void addTenant(Tenant tenant) {
		
		
		if( tenant.getTid() != null){
			dao.upTenant(tenant);
		}else{
			dao.addTenant(tenant);
		}
	}

	@Override
	public void upTenant(Tenant tenant) {
		//dao.upTenant(tenant);
		
	}

	@Override
	public void delById(Integer tid) {
		dao.delById(tid);
		
	}

	@Override
	public void delByIds(String tids) {
		dao.delByIds(tids);
		
	}

	@Override
	public List<Tenant> getTenant(Tenant tenant) {
		return dao.getTenant(tenant);
	}

	@Override
	public Tenant getTenantById(Integer tid) {
	
		return dao.getTenantById(tid);
	}

	
}
