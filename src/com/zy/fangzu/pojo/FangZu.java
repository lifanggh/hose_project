package com.zy.fangzu.pojo;

import com.zy.house.pojo.House;
import com.zy.tenant.pojo.Tenant;

public class FangZu {
  private Integer fid;
  private Float fmoney;
  private String ftime;
  private String fother;
  private Tenant f_tid;
  private House f_hid;
  

/**
 * @return the f_tid
 */
public Tenant getF_tid() {
	return f_tid;
}
/**
 * @param f_tid the f_tid to set
 */
public void setF_tid(Tenant f_tid) {
	this.f_tid = f_tid;
}
/**
 * @return the f_hid
 */
public House getF_hid() {
	return f_hid;
}
/**
 * @param f_hid the f_hid to set
 */
public void setF_hid(House f_hid) {
	this.f_hid = f_hid;
}
public Integer getFid() {
	return fid;
}
/**
 * @param fid the fid to set
 */
public void setFid(Integer fid) {
	this.fid = fid;
}
/**
 * @return the fmoney
 */
public Float getFmoney() {
	return fmoney;
}
/**
 * @param fmoney the fmoney to set
 */
public void setFmoney(Float fmoney) {
	this.fmoney = fmoney;
}
/**
 * @return the ftime
 */
public String getFtime() {
	return ftime;
}
/**
 * @param ftime the ftime to set
 */
public void setFtime(String ftime) {
	this.ftime = ftime;
}
/**
 * @return the fother
 */
public String getFother() {
	return fother;
}
/**
 * @param fother the fother to set
 */
public void setFother(String fother) {
	this.fother = fother;
}
/* (non-Javadoc)
 * @see java.lang.Object#toString()
 */

public FangZu() {
	super();
	// TODO Auto-generated constructor stub
}
public FangZu(Integer fid, Float fmoney, String ftime, String fother, Tenant f_tid, House f_hid) {
	super();
	this.fid = fid;
	this.fmoney = fmoney;
	this.ftime = ftime;
	this.fother = fother;
	this.f_tid = f_tid;
	this.f_hid = f_hid;
}
/* (non-Javadoc)
 * @see java.lang.Object#toString()
 */

public void setHimg(String upLoad) {
	// TODO Auto-generated method stub
	
}
public String getHimg() {
	// TODO Auto-generated method stub
	return null;
}

	
	
	
	
	
	
	
}
