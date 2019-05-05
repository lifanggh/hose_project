package com.zy.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.login.entity.Pow;
import com.zy.login.entity.Role_Pow;

public interface PowDao {

	List<Pow> getAllPow();

	List<Role_Pow> getPows(Integer rid);

	void delPow(Integer rid);

	void add(@Param("rid")Integer rid,@Param("ids")Integer[] ids);

	void addpow(Pow pow);

	void delOne(Integer pid);

	void upPow(Pow pow);

	void delByIds(@Param("ids") String ids);



}
