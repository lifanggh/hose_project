package com.zy.user.service;

import java.util.List;
import java.util.Map;

import com.zy.login.entity.Pow;

public interface PowService {

	List<Map<String, Object>> getPow(Integer rid);

	void setpow(Integer rid, Integer[] ids);

	List<Pow> getPowAll();

	void addpow(Pow pow);

	void delOne(Integer pid);

	void upPow(Pow pow);

	void delByIds(String ids);

}
