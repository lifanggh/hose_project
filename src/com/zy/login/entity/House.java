package com.zy.login.entity;


public class House {
	 private Integer hid; 
	 private String  harea;
	 private String  hxq;
	 private String  hdy;
	 private Integer hceng;
	 private String  hroom;
	 private Double  hacreage; 
	 private Integer horientation; 
	 private Integer hfinish; 
	 private Boolean hsq; 
	 private Integer hlimit;  
	 private String  hptss;
	 private Double  hprice;
	 private Integer hstate;
	 private String  himg;
	 private String  haddress;
	 private String  createtime;
	 private String  modifytime;
	 
	 private Double mjBegin;
	 private Double mjEnd;
	 private Double jgBegin;
	 private Double jgEnd;
	 private String[]  hptsss;
	public House() {
		super();
	}

	public Double getMjBegin() {
		return mjBegin;
	}

	public void setMjBegin(Double mjBegin) {
		this.mjBegin = mjBegin;
	}

	public Double getMjEnd() {
		return mjEnd;
	}

	public void setMjEnd(Double mjEnd) {
		this.mjEnd = mjEnd;
	}

	public Double getJgBegin() {
		return jgBegin;
	}

	public void setJgBegin(Double jgBegin) {
		this.jgBegin = jgBegin;
	}

	public Double getJgEnd() {
		return jgEnd;
	}

	public void setJgEnd(Double jgEnd) {
		this.jgEnd = jgEnd;
	}

	public String[] getHptsss() {
		if (this.hptss !=null ) {
			return this.hptss.split(",");
		}
		
		return null;
	}

	public void setHptsss(String[] hptsss) {
		this.hptsss = hptsss;
	}

	public House(Integer hid, String harea, String hxq, String hdy, Integer hceng, String hroom, Double hacreage,
			Integer horientation, Integer hfinish, Boolean hsq, Integer hlimit, String hptss, Double hprice,
			Integer hstate, String himg, String haddress, String createtime, String modifytime) {
		super();
		this.hid = hid;
		this.harea = harea;
		this.hxq = hxq;
		this.hdy = hdy;
		this.hceng = hceng;
		this.hroom = hroom;
		this.hacreage = hacreage;
		this.horientation = horientation;
		this.hfinish = hfinish;
		this.hsq = hsq;
		this.hlimit = hlimit;
		this.hptss = hptss;
		this.hprice = hprice;
		this.hstate = hstate;
		this.himg = himg;
		this.haddress = haddress;
		this.createtime = createtime;
		this.modifytime = modifytime;
	}

	public Integer getHid() {
		return hid;
	}

	public void setHid(Integer hid) {
		this.hid = hid;
	}

	public String getHarea() {
		return harea;
	}

	public void setHarea(String harea) {
		this.harea = harea;
	}

	public String getHxq() {
		return hxq;
	}

	public void setHxq(String hxq) {
		this.hxq = hxq;
	}

	public String getHdy() {
		return hdy;
	}

	public void setHdy(String hdy) {
		this.hdy = hdy;
	}

	public Integer getHceng() {
		return hceng;
	}

	public void setHceng(Integer hceng) {
		this.hceng = hceng;
	}

	public String getHroom() {
		return hroom;
	}

	public void setHroom(String hroom) {
		this.hroom = hroom;
	}

	public Double getHacreage() {
		return hacreage;
	}

	public void setHacreage(Double hacreage) {
		this.hacreage = hacreage;
	}

	public Integer getHorientation() {
		return horientation;
	}

	public void setHorientation(Integer horientation) {
		this.horientation = horientation;
	}

	public Integer getHfinish() {
		return hfinish;
	}

	public void setHfinish(Integer hfinish) {
		this.hfinish = hfinish;
	}

	public Boolean getHsq() {
		return hsq;
	}

	public void setHsq(Boolean hsq) {
		this.hsq = hsq;
	}

	public Integer getHlimit() {
		return hlimit;
	}

	public void setHlimit(Integer hlimit) {
		this.hlimit = hlimit;
	}

	public String getHptss() {
		return hptss;
	}

	public void setHptss(String hptss) {
		this.hptss = hptss;
	}

	public Double getHprice() {
		return hprice;
	}

	public void setHprice(Double hprice) {
		this.hprice = hprice;
	}

	public Integer getHstate() {
		return hstate;
	}

	public void setHstate(Integer hstate) {
		this.hstate = hstate;
	}

	public String getHimg() {
		return himg;
	}

	public void setHimg(String himg) {
		this.himg = himg;
	}

	public String getHaddress() {
		return haddress;
	}

	public void setHaddress(String haddress) {
		this.haddress = haddress;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public String getModifytime() {
		return modifytime;
	}

	public void setModifytime(String modifytime) {
		this.modifytime = modifytime;
	}
	 
	
	 
}
