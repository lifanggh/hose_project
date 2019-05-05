package com.zy.house.service.serviceImp;

import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zy.house.dao.HouseDao;
import com.zy.house.service.HouseService;
import com.zy.login.entity.House;
import com.zy.util.FileUtil;
@Service
public class HouseServiceImp implements HouseService{
   @Autowired
	private HouseDao dao;
	@Override
	public List<House> getHouse(String col, String val, Double begin, Double end,House house) {
		
		return dao.getHouse(col,val,begin,end,house);
	}
	@Override
	public void addHouses(House house) {
		if (house.getHid() !=null) {
			dao.update(house);
			
		}
	dao.addHouses(house);
		
	}
	@Override
	public House getHouseById(Integer hid) {
		
		return dao.getHouseById(hid);
	}
	@Override
	public void delById(String ids, HttpServletRequest request) {
		//根据ids获取每个要删除的房屋信息的文件路径,
				List<House> list =  dao.queryByIds(ids);
				for (House house : list) {
					FileUtil.deleteFile(house.getHimg(), request);
				}
				//根据ids删除数据库数据
				dao.delById(ids);
				
	}

}
