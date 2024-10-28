package com.sai.connect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.sai.model.Placement;
import com.sai.model.User;

public class PlacementCrud {
	static Connection con = null;
	static {
		Connect c = new Connect();
		con = c.connect();
	}
	public boolean add(Placement p) {
		String query = "insert into placements(rollno,text,name)values(?,?,?)";
		boolean b = true;
		try {
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1,p.getRollno());
			pst.setString(2,p.getText());
			pst.setString(3,p.getName());
			b = pst.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return b;

	}
	
	public ArrayList read() {
		String query = "select * from placements ORDER BY id DESC";
	ArrayList list = new ArrayList();
	Placement p = null;
		try {
			PreparedStatement pst = con.prepareStatement(query);
			ResultSet res = pst.executeQuery();
			
			while (res.next()) {
				p = new Placement(res.getString(2), res.getString(3),res.getString(4));
list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();

		}
		return list;
	}
}
