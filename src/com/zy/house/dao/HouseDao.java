package com.zy.house.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.login.entity.House;

public interface HouseDao {

	public List<House> getHouse(@Param("col")String col, @Param("val")String val,@Param("begin")Double begin,@Param("end")Double end, @Param("house")House house);

	public void addHouses(House house);
	public House getHouseById(Integer hid);

	public void update(House house);

	public List<House> queryByIds(@Param("ids")String ids);

	public void delById(@Param("ids")String ids);

}
