package com.sai.model;

public class BookLog {
	private String name;
	private String rollno;
	private String branch;
	private String title;	
	private String taken;
	private String receive;
	public BookLog(String name, String rollno, String branch, String title, String taken, String receive) {
		super();
		this.name = name;
		this.rollno = rollno;
		this.branch = branch;
		this.title = title;
		this.taken = taken;
		this.receive=receive;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public BookLog(String name, String rollno, String title, String taken, String receive) {
		super();
		this.name = name;
		this.rollno = rollno;
		this.title = title;
		this.taken = taken;
		this.receive = receive;
	}
	public BookLog() {
		super();
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTaken() {
		return taken;
	}
	public void setTaken(String taken) {
		this.taken = taken;
	}
	public String getReceive() {
		return receive;
	}
	public void setReceive(String receive) {
		this.receive = receive;
	}
	@Override
	public String toString() {
		return "BookLog [name=" + name + ", rollno=" + rollno + ", title=" + title + ", taken=" + taken + ", receive="
				+ receive + "]";
	}
	
	

}
