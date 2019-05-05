package com.zy.maintain.service;

import java.util.List;

import com.zy.maintain.entity.Maintain;

public interface maintainService {

	List<Maintain> getAllmaintain();

	void delById(Integer mid);

	List<Maintain> getAllmaintain2(String col, String val, String jgd,String jg, Double begin,Double end, Maintain maintain);

	void delByIds(String ids);

	void addMaintain(Maintain maintain);

	Maintain getdate(Integer mid);

	void upMaintain(Maintain maintain);



}
