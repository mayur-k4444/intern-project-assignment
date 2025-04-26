package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/TeacherRegistrationin")
public class TeacherRegistrationin extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        String firstName = req.getParameter("firstName");
        String middleName = req.getParameter("middleName");
        String lastName = req.getParameter("lastName");
        String gender = req.getParameter("gender");
        String email = req.getParameter("email");
        String contactnumber = req.getParameter("contactnumber");
        String TeacherId = req.getParameter("TeacherId");
        String password = req.getParameter("password");
        String faculty = req.getParameter("Faculty");
        String teachingyear = req.getParameter("TeachingYear");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignmentupdow","root","");
            PreparedStatement pr = con.prepareStatement("INSET INTO teacherregistration(FirstName,MiddleName,LastName,Gender,Email,Contact,TeacherId,Password,Faculty,TeachingYear) VALUES(?,?,?,?,?,?,?,?,?,?)");
            pr.setString(1, firstName);
            pr.setString(2, middleName);
            pr.setString(3, lastName);
            pr.setString(4, gender);
            pr.setString(5, email);
            pr.setString(6, contactnumber);
            pr.setString(7, TeacherId);
            pr.setString(8, password);
            pr.setString(9, faculty);
            pr.setString(10, teachingyear);
            int i = pr.executeUpdate();
            if (i>0) {
                System.out.println("Registration succesfully");      
            }

            
        } catch (Exception e) {
            System.out.println("Error :"+e.getMessage());
        }
        super.doPost(req, resp);
    }

}
