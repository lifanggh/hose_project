package com.zy.user.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.org.apache.xerces.internal.impl.xs.SchemaSymbols;
import com.zy.login.entity.Role;
import com.zy.login.entity.User_Role;
import com.zy.user.dao.RoleDao;

@Service
public class RoleServiceImp implements RoleService {
@Autowired
private RoleDao dao;
//获取所有角色信息		
	@Override
	public List<Role> getRoleAll() {
		List<Role> list = dao.getRoleAll();
	
		return list;
	}
	@Override
	public void delById(Integer rid) {
	dao.delById(rid);
		
	}
	@Override
	public void addRole(Role role) {
	dao.addRole(role);
		
	}
	@Override
	public void upRole(Role role) {
		dao.upRole(role);
		
	}
	@Override
	public void delByIds(String rids) {
		dao.delByIds(rids);
	
	}
	@Override
	public List<Map<String, Object>> getRole(Integer id) {
	//查询所有角色
		List<Role> list = dao.getRoleAll();
		
	//查询用户拥有的角色	 id---> rid 
	List<User_Role>	roles=dao.getRoleById(id);


	//定义返回值
	List<Map<String, Object>> tree =new ArrayList<Map<String, Object>>();
			for (Role role : list) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("id", role.getRid());
				map.put("text", role.getRname());
				map.put("iconCls", "icon-man");
				for (User_Role user_Role : roles) {
					if (user_Role.getRid()==role.getRid()) {
						map.put("checked", true);
						break;
					}
				}
				tree.add(map);
			}
	
		return tree;
	}

	@Override
	public void upRoles(Integer id, Integer[] ids) {
		dao.delBy(id);
		dao.addRoles(id,ids);
		
	}


}
