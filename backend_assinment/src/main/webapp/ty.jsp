<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Assignments</title>
    <link rel="stylesheet" href="ty.css">

</head>
<body>
  <%
        String studentId = (String) session.getAttribute("studentId");
        String subject = request.getParameter("subject");
        if (studentId == null) {
            response.sendRedirect("loginindex.jsp");
            return;
        }
        String Ita = null;
        String Awpa = null;
        String Spma = null;
        String Aia = null;
        String Eja = null;
        String Bia = null;
        String ITSma = null;
        String Sca = null;
        String Pgia = null;
        String Sqaa = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignmentupdow","root","");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM bscit WHERE StudentId = ?");
            ps.setString(1, studentId);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Ita = rs.getString("Ita");
                Awpa = rs.getString("Awpa");
                Spma = rs.getString("Spma");
                Aia = rs.getString("Aia");
                Eja = rs.getString("Eja");
                Bia = rs.getString("Bia");
                ITSma = rs.getString("ITSma");
                Sca = rs.getString("Sca");
                Pgia = rs.getString("Pgia");
                Sqaa = rs.getString("Sqaa");
            }
        }catch(ClassNotFoundException | SQLException e){
            System.out.println("Error :"+e.getMessage());
        }
    %>
  <div class="wraper" id="Thirdwraper">
    <div class="container_subject">
      <h1>Third Year Assignments</h1>
      <h3>SEM V</h3>
      <input type="text" value="TY" name="ThirdYear" style="display:none;" />

      <!-- Internet of Things -->
      <div class="assignment">
        <h2>Internet of Things Assignment</h2>
        <div class="file-row">
          <p>Assignment File</p>
          <a href="pt.pdf" class="download-btn" download>Download</a>
        </div>
        <form class="uploadForm" action="upload_data_bscit" method="post" enctype="multipart/form-data">
          <p>Upload Answer</p>
          <input type="file" name="file" class="file">
          <input type="text" value="Ita" name="subject" style="display:none;" />
          <button class="upload-btn" type="submit">Upload Answer</button>
          <% 
          if(Ita==null){%>
            <p class="unsuccess_Message" id="successIpa">Unsuccessfull upload</p>
          <%}
          else{%>
            <p class="success_Message" id="successIpa">Successfull upload</p>
          <%}%>
        </form>
      </div>

      <!-- Advanced Web Programming -->
      <div class="assignment">
        <h2>Advanced Web Programming Assignment</h2>
        <div class="file-row">
          <p>Assignment File</p>
          <a href="pt.pdf" class="download-btn" download>Download</a>
        </div>
        <form class="uploadForm" action="upload_data_bscit" method="post" enctype="multipart/form-data">
          <p>Upload Answer</p>
          <input type="file" name="file" class="file">
          <input type="text" value="Awpa" name="subject" style="display:none;" />
          <button class="upload-btn" type="submit">Upload Answer</button>
          <% 
          if(Awpa==null){%>
            <p class="unsuccess_Message" id="successIpa">Unsuccessfull upload</p>
          <%}
          else{%>
            <p class="success_Message" id="successIpa">Successfull upload</p>
          <%}%>
        </form>
      </div>

      <!-- Software Project Management -->
      <div class="assignment">
        <h2>Software Project Management Assignment</h2>
        <div class="file-row">
          <p>Assignment File</p>
          <a href="pt.pdf" class="download-btn" download>Download</a>
        </div>
        <form class="uploadForm" action="upload_data_bscit" method="post" enctype="multipart/form-data">
          <p>Upload Answer</p>
          <input type="file" name="file" class="file">
          <input type="text" value="Spma" name="subject" style="display:none;" />
          <button class="upload-btn" type="submit">Upload Answer</button>
          <% 
          if(Spma==null){%>
            <p class="unsuccess_Message" id="successIpa">Unsuccessfull upload</p>
          <%}
          else{%>
            <p class="success_Message" id="successIpa">Successfull upload</p>
          <%}%>
        </form>
      </div>

      <!-- Artificial Intelligence -->
      <div class="assignment">
        <h2>Artificial Intelligence Assignment</h2>
        <div class="file-row">
          <p>Assignment File</p>
          <a href="pt.pdf" class="download-btn" download>Download</a>
        </div>
        <form class="uploadForm" action="upload_data_bscit" method="post" enctype="multipart/form-data">
          <p>Upload Answer</p>
          <input type="file" name="file" class="file">
          <input type="text" value="Aia" name="subject" style="display:none;" />
          <button class="upload-btn" type="submit" >Upload Answer</button>
          <% 
          if(Aia==null){%>
            <p class="unsuccess_Message" id="successIpa">Unsuccessfull upload</p>
          <%}
          else{%>
            <p class="success_Message" id="successIpa">Successfull upload</p>
          <%}%>
        </form>
      </div>

      <!-- Enterprise Java -->
      <div class="assignment">
        <h2>Enterprise Java Assignment</h2>
        <div class="file-row">
          <p>Assignment File</p>
          <a href="pt.pdf" class="download-btn" download>Download</a>
        </div>
        <form class="uploadForm" action="upload_data_bscit" method="post" enctype="multipart/form-data">
          <p>Upload Answer</p>
          <input type="file" name="file" class="file">
          <input type="text" value="Eja" name="subject" style="display:none;" />
          <button class="upload-btn" type="submit" >Upload Answer</button>
          <% 
          if(Eja==null){%>
            <p class="unsuccess_Message" id="successIpa">Unsuccessfull upload</p>
          <%}
          else{%>
            <p class="success_Message" id="successIpa">Successfull upload</p>
          <%}%>
        </form>
      </div>
    </div>

    <!-- SEM VI -->
    <div class="container_subject">
      <h3>SEM VI</h3>

      <!-- Business Intelligence -->
      <div class="assignment">
        <h2>Business Intelligence Assignment</h2>
        <div class="file-row">
          <p>Assignment File</p>
          <a href="pt.pdf" class="download-btn" download>Download</a>
        </div>
        <form class="uploadForm" action="upload_data_bscit" method="post" enctype="multipart/form-data">
          <p>Upload Answer</p>
          <input type="file" name="file" class="file">
          <input type="text" value="Bia" name="subject" style="display:none;" />
          <button class="upload-btn" type="submit">Upload Answer</button>
          <% 
          if(Bia==null){%>
            <p class="unsuccess_Message" id="successIpa">Unsuccessfull upload</p>
          <%}
          else{%>
            <p class="success_Message" id="successIpa">Successfull upload</p>
          <%}%>
        </form>
      </div>

      <!-- IT Service Management -->
      <div class="assignment">
        <h2>IT Service Management Assignment</h2>
        <div class="file-row">
          <p>Assignment File</p>
          <a href="pt.pdf" class="download-btn" download>Download</a>
        </div>
        <form class="uploadForm" action="upload_data_bscit" method="post" enctype="multipart/form-data">
          <p>Upload Answer</p>
          <input type="file" name="file" class="file">
          <input type="text" value="ITSma" name="subject" style="display:none;" />
          <button class="upload-btn" type="submit">Upload Answer</button>
          <% 
          if(ITSma==null){%>
            <p class="unsuccess_Message" id="successIpa">Unsuccessfull upload</p>
          <%}
          else{%>
            <p class="success_Message" id="successIpa">Successfull upload</p>
          <%}%>
        </form>
      </div>

      <!-- Security in Computing -->
      <div class="assignment">
        <h2>Security in Computing Assignment</h2>
        <div class="file-row">
          <p>Assignment File</p>
          <a href="pt.pdf" class="download-btn" download>Download</a>
        </div>
        <form class="uploadForm" action="upload_data_bscit" method="post" enctype="multipart/form-data">
          <p>Upload Answer</p>
          <input type="file" name="file" class="file">
          <input type="text" value="Sca" name="subject" style="display:none;" />
          <button class="upload-btn" type="submit" >Upload Answer</button>
          <% 
          if(Sca==null){%>
            <p class="unsuccess_Message" id="successIpa">Unsuccessfull upload</p>
          <%}
          else{%>
            <p class="success_Message" id="successIpa">Successfull upload</p>
          <%}%>
      </div>

      <!-- Principles of GIS -->
      <div class="assignment">
        <h2>Principles of Geographic Information Systems Assignment</h2>
        <div class="file-row">
          <p>Assignment File</p>
          <a href="pt.pdf" class="download-btn" download>Download</a>
        </div>
        <form class="uploadForm" action="upload_data_bscit" method="post" enctype="multipart/form-data">
          <p>Upload Answer</p>
          <input type="file" name="file" class="file">
          <input type="text" value="Pgia" name="subject" style="display:none;" />
          <button class="upload-btn" type="submit" >Upload Answer</button>
          <% 
          if(Pgia==null){%>
            <p class="unsuccess_Message" id="successIpa">Unsuccessfull upload</p>
          <%}
          else{%>
            <p class="success_Message" id="successIpa">Successfull upload</p>
          <%}%>
        </form>
      </div>

      <!-- Software Quality Assurance -->
      <div class="assignment">
        <h2>Software Quality Assurance Assignment</h2>
        <div class="file-row">
          <p>Assignment File</p>
          <a href="pt.pdf" class="download-btn" download>Download</a>
        </div>
        <form class="uploadForm" action="upload_data_bscit" method="post" enctype="multipart/form-data">
          <p>Upload Answer</p>
          <input type="file" name="file" class="file">
          <input type="text" value="Sqaa" name="subject" style="display:none;" />
          <button class="upload-btn" type="submit" >Upload Answer</button>
          <% 
          if(Sqaa==null){%>
            <p class="unsuccess_Message" id="successIpa">Unsuccessfull upload</p>
          <%}
          else{%>
            <p class="success_Message" id="successIpa">Successfull upload</p>
          <%}%>
      </div>
    </div>
  </div>
    <script src="ty/ty.js">
    
    </script>
</body>
</html>