package com.zy.login.entity;

import java.io.Serializable;

public class Pow implements Serializable{
private Integer pid;
private String  pname;
private Integer parentid;
private String url;

public String getUrl() {
	return url;
}
public void setUrl(String url) {
	this.url = url;
}
public Integer getPid() {
	return pid;
}
public void setPid(Integer pid) {
	this.pid = pid;
}
public String getPname() {
	return pname;
}
public void setPname(String pname) {
	this.pname = pname;
}
public Integer getParentid() {
	return parentid;
}
public void setParentid(Integer parentid) {
	this.parentid = parentid;
}


}
