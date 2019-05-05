package com.zy.contract.pojo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.zy.house.pojo.House;
import com.zy.tenant.pojo.Tenant;

public class Contract {
	private Integer coid;
	private House cohid;
	
	private Tenant cotid;
	private String  codata;
	private String cobegin;
	private String coend;
	private Double cohrental;
	private String comway;
	private Double coyajin;
	private Integer coperiods;
	private String coconpeo;
	private Integer coconzt;

	public Integer getCoid() {
		
		return coid;
	}

	public void setCoid(Integer coid) {
		this.coid = coid;
	}

	public String getCodata() {
		return codata;
	}

	public void setCodata(String codata) {
		this.codata = codata;
	}
	@Override
	public String toString() {
		return "Contract [coid=" + coid + ", cohid=" + cohid + ", cotid=" + cotid + ", codata=" + codata + ", cobegin="
				+ cobegin + ", coend=" + coend + ", cohrental=" + cohrental + ", comway=" + comway + ", coyajin="
				+ coyajin + ", coperiods=" + coperiods + ", coconpeo=" + coconpeo + ", coconzt=" + coconzt + "]";
	}

	

	public String getCobegin() {
		// SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 //String format = sd.format(cobegin);
		 return cobegin;
	}

	public void setCobegin(String cobegin) {
		this.cobegin = cobegin;
	}

	public String getCoend() {
		return coend;
	}

	public void setCoend(String coend) {
		this.coend = coend;
	}

	public Double getCohrental() {
		return cohrental;
	}

	public void setCohrental(Double cohrental) {
		this.cohrental = cohrental;
	}

	public String getComway() {
		return comway;
	}

	public void setComway(String comway) {
		this.comway = comway;
	}

	public Double getCoyajin() {
		return coyajin;
	}

	public void setCoyajin(Double coyajin) {
		this.coyajin = coyajin;
	}

	public Integer getCoperiods() {
		return coperiods;
	}

	public void setCoperiods(Integer coperiods) {
		this.coperiods = coperiods;
	}

	public String getCoconpeo() {
		return coconpeo;
	}

	public void setCoconpeo(String coconpeo) {
		this.coconpeo = coconpeo;
	}

	public Integer getCoconzt() {
		return coconzt;
	}

	public void setCoconzt(Integer coconzt) {
		this.coconzt = coconzt;
	}

	

	public House getCohid() {
		return cohid;
	}

	public void setCohid(House cohid) {
		this.cohid = cohid;
	}

	public Tenant getCotid() {
		return cotid;
	}

	public void setCotid(Tenant cotid) {
		this.cotid = cotid;
	}

	public Contract(Integer coid, House cohid, Tenant cotid, String codata, String cobegin, String coend,
			Double cohrental, String comway, Double coyajin, Integer coperiods, String coconpeo, Integer coconzt) {
		super();
		this.coid = coid;
		this.cohid = cohid;
		this.cotid = cotid;
		this.codata = codata;
		this.cobegin = cobegin;
		this.coend = coend;
		this.cohrental = cohrental;
		this.comway = comway;
		this.coyajin = coyajin;
		this.coperiods = coperiods;
		this.coconpeo = coconpeo;
		this.coconzt = coconzt;
	}

	public Contract() {
		super();
	}

}
