package com.zy.tenant.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.tenant.pojo.Tenant;

public interface TenantDao {

	

	void addTenant(Tenant tenant);

	void upTenant(Tenant tenant);

	void delById(Integer tid);

	void delByIds(@Param("tids")String tids);

	List<Tenant> getTenant(@Param("tenant")Tenant tenant);

	Tenant getTenantById(Integer tid);


	
	
	
	
}
