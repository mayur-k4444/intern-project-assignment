package com;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;

@WebServlet("/registrationin")
public class registrationin extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        String firstName = req.getParameter("firstName");
        String middleName = req.getParameter("middleName");
        String lastName = req.getParameter("lastName");
        String gender = req.getParameter("gender");
        String email = req.getParameter("email");
        String contactnumber = req.getParameter("contactnumber");
        String studentId = req.getParameter("studentId");
        String password = req.getParameter("password");
        String Courselist = req.getParameter("Courselist");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignmentupdow","root","");
            PreparedStatement pr = con.prepareStatement("insert into registration(firstName,middleName,lastName,gender,email,contact,studentId,password,Course_list) values(?,?,?,?,?,?,?,?,?)");
            PreparedStatement pr1 = con.prepareStatement("insert into bscit(StudentId) values(?)");
            pr.setString(1, firstName);
            pr.setString(2, middleName);
            pr.setString(3, lastName);
            pr.setString(4, gender);
            pr.setString(5, email);
            pr.setString(6, contactnumber);
            pr.setString(7, studentId);
            pr.setString(8, password);
            pr.setString(9, Courselist);

            pr1.setString(1, studentId);
            int j = pr1.executeUpdate();
            if (j>0) {
                out.println("bsit is succesfully");
            }

            int i = pr.executeUpdate();
            if (i>0) {
                    out.println("Registration succesfully");
            }


        } catch (Exception e) {
            System.out.println("Error :"+e.getMessage());
        }
        resp.sendRedirect("index.jsp");

    }


}
