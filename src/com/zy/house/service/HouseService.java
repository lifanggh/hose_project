package com.zy.house.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.zy.login.entity.House;

public interface HouseService {

	List<House> getHouse(String col, String val, Double begin, Double end, House house);

	void addHouses(House house);

	House getHouseById(Integer hid);

	void delById(String ids, HttpServletRequest request);

}
