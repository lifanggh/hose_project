package com.zy.fangzu.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.zy.fangzu.pojo.FangZu;
import com.zy.house.pojo.House;

public interface FangZuService {

	
	
	List<FangZu> getFangZu( FangZu fangZu);

	void addFangZu(FangZu fangZu);

	

	FangZu getFangZuById(Integer fid);

	void delById(Integer fid);

	void delByIds(String fids);
	
	
	
}
