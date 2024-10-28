package com.sai.connect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.sai.model.Placement;
import com.sai.model.Skills;

public class SkillsCrud {
	static Connection con = null;
	static {
		Connect c = new Connect();
		con = c.connect();
	}
	public boolean add(Skills p) {
		String query = "insert into skills(roadmap,name,rollno,sname)values(?,?,?,?)";
		boolean b = true;
		try {
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1,p.getRoadmap());
			pst.setString(2,p.getName());
			pst.setString(3,p.getRollno());
			pst.setString(4,p.getSname());
			b = pst.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return b;

	}
	
	public ArrayList read() {
		String query = "select * from skills ORDER BY id DESC";
	ArrayList list = new ArrayList();
	Skills p = null;
		try {
			PreparedStatement pst = con.prepareStatement(query);
			ResultSet res = pst.executeQuery();
			
			while (res.next()) {
				p = new Skills(res.getString(2), res.getString(3),res.getString(4) ,res .getString(5)) ;
list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();

		}
		return list;
	}

}
