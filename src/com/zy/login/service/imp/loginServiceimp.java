package com.zy.login.service.imp;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.websocket.pojo.PojoMessageHandlerWholeBase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.org.apache.xerces.internal.impl.xs.SchemaSymbols;
import com.zy.login.dao.loginDao;
import com.zy.login.entity.Pow;
import com.zy.login.entity.User;
import com.zy.login.service.loginService;

import oracle.net.aso.p;

@Service
public class loginServiceimp implements loginService {

	@Autowired
	private loginDao loginDao;

	@Override
	public Map<String, Object> getLogin(User user, HttpServletRequest request) {
		
		// 定一返回值
		HashMap<String, Object> map = new HashMap<>();
		// 使用用户输入的用户名,去数据库查询数据,把查询到的数据赋值给user
		User user2 = loginDao.getLogin(user.getName());
		// 判斷用戶是否存在
		if (user2 != null){
			// 密碼是否一致
			if (user2.getPass().equals(user.getPass())) {
				map.put("success", true);
				map.put("msg", "ok");
				request.getSession().setAttribute("user", user); //把登录用户的信息放进域中******
			List<Pow> pow=loginDao.getPowByName(user.getName());
			request.getSession().setAttribute("pow", pow);
			} else {
				map.put("success", false);
				map.put("msg", "蜜嘛措五");
			}
		} else {
			map.put("success", false);
			map.put("msg", "用戶不存在");
		}

		return map;
	}

	@Override
	public void addResgister(User user) {
		loginDao.addResgister(user);
		
	}
//菜单选项
	@Override
	public List<Map<String, Object>> getMenuByPid(Integer pid) {
	List<Pow> pows=loginDao.getMenuByPid(pid);
	
	List<Map<String, Object>> list = new ArrayList<>();
	
for (Pow pow : pows) {
	HashMap<String,Object> map = new HashMap<>();
	map.put("id", pow.getPid());
	map.put("text", pow.getPname());
	map.put("url", pow.getUrl());
	list.add(map);
	}
		return list;
	}

}
