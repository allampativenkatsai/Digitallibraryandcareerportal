package com.sai.model;

public class User {

	// table columns
	private String name;
	private String email;
	private String password;
	private String phnum;
	private String branch;
	private String year;
	private String rollno;

	// constructors
	public User() {
		super();
	}

	public User(String name, String email, String password, String phnum, String branch, String year, String rollno) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.phnum = phnum;
		this.branch = branch;
		this.year = year;
		this.rollno = rollno;
	}

public User(String name, String branch, String rollno) {
		super();
		this.name = name;
		this.branch = branch;
		this.rollno = rollno;
	}

	//getters and setters
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhnum() {
		return phnum;
	}

	public void setPhnum(String phnum) {
		this.phnum = phnum;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getRollno() {
		return rollno;
	}

	public void setRollno(String rollno) {
		this.rollno = rollno;
	}

	@Override
	public String toString() {
		return "User [name=" + name + ", email=" + email + ", password=" + password + ", phnum=" + phnum + ", branch="
				+ branch + ", year=" + year + ", rollno=" + rollno + "]";
	}

}
