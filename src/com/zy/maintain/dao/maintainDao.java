package com.zy.maintain.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.maintain.entity.Maintain;

public interface maintainDao {

	List<Maintain> getAllmaintain();

	List<Maintain> getAllmain();

	void delById(Integer mid);

	List<Maintain> getAllmaintain2(@Param("col")String col, @Param("val")String val,@Param("jg")String jg,@Param("begin")Double begin,@Param("end")Double end,@Param("maintain")Maintain maintain,@Param("jgd")String jgd);

	void delByIds(@Param("ids")String ids);

	void addMaintain(Maintain maintain);

	Maintain getdate(Integer mid);

	void upMaintain(Maintain maintain);

}
