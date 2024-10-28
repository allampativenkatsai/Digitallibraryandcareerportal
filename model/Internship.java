package com.sai.model;

public class Internship {
private String descr;
private String name;
private String rollno;
private String comname;

public Internship(String descr, String name, String rollno, String comname) {
	super();
	this.descr = descr;
	this.name = name;
	this.rollno = rollno;
	this.comname = comname;
}
public String getComname() {
	return comname;
}
public void setComname(String comname) {
	this.comname = comname;
}
public Internship() {
	super();
	// TODO Auto-generated constructor stub
}
public String getDescr() {
	return descr;
}
public void setDescr(String descr) {
	this.descr = descr;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getRollno() {
	return rollno;
}
public void setRollno(String rollno) {
	this.rollno = rollno;
}
@Override
public String toString() {
	return "Internship [descr=" + descr + ", name=" + name + ", rollno=" + rollno + ", comname=" + comname + "]";
}

}
