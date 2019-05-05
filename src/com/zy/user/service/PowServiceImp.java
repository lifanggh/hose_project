package com.zy.user.service;

import static org.hamcrest.CoreMatchers.nullValue;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zy.login.entity.Pow;
import com.zy.login.entity.Role_Pow;
import com.zy.user.dao.PowDao;

import oracle.net.aso.i;

@Service
public class PowServiceImp implements PowService {

	@Autowired
	private PowDao dao;
	
	@Override
	public List<Map<String, Object>> getPow(Integer rid) {
   //查询所有权限
   List<Pow>list =dao.getAllPow();	

   //查询这个角色的权限
List<Role_Pow> lists= dao.getPows(rid);

List<Map<String, Object>> tree=new ArrayList<Map<String, Object>>();
for (Pow pow : list) {
	HashMap<String, Object> map = new HashMap<>();
map.put("id", pow.getPid());
map.put("text", pow.getPname());
map.put("iconCls", "icon-man");
for (Role_Pow role_Pow : lists) {
	if (role_Pow.getPid()==pow.getPid()) {
		map.put("checked", true);
		break;
	}
}

tree.add(map);


}
          return tree;
	}

	@Override
	public void setpow(Integer rid, Integer[] ids) {
		dao.delPow(rid);
		dao.add(rid,ids);
		
	}

	@Override
	public List<Pow> getPowAll() {
		List<Pow> list = dao.getAllPow();
		return list;
		
	}

	@Override
	public void addpow(Pow pow) {
		dao.addpow(pow);
		
	}

	@Override
	public void delOne(Integer pid) {
	dao.delOne(pid);
		
	}

	@Override
	public void upPow(Pow pow) {
	 dao.upPow(pow);
		
	}

	@Override
	public void delByIds(String ids) {
	dao.delByIds(ids);
		
	}

}
