package com.zy.fangzu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.fangzu.pojo.FangZu;
import com.zy.house.pojo.House;

public interface FangZuDao {

	List<FangZu> getFangZu( @Param("fangZu")FangZu fangZu);

	void update(FangZu fangZu);

	void add(FangZu fangZu);

	FangZu getFangZuById(Integer fid);

	void delById(Integer fid);

	void delByIds(@Param("fids")String fids);

	

	
	
}
