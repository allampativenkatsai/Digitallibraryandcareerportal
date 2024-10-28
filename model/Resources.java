package com.sai.model;

public class Resources {
	private String type;
	private String url;
	private String name;
	private String rollno;
	public Resources(String type, String url, String name, String rollno) {
		super();
		this.type = type;
		this.url = url;
		this.name = name;
		this.rollno = rollno;
	}
	public Resources() {
		super();
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
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
		return "Resources [type=" + type + ", url=" + url + ", name=" + name + ", rollno=" + rollno + "]";
	}
	

}
