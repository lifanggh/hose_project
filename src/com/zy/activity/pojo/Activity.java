package com.zy.activity.pojo;

public class Activity {
//	acid INT(3) PRIMARY KEY AUTO_INCREMENT,
	private Integer acid;
//	  acdatatime DATETIME NULL,
	private String acdatatime;
//	  actheme VARCHAR(18) NULL,
	private String actheme;
//	  accontent VARCHAR(40) NULL,
	private String accontent;
//	  acwhere VARCHAR(20) NULL,
	private String acwhere;
//	  acmoney DOUBLE(3,2) NULL,
	private double acmoney;
//	  acpeople VARCHAR(10) NULL 
	private String acpeople;
	public Integer getAcid() {
		return acid;
	}
	public void setAcid(Integer acid) {
		this.acid = acid;
	}
	public String getAcdatatime() {
		return acdatatime;
	}
	public void setAcdatatime(String acdatatime) {
		this.acdatatime = acdatatime;
	}
	public String getActheme() {
		return actheme;
	}
	public void setActheme(String actheme) {
		this.actheme = actheme;
	}
	public String getAccontent() {
		return accontent;
	}
	public void setAccontent(String accontent) {
		this.accontent = accontent;
	}
	public String getAcwhere() {
		return acwhere;
	}
	public void setAcwhere(String acwhere) {
		this.acwhere = acwhere;
	}
	public double getAcmoney() {
		return acmoney;
	}
	public void setAcmoney(double acmoney) {
		this.acmoney = acmoney;
	}
	public String getAcpeople() {
		return acpeople;
	}
	public void setAcpeople(String acpeople) {
		this.acpeople = acpeople;
	}
	public Activity(Integer acid, String acdatatime, String actheme, String accontent, String acwhere, double acmoney,
			String acpeople) {
		super();
		this.acid = acid;
		this.acdatatime = acdatatime;
		this.actheme = actheme;
		this.accontent = accontent;
		this.acwhere = acwhere;
		this.acmoney = acmoney;
		this.acpeople = acpeople;
	}
	public Activity() {
		super();
	}
	
	
}
