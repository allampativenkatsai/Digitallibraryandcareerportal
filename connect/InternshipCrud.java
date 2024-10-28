package com.sai.connect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.sai.model.Internship;

public class InternshipCrud {
    static Connection con = null;
    static {
        Connect c = new Connect();
        con = c.connect();
    }

    public boolean add(Internship internship) {
        String query = "INSERT INTO internship(descr, name, rollno, comname) VALUES (?, ?, ?, ?)";
        boolean success = false; // Assume it fails by default
        try {
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, internship.getDescr());
            pst.setString(2, internship.getName());
            pst.setString(3, internship.getRollno());
            pst.setString(4, internship.getComname());
            success = pst.executeUpdate() > 0; // true if rows were affected
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }

    public ArrayList<Internship> read() {
        String query = "SELECT * FROM internship ORDER BY id DESC";
        ArrayList<Internship> list = new ArrayList<>();
        try {
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet res = pst.executeQuery();
            while (res.next()) {
                Internship internship = new Internship(res.getString(2), res.getString(3), res.getString(4), res.getString(5));
                list.add(internship);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
