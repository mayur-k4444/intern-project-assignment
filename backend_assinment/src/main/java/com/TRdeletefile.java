package com;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/TRdeletefile")

public class TRdeletefile extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String srno = req.getParameter("srno");
        HttpSession session = req.getSession();
        String subject = (String) session.getAttribute("dbSubject");
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignmentupdow","root","");
            java.sql.Statement st = con.createStatement();
            String query2 = "SELECT Subject FROM subjectdatabase WHERE srno = " + srno;
            String query = "DELETE FROM subjectdatabase WHERE srno = " + srno;
            int i = st.executeUpdate(query);
            // int j = st.executeUpdate(query2);
            // if (j > 0) {
            //     System.out.println("Subject selected successfull.");
            // } else {
            //     System.out.println("Subject not selected.");
                
            // }
            if (i > 0) {
                resp.sendRedirect("TRBscIT.jsp");
            } else {
                resp.sendRedirect("TRBscIT.jsp?msg=File not deleted.");
                
            }
        } catch (ClassNotFoundException|SQLException e) {
            System.out.println("Error :"+e.getMessage());
        }

        deleteSubjectToDatabase(subject,query2);
    }
        
    private void deleteSubjectToDatabase(String subject) {
        // System.out.println("function werked"+subject);
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignmentupdow","root","");
            String sql = "ALTER TABLE bscit DROP COLUMN "+ subject;
            java.sql.Statement stmt = con.createStatement(); // Use Statement, not PreparedStatement
            stmt.executeUpdate(sql);

            System.out.println("Column 'subject' dropped from bscitsubject table.");
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error dropping column: " + e.getMessage());
        }
    }

}
