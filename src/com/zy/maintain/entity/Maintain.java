package com.zy.maintain.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.sound.midi.MidiChannel;

import com.zy.backoffice.entity.Back;
import com.zy.login.entity.House;

public class Maintain {
private Integer mid;
private Integer mpid;
private String mexplain;
private String mresult;
private String mbz;
private String mtime;
private Integer mhouse;
private House house;
private Back back;
private String  createtime;
private String  modifytime;
private Double mjBegin;
private Double mjEnd;
private String  hptss;
private String[]  hptsss;

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

public String getHptss() {
	return hptss;
}
public void setHptss(String hptss) {
	this.hptss = hptss;
}
public String[] getHptsss() {
	if(this.hptss!= null){
		return this.hptss.split(",");
	}
	return null;
}
public void setHptsss(String[] hptsss) {
	this.hptsss = hptsss;
}
public Integer getMid() {
	return mid;
}
public void setMid(Integer mid) {
	this.mid = mid;
}
public Integer getMpid() {
	return mpid;
}
public void setMpid(Integer mpid) {
	this.mpid = mpid;
}
public String getMexplain() {
	return mexplain;
}
public void setMexplain(String mexplain) {
	this.mexplain = mexplain;
}
public String getMresult() {
	return mresult;
}
public void setMresult(String mresult) {
	this.mresult = mresult;
}
public String getMbz() {
	return mbz;
}
public void setMbz(String mbz) {
	this.mbz = mbz;
}
public String getMtime() {
//	 Date date = new Date();
//	 SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//	 String format = sd.format(date);
	// return format;
	return mtime;
}
public void setMtime(String mtime) {
	this.mtime = mtime;
}
public Integer getMhouse() {
	return mhouse;
}
public void setMhouse(Integer mhouse) {
	this.mhouse = mhouse;
}
public House getHouse() {
	return house;
}
public void setHouse(House house) {
	this.house = house;
}
public Back getBack() {
	return back;
}
public void setBack(Back back) {
	this.back = back;
}
@Override
public String toString() {
	return "Maintain [mid=" + mid + ", mpid=" + mpid + ", mexplain=" + mexplain + ", mresult=" + mresult + ", mbz="
			+ mbz + ", mtime=" + mtime + ", mhouse=" + mhouse + ", house=" + house + ", back=" + back + "]";
}


}
