package com.sai.model;

public class Project {
	private String title;
	private String description;
	private String branch;
	private String url;
    private String apporve;
	private String name;
	private String rollno;
	public Project( String title,String description, String branch, String url,  String name,
			String rollno,String apporve) {
		super();
		this.title = title;
		this.description = description;
		this.branch = branch;
		this.url = url;
		this.apporve = apporve;
		this.name = name;
		this.rollno = rollno;
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

	public Project( String description, String title,String branch, String url) {
		super();
		this.title = title;
		this.description = description;
		this.branch = branch;
		this.url = url;
		
	}

	public String getApporve() {
		return apporve;
	}

	public void setApporve(String apporve) {
		this.apporve = apporve;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	

	public Project() {
		super();
		
	}

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

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	

}
