<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Assignments</title>
    <link rel="stylesheet" href="fy/fy.css">

</head>
<body>
<%
    String studentId = (String) session.getAttribute("studentId");
    String subject = request.getParameter("subject");
            if (studentId == null) {
                response.sendRedirect("loginindex.jsp");
                return;
            }

%>
<div class="wraper" id="wraper">
    <div class="container_subject">
        <h1>Assignments</h1>
        <input type="text" value="<%= studentId%>" name="FirstYear" style="display:none;">
<%
    try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignmentupdow","root","");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM subjectdatabase");

while (rs.next()) {

%>
            <!-- Math Assignment -->
            <div class="assignment">
                <h2><%= rs.getString("Subject") %>  Assignment</h2>
                <div class="file-row">
                <a href="<%= rs.getString("filename") %>" class="download-btn" download>Download</a>
                </div>
                
                <form class="uploadForm" action="upload_data_bscit" method="post" enctype="multipart/form-data">   
                    <input type="file"  name="file" class="file">
                    <input type="text" value="<%= rs.getString("Subject") %>" name="subject" style="display:none;">
                    <button class="upload-btn" type="submit">Upload Answer</button>
                </form>
            </div>
<%
        }
        rs.close();
        stmt.close();
        con.close();
    }catch (Exception e) {
        e.printStackTrace();
    }

%>

        </div>
</div>
    <!-- <script src="fy/fy.js">
    
    </script> -->
</body>
</html>