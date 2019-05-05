package com.zy.backoffice.service.Imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.zy.backoffice.dao.backDao;
import com.zy.backoffice.entity.Back;
import com.zy.backoffice.service.backservice;
@Service
public class backserviceImp implements backservice {
    @Autowired
	private backDao dao;
	
	@Override
	public void addBack(Back back) {
		   System.out.println("++++++++++"+back.getBname());
           dao.addBack(back);	
        
	}
	@Override
	public void delById(Integer bid) {
		dao.delById(bid);
	}
	@Override
	public Back getBack(Integer bid) {
		
		return dao.getBack(bid);
	}
	@Override
	public void updata(Back back) {
	dao.updata(back);
		
	}
	@Override
	public void delByIds(String ids) {
		
	dao.delByIds(ids);
		
	}
	@Override
	public List<Back> getBackAll(String col, String val,String jg, Double begin, Double end, Back back) {
		return dao.getBackAll(col,val,jg,begin,end,back);
	}



	

}
