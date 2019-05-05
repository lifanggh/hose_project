package com.zy.backoffice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import com.zy.backoffice.entity.Back;

public interface backDao {


	void addBack(Back back);

	void delById(Integer bid);

	Back getBack(Integer bid);

	void updata(Back back);

	void delByIds(@Param("ids")String ids);

	List<Back> getBackAll(@Param("col")String col, @Param("val")String val,@Param("jg")String jg,@Param("begin")Double begin, @Param("end")Double end, @Param("back")Back back);


	

}
