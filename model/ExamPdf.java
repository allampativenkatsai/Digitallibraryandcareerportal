package com.sai.model;

public class ExamPdf {
	private String rollno;
	private String title;
	
	private String description;
	private String branch;
	private String sem;
	private String url;
    private String apporve;
    public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	private String name;
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
	public String getSem() {
		return sem;
	}
	public void setSem(String sem) {
		this.sem = sem;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getApporve() {
		return apporve;
	}
	public void setApporve(String apporve) {
		this.apporve = apporve;
	}
	
	public ExamPdf(String rollno, String title, String description, String branch, String sem, String url,
			String apporve, String name) {
		super();
		this.rollno = rollno;
		this.title = title;
		this.description = description;
		this.branch = branch;
		this.sem = sem;
		this.url = url;
		this.apporve = apporve;
		this.name = name;
	}
	public ExamPdf() {
		super();
	
	}
	@Override
	public String toString() {
		return "ExamPdf [rollno=" + rollno + ", title=" + title + ", description=" + description + ", branch=" + branch
				+ ", sem=" + sem + ", url=" + url + ", apporve=" + apporve + ", name=" + name + "]";
	}
	

}
