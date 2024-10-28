package com.sai.model;

public class Skills {
private String roadmap;
private String name;
private String rollno;
private String sname;
public Skills(String roadmap, String name, String rollno, String sname) {
	super();
	this.roadmap = roadmap;
	this.name = name;
	this.rollno = rollno;
	this.sname = sname;
}
public String getRoadmap() {
	return roadmap;
}
public void setRoadmap(String roadmap) {
	this.roadmap = roadmap;
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
public String getSname() {
	return sname;
}
public void setSname(String sname) {
	this.sname = sname;
}
@Override
public String toString() {
	return "Skills [roadmap=" + roadmap + ", name=" + name + ", rollno=" + rollno + ", sname=" + sname + "]";
}
public Skills() {
	super();
	// TODO Auto-generated constructor stub
}


}
