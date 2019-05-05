package com.zy.tenant.service;

import java.util.List;

import com.zy.house.pojo.House;
import com.zy.tenant.pojo.Tenant;

public interface TenantService {

	void addTenant(Tenant tenant);

	void upTenant(Tenant tenant);

	void delById(Integer tid);

	void delByIds(String tids);
	List<Tenant> getTenant(Tenant tenant);

	Tenant getTenantById(Integer tid);


}
