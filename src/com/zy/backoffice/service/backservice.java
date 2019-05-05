package com.zy.backoffice.service;

import java.util.List;



import com.zy.backoffice.entity.Back;

public interface backservice {


	void addBack(Back back);

	void delById(Integer bid);

	Back getBack(Integer bid);

	void updata(Back back);

	void delByIds(String ids);

	List<Back> getBackAll(String col, String val, String jg, Double begin, Double end, Back back);

	





}
