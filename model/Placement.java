package com.sai.model;

public class Placement {
	private String rollno;
	private String text ;
	private String name;
	public Placement() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getRollno() {
		return rollno;
	}
	public void setRollno(String rollno) {
		this.rollno = rollno;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Placement(String rollno, String text, String name) {
		super();
		this.rollno = rollno;
		this.text = text;
		this.name = name;
	}
	@Override
	public String toString() {
		return "Placement [rollno=" + rollno + ", text=" + text + ", name=" + name + "]";
	}
	

}
