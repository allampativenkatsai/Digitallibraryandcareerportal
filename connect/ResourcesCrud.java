package com.sai.connect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.sai.model.Placement;
import com.sai.model.Resources;

public class ResourcesCrud {
	static Connection con = null;
	static {
		Connect c = new Connect();
		con = c.connect();
	}
	public boolean add(Resources p) {
		String query = "insert into resources(type,url,name,rollno)values(?,?,?,?)";
		boolean b = true;
		try {
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1,p.getType());
			pst.setString(2,p.getUrl());
			pst.setString(3,p.getName());
			pst.setString(4,p.getRollno());
	
			
			b = pst.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return b;

	}
	
	public ArrayList read() {
		String query = "select * from resources ORDER BY id DESC";
	ArrayList list = new ArrayList();
	Resources p = null;
		try {
			PreparedStatement pst = con.prepareStatement(query);
			ResultSet res = pst.executeQuery();
			
			while (res.next()) {
				p = new Resources(res.getString(2), res.getString(3),res.getString(4),res.getString(5));
list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();

		}
		return list;
	}
}
