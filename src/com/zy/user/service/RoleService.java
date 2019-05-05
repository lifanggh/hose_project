package com.zy.user.service;

import java.util.List;
import java.util.Map;

import com.zy.login.entity.Role;

public interface RoleService {

	List<Role> getRoleAll();

	void delById(Integer rid);

	void addRole(Role role);

	void upRole(Role role);

	void delByIds(String rids);

	List<Map<String, Object>> getRole(Integer id);

	
	void upRoles(Integer id, Integer[] ids);

}
