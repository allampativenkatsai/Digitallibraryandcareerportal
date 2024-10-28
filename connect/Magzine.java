package com.sai.connect;

public class Magzine {
	
	private String title;
	private String description;
	private String url;
	private String rollno;
    private String approve;
    private String name;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getRollno() {
		return rollno;
	}
	public void setRollno(String rollno) {
		this.rollno = rollno;
	}
	public String getApprove() {
		return approve;
	}
	public void setApprove(String approve) {
		this.approve = approve;
	}
	
	public Magzine(String title, String description, String url, String rollno, String approve, String name) {
		super();
		this.title = title;
		this.description = description;
		this.url = url;
		this.rollno = rollno;
		this.approve = approve;
		this.name = name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Magzine() {
		super();
	}
	@Override
	public String toString() {
		return "Magzine [title=" + title + ", description=" + description + ", url=" + url + ", rollno=" + rollno
				+ ", apporve=" + approve + ", name=" + name + "]";
	}
	
}
