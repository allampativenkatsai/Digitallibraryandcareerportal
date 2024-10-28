package com.sai.connect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


public class NewsCrud {
    
    static Connection con;
    static {
        Connect c = new Connect();
        con = c.connect();
    }

    public List<String> read() {
        String query = "SELECT * FROM news ORDER BY id DESC";
        ResultSet res = null;
        List<String> list = new ArrayList<>(); // Initialize list
        try {
            PreparedStatement pst = con.prepareStatement(query);
            res = pst.executeQuery();
            // Check if there are any results
            if (res.next()) {
                String longText = res.getString(2);
                list = formatText(longText);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list; 
    }

    public List<String> formatText(String longText) {
  
        return longText != null ? Arrays.asList(longText.split("\n")) : new ArrayList<>();
    }
    
    public int insert (String news,String date) {
    	System.out.println("News: " + news);
    	System.out.println("Date: " + date);

    	String query = "insert into news(news,date) values(?,?)";
    	int a = 0 ;
    	 try {
             PreparedStatement pst = con.prepareStatement(query);
             pst.setString(1, news);
             pst.setString(2, date);
           a=  pst.executeUpdate();
         } catch (SQLException e) {
             e.printStackTrace();
         }
    	return a ;
    }
}
