package com;

import java.sql.SQLException;

public class TRuserDaoImp implements TRuserDao{
    @Override
    public boolean isValidUser(String TeacherId,String password,String Faculty){
        String query = "SELECT * FROM  teacherregistration WHERE TeacherId = ? AND password = ? AND Faculty = ?";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            java.sql.Connection con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/assignmentupdow","root","");
            java.sql.PreparedStatement pr = con.prepareStatement(query);
            pr.setString(1, TeacherId);
            pr.setString(2, password);
            pr.setString(3, Faculty);

            java.sql.ResultSet res = pr.executeQuery();
            return res.next();

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
            
        
    }

    @Override
    public String getFaculty(String TeacherId, String password) throws SQLException {
        String query = "SELECT Faculty FROM teacherregistration WHERE TeacherId = ? AND password = ?";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            java.sql.Connection con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/assignmentupdow", "root", "");
            java.sql.PreparedStatement pr = con.prepareStatement(query);

            pr.setString(1, TeacherId);
            pr.setString(2, password);

            java.sql.ResultSet res = pr.executeQuery();
            if (res.next()) {
                return res.getString("Faculty");
            } else {
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error :" + e.getMessage());
        }
        return query;
    }

}
