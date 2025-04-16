<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Assignments</title>
    <link rel="stylesheet" href="sy/sy.css">

</head>
<body>
    <%
        String studentId = (String) session.getAttribute("studentId");
        String subject = request.getParameter("subject");
        if (studentId == null) {
            response.sendRedirect("loginindex.jsp");
            return;
        }
        String Ppa = null;
        String Dsa = null;
        String Cna = null;
        String Dbmsa = null;
        String Ama = null;
        String Cja = null;
        String Esa = null;
        String Costa = null;
        String Sea = null;
        String Cgaa = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignmentupdow","root","");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM bscit WHERE StudentId = ?");
            ps.setString(1, studentId);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Ppa = rs.getString("Ppa");
                Dsa = rs.getString("Dsa");
                Cna = rs.getString("Cna");
                Dbmsa = rs.getString("Dbmsa");
                Ama = rs.getString("Ama");
                Cja = rs.getString("Cja");
                Esa = rs.getString("Esa");
                Costa = rs.getString("Costa");
                Sea = rs.getString("Sea");
                Cgaa = rs.getString("Cgaa");
            }
        }catch(ClassNotFoundException | SQLException e){
            System.out.println("Error :"+e.getMessage());
        }
    %>
    <div class="wraper" id="secondwraper">
        <div class="container_subject">
            <h1>Second Year Assignments</h1>
            <h3>SEM III</h3>
            <input type="text" value="SY" name="SecondYear" style="display:none;">
    
            <!-- Python Programming -->
            <div class="assignment">
                <h2>Python Programming Assignment</h2>
                <div class="file-row">
                    <p>Assignment File</p>
                    <a href="pt.pdf" class="download-btn" download>Download</a>
                </div>
                <form class="uploadForm" action="upload_data_bscit" method="post" enctype="multipart/form-data">
                    <p>Upload Answer</p>
                    <input type="file" name="file" class="file">
                    <input type="text" value="Ppa" name="subject" style="display:none;">
                    <button class="upload-btn" type="submit">Upload Answer</button>
                    <% 
                    if(Ppa==null){%>
                        <p class="unsuccess_Message" id="successIpa">Unsuccessfull upload</p>
                    <%}
                    else{%>
                        <p class="success_Message" id="successIpa">Successfull upload</p>
                    <%}%>
                </form>
            </div>
    
            <!-- Data Structures -->
            <div class="assignment">
                <h2>Data Structures Assignment</h2>
                <div class="file-row">
                    <p>Assignment File</p>
                    <a href="pt.pdf" class="download-btn" download>Download</a>
                </div>
                <form class="uploadForm" action="upload_data_bscit" method="post" enctype="multipart/form-data">
                    <p>Upload Answer</p>
                    <input type="file" name="file" class="file">
                    <input type="text" value="Dsa" name="subject" style="display:none;">
                    <button class="upload-btn" type="submit">Upload Answer</button>
                    <% 
                    if(Dsa==null){%>
                        <p class="unsuccess_Message" id="successIpa">Unsuccessfull upload</p>
                    <%}
                    else{%>
                        <p class="success_Message" id="successIpa">Successfull upload</p>
                    <%}%>
                </form>
            </div>
    
            <!-- Computer Networks -->
            <div class="assignment">
                <h2>Computer Networks Assignment</h2>
                <div class="file-row">
                    <p>Assignment File</p>
                    <a href="pt.pdf" class="download-btn" download>Download</a>
                </div>
                <form class="uploadForm" action="upload_data_bscit" method="post" enctype="multipart/form-data">
                    <p>Upload Answer</p>
                    <input type="file" name="file" class="file">
                    <input type="text" value="Cna" name="subject" style="display:none;">
                    <button class="upload-btn" type="submit">Upload Answer</button>
                    <% 
                    if(Cna==null){%>
                        <p class="unsuccess_Message" id="successIpa">Unsuccessfull upload</p>
                    <%}
                    else{%>
                        <p class="success_Message" id="successIpa">Successfull upload</p>
                    <%}%>
                </form>
            </div>
    
            <!-- DBMS -->
            <div class="assignment">
                <h2>Database Management Systems Assignment</h2>
                <div class="file-row">
                    <p>Assignment File</p>
                    <a href="pt.pdf" class="download-btn" download>Download</a>
                </div>
                <form class="uploadForm" action="upload_data_bscit" method="post" enctype="multipart/form-data">
                    <p>Upload Answer</p>
                    <input type="file" name="file" class="file">
                    <input type="text" value="Dbmsa" name="subject" style="display:none;">
                    <button class="upload-btn" type="submit" >Upload Answer</button>
                    <% 
                    if(Dbmsa==null){%>
                        <p class="unsuccess_Message" id="successIpa">Unsuccessfull upload</p>
                    <%}
                    else{%>
                        <p class="success_Message" id="successIpa">Successfull upload</p>
                    <%}%>
                </form>
            </div>
    
            <!-- Applied Mathematics -->
            <div class="assignment">
                <h2>Applied Mathematics Assignment</h2>
                <div class="file-row">
                    <p>Assignment File</p>
                    <a href="pt.pdf" class="download-btn" download>Download</a>
                </div>
                <form class="uploadForm" action="upload_data_bscit" method="post" enctype="multipart/form-data">
                    <p>Upload Answer</p>
                    <input type="file" name="file" class="file">
                    <input type="text" value="Ama" name="subject" style="display:none;">
                    <button class="upload-btn" type="submit">Upload Answer</button>
                    <% 
                    if(Ama==null){%>
                        <p class="unsuccess_Message" id="successIpa">Unsuccessfull upload</p>
                    <%}
                    else{%>
                        <p class="success_Message" id="successIpa">Successfull upload</p>
                    <%}%>
            </div>
        </div>
    
        <!-- SEM IV -->
        <div class="container_subject">
            <h3>SEM IV</h3>
    
            <!-- Core Java -->
            <div class="assignment">
                <h2>Core Java Assignment</h2>
                <div class="file-row">
                    <p>Assignment File</p>
                    <a href="pt.pdf" class="download-btn" download>Download</a>
                </div>
                <form class="uploadForm" action="upload_data_bscit" method="post" enctype="multipart/form-data">
                    <p>Upload Answer</p>
                    <input type="file" name="file" class="file">
                    <input type="text" value="Cja" name="subject" style="display:none;">
                    <button class="upload-btn" type="submit" >Upload Answer</button>
                    <% 
                    if(Cja==null){%>
                        <p class="unsuccess_Message" id="successIpa">Unsuccessfull upload</p>
                    <%}
                    else{%>
                        <p class="success_Message" id="successIpa">Successfull upload</p>
                    <%}%>
                </form>
            </div>
    
            <!-- Embedded System -->
            <div class="assignment">
                <h2>Introduction to Embedded System Assignment</h2>
                <div class="file-row">
                    <p>Assignment File</p>
                    <a href="pt.pdf" class="download-btn" download>Download</a>
                </div>
                <form class="uploadForm" action="upload_data_bscit" method="post" enctype="multipart/form-data">
                    <p>Upload Answer</p>
                    <input type="file" name="file" class="file">
                    <input type="text" value="Esa" name="subject" style="display:none;">
                    <button class="upload-btn" type="submit">Upload Answer</button>
                    <% 
                    if(Esa==null){%>
                        <p class="unsuccess_Message" id="successIpa">Unsuccessfull upload</p>
                    <%}
                    else{%>
                        <p class="success_Message" id="successIpa">Successfull upload</p>
                    <%}%>
                </form>
            </div>
    
            <!-- Statistical Techniques -->
            <div class="assignment">
                <h2>Computer Oriented Statistical Techniques Assignment</h2>
                <div class="file-row">
                    <p>Assignment File</p>
                    <a href="pt.pdf" class="download-btn" download>Download</a>
                </div>
                <form class="uploadForm" action="upload_data_bscit" method="post" enctype="multipart/form-data">
                    <p>Upload Answer</p>
                    <input type="file" name="file" class="file">
                    <input type="text" value="Costa" name="subject" style="display:none;">
                    <button class="upload-btn" type="submit" >Upload Answer</button>
                    <% 
                    if(Costa==null){%>
                        <p class="unsuccess_Message" id="successIpa">Unsuccessfull upload</p>
                    <%}
                    else{%>
                        <p class="success_Message" id="successIpa">Successfull upload</p>
                    <%}%>
                </form>
            </div>
    
            <!-- Software Engineering -->
            <div class="assignment">
                <h2>Software Engineering Assignment</h2>
                <div class="file-row">
                    <p>Assignment File</p>
                    <a href="pt.pdf" class="download-btn" download>Download</a>
                </div>
                <form class="uploadForm" action="upload_data_bscit" method="post" enctype="multipart/form-data">
                    <p>Upload Answer</p>
                    <input type="file" name="file" class="file">
                    <input type="text" value="Sea" name="subject" style="display:none;">
                    <button class="upload-btn" type="submit">Upload Answer</button>
                    <% 
                    if(Sea==null){%>
                        <p class="unsuccess_Message" id="successIpa">Unsuccessfull upload</p>
                    <%}
                    else{%>
                        <p class="success_Message" id="successIpa">Successfull upload</p>
                    <%}%>
                </form>
            </div>
    
            <!-- CG & Animation -->
            <div class="assignment">
                <h2>Computer Graphics and Animation Assignment</h2>
                <div class="file-row">
                    <p>Assignment File</p>
                    <a href="pt.pdf" class="download-btn" download>Download</a>
                </div>
                <form class="uploadForm" action="upload_data_bscit" method="post" enctype="multipart/form-data">
                    <p>Upload Answer</p>
                    <input type="file" name="file" class="file">
                    <input type="text" value="Cgaa" name="subject" style="display:none;">
                    <button class="upload-btn" type="submit">Upload Answer</button>
                    <% 
                    if(Cgaa==null){%>
                        <p class="unsuccess_Message" id="successIpa">Unsuccessfull upload</p>
                    <%}
                    else{%>
                        <p class="success_Message" id="successIpa">Successfull upload</p>
                    <%}%>
                </form>
            </div>
        </div>
    </div>
    <script src="sy/sy.js">
    
    </script>
</body>
</html>