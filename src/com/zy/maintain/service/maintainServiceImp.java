package com.zy.maintain.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.zy.login.entity.House;
import com.zy.maintain.dao.maintainDao;
import com.zy.maintain.entity.Maintain;

@Service
public class maintainServiceImp implements maintainService{

	@Autowired
	private maintainDao dao;

	@Override
	public List<Maintain> getAllmaintain() {
		List<Maintain> list = dao.getAllmain();

		return list;
	}

	@Override
	public void delById(Integer mid) {
		dao.delById(mid);
		
	}
	
	
	@Override
	public List<Maintain> getAllmaintain2(String col,String val,String jgd,String jg,Double begin, Double end, Maintain maintain){
		List<Maintain> list = dao.getAllmaintain2(col,val,jg,begin,end,maintain,jgd);
		
		
		return list;
	}

	@Override
	public void delByIds(String ids) {
		dao.delByIds(ids);
		
	}
    
	@Override
	public void addMaintain(Maintain maintain) {
		System.out.println("---"+maintain);
		dao.addMaintain(maintain);
	}

	@Override
	public Maintain getdate(Integer mid) {
		
		return dao.getdate(mid);
	}

	@Override
	public void upMaintain(Maintain maintain) {
		dao.upMaintain(maintain);
		
	}

}
