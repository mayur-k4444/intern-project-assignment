package com;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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

        HttpSession session4 = req.getSession();
        session4.setAttribute("StudentId", studentId);
        session4.setAttribute("email", email);
        session4.setAttribute("password", password);
        System.out.println("<a href='apimail'>visit second servlet </a><br>");
        
        try {
            if (Courselist.equals("BscIT") ) {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignmentupdow","root","");
                    PreparedStatement pr = con.prepareStatement("insert into bscit(StudentId) values(?)");
                    pr.setString(1, studentId);
                    int i = pr.executeUpdate();
                    if (i>0) {
                        out.println("insert upload succesfully");
                    }
                } catch (Exception e) {
                    out.println("Error :"+e.getMessage());
                }
                
            }else{
                System.out.println("Error : "+Courselist);
            }
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignmentupdow","root","");
            PreparedStatement pr = con.prepareStatement("insert into registration(firstName,middleName,lastName,gender,email,contact,studentId,password,Course_list) values(?,?,?,?,?,?,?,?,?)");
            pr.setString(1, firstName);
            pr.setString(2, middleName);
            pr.setString(3, lastName);
            pr.setString(4, gender);
            pr.setString(5, email);
            pr.setString(6, contactnumber);
            pr.setString(7, studentId);
            pr.setString(8, password);
            pr.setString(9, Courselist);

            int i = pr.executeUpdate();
            if (i>0) {
                out.println("Registration succesfully");      
            }

            resp.sendRedirect("index.jsp");

        } catch (Exception e) {
            System.out.println("Error :"+e.getMessage());
        }
        

    }


}
