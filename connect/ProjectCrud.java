package com.sai.connect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.sai.model.Project;

public class ProjectCrud {
    private static final String APPROVED = "yes";
    private static final String NOT_APPROVED = "no";
    
    private Connection con;

    public ProjectCrud() {
        Connect c = new Connect();
        this.con = c.connect();
    }

    public ArrayList<Project> read(String branch) {
        String query = "SELECT * FROM project WHERE branch=? AND approve=?";
        ArrayList<Project> list = new ArrayList<>();
        
        try (PreparedStatement pst = con.prepareStatement(query)) {
            pst.setString(1, branch);
            pst.setString(2, APPROVED);
            ResultSet res = pst.executeQuery();
            
            while (res.next()) {
            	 Project p = new Project(res.getString(2), res.getString(3), res.getString(4),
                         res.getString(5), res.getString(6), res.getString(7), res.getString(8));
                list.add(p);
               
            }
        } catch (SQLException e) {
        
            e.printStackTrace();
        }

        return list;
    }

    public ArrayList<Project> read() {
        String query = "SELECT * FROM project WHERE approve=?";
        ArrayList<Project> list = new ArrayList<>();
        
        try (PreparedStatement pst = con.prepareStatement(query)) {
            pst.setString(1, NOT_APPROVED);
            ResultSet res = pst.executeQuery();
            
            while (res.next()) {
                Project p = new Project(res.getString(2), res.getString(3), res.getString(4),
                                        res.getString(5), res.getString(6), res.getString(7), res.getString(8));
                list.add(p);
                System.out.println("jgjh");
                System.out.print(list);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public int update(String rollno, String title) {
        String query = "UPDATE project SET approve=? WHERE rollno=? AND title=?";
        
        try (PreparedStatement pst = con.prepareStatement(query)) {
            pst.setString(1, APPROVED);
            pst.setString(2, rollno);
            pst.setString(3, title);
            return pst.executeUpdate(); // Return true if update was successful
        } catch (SQLException e) {
            // Use a logging framework
            e.printStackTrace();
            return 0;
        }
    }

    public int delete(String rollno, String title) {
        String query = "DELETE FROM project WHERE rollno=? AND title=?";
        int  a = 0;
        try (PreparedStatement pst = con.prepareStatement(query)) {
            pst.setString(1, rollno);
            pst.setString(2, title);
            a= pst.executeUpdate();
            return a; // Return true if deletion was successful
        } catch (SQLException e) {
            // Use a logging framework
            e.printStackTrace();
            return a;
        }
    }
}
