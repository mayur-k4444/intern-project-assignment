<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Assignment page</title>
  <link rel="stylesheet" href="add_assign.css">
</head>
<body>


  <div class="assignment-container">
    <h1>Add Assignment</h1>
    <div class="form-row">
      <form action="addsubject" method="post" enctype="multipart/form-data">
        <input type="text" id="taskInput" name="subject" placeholder="Enter a new Assignment..." />
        <input type="file" id="assign" name="file" />
        <button name="submit" type="submit">Add</button>
      </form>
    </div>
    <ul id="taskList"></ul>



<table border="1">
  <tr>
    <th>Subject</th>
    <th>View File</th>
    <th>Delete File</th>
  </tr>

<%


try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignmentupdow", "root", "");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM subjectdatabase");

    while (rs.next()) {
      String dbSubject = rs.getString("Subject");
      session.setAttribute("dbSubject", dbSubject);
      String file = rs.getString("filename");
      String filePath = "file:///" + file;
      String fileEscaped = filePath.replace("'", "\\'");
      
      out.println("<tr>");
      out.println("<td>" + dbSubject + "</td>");
      out.println("<td><button onclick=\"openPDF('" + fileEscaped + "')\">View PDF</button></td>");
      //out.println("<td><a href='" + file + "' target='_blank'>View PDF</a></td>");
      out.println("<td><a href='TRdeletefile?srno="+rs.getString("srno") +"'>Delete</a></td>");
      out.println("</tr>");
      
    }

    rs.close();
    stmt.close();
    con.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>

  </table>
</div>
<script>
  function openPDF(filename) {
    if (filename) {
      window.open(filename, '_blank');
    } else {
      alert("File not found");
    }
  }
</script>

</body>
</html>
