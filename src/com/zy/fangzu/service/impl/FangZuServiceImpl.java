package com.zy.fangzu.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zy.fangzu.dao.FangZuDao;
import com.zy.fangzu.pojo.FangZu;
import com.zy.fangzu.service.FangZuService;
import com.zy.house.dao.HouseDao;
import com.zy.house.pojo.House;
import com.zy.util.FileUtil;

@Service
public class FangZuServiceImpl implements FangZuService {

	@Autowired 
	private FangZuDao dao;
	
	@Override
	public List<FangZu> getFangZu( FangZu fangZu) {
		return dao.getFangZu(fangZu);
		
	}

	@Override
	public void addFangZu(FangZu fangZu) {
		
		if(fangZu.getFid() != null){
			dao.update(fangZu);
		}else{
			dao.add(fangZu);
		}
		
	}

	

	@Override
	public FangZu getFangZuById(Integer fid) {
		return dao.getFangZuById(fid);
	}

	@Override
	public void delById(Integer fid) {
		dao.delById(fid);
		
	}

	@Override
	public void delByIds(String fids) {
		dao.delByIds(fids);
		
	}

	

	
}
