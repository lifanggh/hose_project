package com.zy.backoffice.entity;

import java.text.SimpleDateFormat;
import java.util.Date;


public class Back {
private Integer bid;
private String bname;
private String bidcard;
private String bphone;
private String bsex;
private String bjob;
private Double bwage;
private String badress;
private String btime;
public Integer getBid() {
	return bid;
}
public void setBid(Integer bid) {
	this.bid = bid;
}
public String getBname() {
	return bname;
}
public void setBname(String bname) {
	this.bname = bname;
}
public String getBidcard() {
	return bidcard;
}
public void setBidcard(String bidcard) {
	this.bidcard = bidcard;
}
public String getBphone() {
	return bphone;
}
public void setBphone(String bphone) {
	this.bphone = bphone;
}
public String getBsex() {
	return bsex;
}
public void setBsex(String bsex) {
	this.bsex = bsex;
}
public String getBjob() {
	return bjob;
}
public void setBjob(String bjob) {
	this.bjob = bjob;
}
public Double getBwage() {
	return bwage;
}
public void setBwage(Double bwage) {
	this.bwage = bwage;
}
public String getBadress() {
	return badress;
}
public void setBadress(String badress) {
	this.badress = badress;
}
public String getBtime() {
	 Date date = new Date();
	 SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	 String format = sd.format(date);
	 return format;
}
public void setBtime(String btime) {
	this.btime=btime;
			 
}
public Back(Integer bid, String bname, String bidcard, String bphone, String bsex, String bjob, Double bwage,
		String badress, String btime) {
	super();
	this.bid = bid;
	this.bname = bname;
	this.bidcard = bidcard;
	this.bphone = bphone;
	this.bsex = bsex;
	this.bjob = bjob;
	this.bwage = bwage;
	this.badress = badress;
	this.btime = btime;
}
public Back() {
	super();
}

}
