package com.zy.contract.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.contract.pojo.Contract;
import com.zy.house.pojo.House;
import com.zy.tenant.pojo.Tenant;

public interface ContractDao {

	List<Contract> getContractAll();

	void delById(Integer coid);

	Integer getByTname(@Param("tname")String tname);

	Integer getByHid(Integer hid);

	void addByHidTid(@Param("contract")Contract contract);

	Contract toById(@Param("coid")Integer coid);

	void upByHidTid(Contract contract);

}
