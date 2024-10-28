package com.sai.model;

public class News {
String news ;
String date;
public String getNews() {
	return news;
}
public void setNews(String news) {
	this.news = news;
}
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
public News(String news, String date) {
	super();
	this.news = news;
	this.date = date;
}
@Override
public String toString() {
	return "News [news=" + news + ", date=" + date + "]";
}
public News() {
	super();
	// TODO Auto-generated constructor stub
}


}
