package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDaoImp implements UserDao{
    @Override
    public boolean isValidUser(String studentId,String password,String Course_list) throws SQLException{
        String query = "SELECT * FROM  registration WHERE studentId = ? AND password = ? AND Course_list = ?";
        
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignmentupdow","root","");
            PreparedStatement pr = con.prepareStatement(query);
            pr.setString(1, studentId);
            pr.setString(2, password);
            pr.setString(3, Course_list);

            ResultSet res = pr.executeQuery();
            return res.next();
            
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }

    @Override
    public String getCourseList(String studentId, String password) throws SQLException {
        String query = "SELECT Course_list FROM registration WHERE studentId = ? AND password = ?";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignmentupdow", "root", "");
             PreparedStatement pr = con.prepareStatement(query);

            pr.setString(1, studentId);
            pr.setString(2, password);

            ResultSet res = pr.executeQuery();
            if (res.next()) {
                return res.getString("Course_list");
            }else{
                return null;
            }
        }catch(Exception e){
            e.printStackTrace();
            System.out.println("Error :"+e.getMessage());
        }
        return query;
    }

}
