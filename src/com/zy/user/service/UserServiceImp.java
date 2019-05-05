package com.zy.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zy.login.dao.loginDao;
import com.zy.login.entity.User;

@Service
public class UserServiceImp implements UserService {
	@Autowired
	private loginDao dao;
//获取
	@Override
	public List<User> getUserAll() {
	return dao.getUserAll();
	}

	//删除id user用户  dao层再login中
	@Override
	public void delById(Integer id) {
		dao.delById(id);
	}
//添加用户
	@Override
	public void addUser(User user) {
		dao.addUser(user);
		
	}
//修改用户
	@Override
	public void upUser(User user) {
		dao.upUser(user);
		
	}

	@Override
	public void delByIds(String ids) {
		dao.delByIds(ids);
		
	}

}
