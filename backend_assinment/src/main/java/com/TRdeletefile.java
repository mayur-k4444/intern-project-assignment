package com;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/TRdeletefile")

public class TRdeletefile extends HttpServlet{
    private String query2;
    
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String srno = req.getParameter("srno");
            String subject = null;
            // HttpSession session = req.getSession();
            // String subject = (String) session.getAttribute("dbSubject");
            
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignmentupdow","root","");
                java.sql.Statement st = con.createStatement();
                // Fetch subject name
                String selectQuery = "SELECT Subject FROM subjectdatabase WHERE srno = " + srno;
                ResultSet rs = st.executeQuery(selectQuery);
                if (rs.next()) {
                    subject = rs.getString("Subject");
                    System.out.println("Subject selected successfully: " + subject);
                } else {
                    System.out.println("Subject not found.");
                }

                // Delete the row
                String deleteQuery = "DELETE FROM subjectdatabase WHERE srno = " + srno;
                int i = st.executeUpdate(deleteQuery);

                if (i > 0) {
                    resp.sendRedirect("TRBscIT.jsp");
                } else {
                    resp.sendRedirect("TRBscIT.jsp?msg=File not deleted.");
                }

                st.close();
                con.close();
            } catch (ClassNotFoundException|SQLException e) {
                System.out.println("Error :"+e.getMessage());
            }
    
            if (subject != null && !subject.isEmpty()) {
                deleteSubjectToDatabase(subject);
                System.out.println("Subject deleted successfully: " + subject);
            }
    }
        
    private void deleteSubjectToDatabase(String subject) {
        // System.out.println("function werked"+subject);
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignmentupdow", "root", "");
            java.sql.Statement stmt = con.createStatement();
    
            String sql = "ALTER TABLE bscit DROP COLUMN `" + subject + "`"; // Backticks for safety
            stmt.executeUpdate(sql);
    
            System.out.println("Column dropped from bscit table: " + subject);
            stmt.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error dropping column: " + e.getMessage());
        }
    }

}
