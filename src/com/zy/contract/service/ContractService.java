package com.zy.contract.service;

import java.util.List;
import java.util.Map;

import com.zy.contract.pojo.Contract;

public interface ContractService {

	List<Contract> getContractAll();

	void delById(Integer coid);

	Map<String, Object> addContractAll(Contract contract, Integer hid, String tname);

	Contract toById(Integer coid);

	Map<String, Object> upContractById(Contract contract,Integer hid,String tname);

	

}
