package com.sai.model;

public class Book {
	
	private String title;
	private String author;
	private String branch;
	private String url;
	private String approve;
	private String name;
	private String rollno;
	public String available;

public Book(String title, String author, String branch, String url, String approve, String rollno, String name,
			String available) {
		super();
		this.title = title;
		this.author = author;
		this.branch = branch;
		this.url = url;
		this.approve = approve;
		this.name = name;
		this.rollno = rollno;
		this.available = available;
	}
public String getAvailable() {
		return available;
	}
	public void setAvailable(String available) {
		this.available = available;
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
	//constructors
	public Book() {
		super();
	}
	public Book(String title, String author, String branch, String url, String approve,String available) {
		super();
		this.title = title;
		this.author = author;
		this.branch = branch;
		this.url = url;
		this.approve = approve;
		this.available= available;
	}

	// getters and setters
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getApprove() {
		return approve;
	}

	public void setApprove(String approve) {
		this.approve = approve;
	}

		public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	@Override
	public String toString() {
		return "Book [title=" + title + ", author=" + author + ", branch=" + branch + ", url=" + url + ", approve="
				+ approve + ", name=" + name + ", rollno=" + rollno + "]";
	}

	
}
