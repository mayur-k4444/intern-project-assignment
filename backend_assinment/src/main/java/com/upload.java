package com;

import java.io.IOException;
// import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/upload")
public class upload extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        // PrintWriter out = resp.getWriter();

        String stdId = req.getParameter("StudentId2");
        String Coursename = req.getParameter("FirstYear");
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignmentupdow ","root","");
            PreparedStatement pr = con.prepareStatement("insert into bscit(StudentId,Course_name) values(?,?)");
            pr.setString(1, stdId);
            pr.setString(2, Coursename);
            int i = pr.executeUpdate();
            if (i>0) {
                System.out.println("Upload succesfully");
            }
        }catch (Exception e) {
            System.out.println("Error :"+e.getMessage());
        }
        String Ipa = req.getParameter("Ipa");
        if (Ipa != null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignmentupdow ","root","");
            PreparedStatement pr = con.prepareStatement("UPDATE bscit SET Ipa = ? WHERE StudentId = ?");
            pr.setString(1, Ipa);
            pr.setString(2, stdId);
            int i = pr.executeUpdate();
            if (i>0) {
                System.out.println("Upload ipa succesfully");
            }

            } catch (Exception e) {
                System.out.println("Error :"+e.getMessage());
            }
        }
        String Dea = req.getParameter("Dea");
        String Osa = req.getParameter("Osa");
        String Dma = req.getParameter("Dma");
        String Csa = req.getParameter("Csa");

        String Oops = req.getParameter("Oops");
        String Maa = req.getParameter("Maa");
        String Wpa = req.getParameter("Wpa");
        String NSma = req.getParameter("NSma");
        String Gca = req.getParameter("Gca");

        


        
    }

}
