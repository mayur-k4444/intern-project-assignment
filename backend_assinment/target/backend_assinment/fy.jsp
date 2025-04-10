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
    <!-- <link rel="stylesheet" href="fy.css"> -->
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
        String Ipa = null;
        String Dea = null;
        String Osa = null;
        String Dma = null;
        String Csa = null;
        String Oops = null;
        String Maa = null;
        String Wpa = null;
        String NSma = null;
        String Gca = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignmentupdow","root","");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM bscit WHERE StudentId = ?");
            ps.setString(1, studentId);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Ipa = rs.getString("Ipa");
                Dea = rs.getString("Dea");
                Osa = rs.getString("Osa");
                Dma = rs.getString("Dma");
                Csa = rs.getString("Csa");
                Oops = rs.getString("Oops");
                Maa = rs.getString("Maa");
                Wpa = rs.getString("Wpa");
                NSma = rs.getString("NSma");
                Gca = rs.getString("Gca");
            }
        }catch(ClassNotFoundException | SQLException e){
            System.out.println("Error :"+e.getMessage());
        }
    %>
  <div class="wraper" id="wraper">
        <div class="container_subject">
            <h1>First Year Assignments</h1>
            <h3>SEM I</h3>
            <input type="text" value="<%= studentId%>" name="FirstYear" style="display:none;">
            <!-- Math Assignment -->
            <div class="assignment">
                <h2>Imperative Programming Assignment</h2>
                <div class="file-row">
                <p>Assignment File</p>
                <a href="main/pt.pdf" class="download-btn" download>Download</a>
                </div>
                
                <form action="upload_data_bscit" method="post" enctype="multipart/form-data">
                    <p>Upload Answer</p>
                    <input type="file"  name="file">
                    <input type="text" value="Ipa" name="subject" style="display:none;">
                    <button class="upload-btn" type="submit" onclick="uploadFile('fileIpa', 'Ipa')">Upload Answer</button>
                    <% 
                    if(Ipa==null){%>
                        <p class="unsuccess_Message" id="successIpa">Unsuccessfull upload</p>
                    <%}
                    else{%>
                        <p class="success_Message" id="successIpa">Successfull upload</p>
                    <%}%>
                </form>
            </div>

            <!-- Science Project -->
            <div class="assignment">
                <h2>Digital Electronics Assignment</h2>
                <div class="file-row">
                <p>Assignment File</p>
                <a href="pt.pdf" class="download-btn" download>Download</a>    
                </div>

                <form action="upload_data_bscit" method="post" enctype="multipart/form-data">
                    <p>Upload Answer</p>
                    <input type="file" id="mathfile" name="file">
                    <input type="text" value="Dea" name="subject" style="display:none;">
                    <button class="upload-btn" type="submit" onclick="uploadFile('fileDea', 'Dea')">Upload Answer</button>
                    <% 
                    if(Dea==null){%>
                        <p class="unsuccess_Message" id="successIpa">Unsuccessfull upload</p>
                    <%}
                    else{%>
                        <p class="success_Message" id="successIpa">Successfull upload</p>
                    <%}%>
                </form>
            </div>

            <div class="assignment">
                <h2>Operating Systems Assignment</h2>
                <div class="file-row">
                <p>Assignment File</p>
                <a href="pt.pdf" class="download-btn" download>Download</a>
            </div>
                
                <form action="upload_data_bscit" method="post" enctype="multipart/form-data">
                    <p>Upload Answer</p>
                    <input type="file" id="mathfile" name="file">
                    <input type="text" value="Osa" name="subject" style="display:none;">
                    <button class="upload-btn" type="submit" onclick="uploadFile('fileOsa', 'Osa')">Upload Answer</button>
                    <% 
                    if(Osa==null){%>
                        <p class="unsuccess_Message" id="successIpa">Unsuccessfull upload</p>
                    <%}
                    else{%>
                        <p class="success_Message" id="successIpa">Successfull upload</p>
                    <%}%>
                </form>
            </div>

            <!-- Science Project -->
            <div class="assignment">
                <h2>Discrete Mathematics Assignment</h2>
                <div class="file-row">
                <p>Assignment File</p>
                <a href="pt.pdf" class="download-btn" download>Download</a>    
                </div>

                <form action="upload_data_bscit" method="post" enctype="multipart/form-data">
                    <p>Upload Answer</p>
                    <input type="file" id="mathfile" name="file">
                    <input type="text" value="Dma" name="subject" style="display:none;">
                    <button class="upload-btn" type="submit" onclick="uploadFile('fileDma', 'Dma')">Upload Answer</button>
                    <% 
                    if(Dma==null){%>
                        <p class="unsuccess_Message" id="successIpa">Unsuccessfull upload</p>
                    <%}
                    else{%>
                        <p class="success_Message" id="successIpa">Successfull upload</p>
                    <%}%>
                </form>
            </div>
            <div class="assignment">
                <h2>Communication skills Assignment</h2>
                <div class="file-row">
                <p>Assignment File</p>
                <a href="pt.pdf" class="download-btn" download>Download</a>
                </div>
                

                <form action="upload_data_bscit" method="post" enctype="multipart/form-data">
                    <p>Upload Answer</p>
                    <input type="file" id="mathfile" name="file">
                    <input type="text" value="Csa" name="subject" style="display:none;">
                    <button class="upload-btn" type="submit" onclick="uploadFile('fileCsa','Csa')">Upload Answer</button>
                    <% 
                    if(Csa==null){%>
                        <p class="unsuccess_Message" id="successIpa">Unsuccessfull upload</p>
                    <%}
                    else{%>
                        <p class="success_Message" id="successIpa">Successfull upload</p>
                    <%}%>
                </form>
            </div>
        </div>



        <!-- sem II -->

        <div class="container_subject">
            
            <h3>SEM II</h3>

            <!-- Math Assignment -->
            <div class="assignment">
                <h2>Object Oriented Programming Assignment</h2>
                <div class="file-row">
                <p>Assignment File</p>
                <a href="pt.pdf" class="download-btn" download>Download</a>
            </div>
                
            <form action="upload_data_bscit" method="post" enctype="multipart/form-data">
                <p>Upload Answer</p>
                <input type="file" id="mathfile" name="file">
                <input type="text" value="Oops" name="subject" style="display:none;">
                <button class="upload-btn" type="submit"onclick="uploadFile('fileOopa', 'Oops')">Upload Answer</button>
                <% 
                if(Oops==null){%>
                    <p class="unsuccess_Message" id="successIpa">Unsuccessfull upload</p>
                <%}
                else{%>
                    <p class="success_Message" id="successIpa">Successfull upload</p>
                <%}%>
            </form>
            </div>

            <!-- Science Project -->
            <div class="assignment">
                <h2>Microprocessor architecture Assignment</h2>
                <div class="file-row">
                <p>Assignment File</p>
                <a href="pt.pdf" class="download-btn" download>Download</a>    
                </div>

                <form action="upload_data_bscit" method="post" enctype="multipart/form-data">
                    <p>Upload Answer</p>
                    <input type="file" id="mathfile" name="file">
                    <input type="text" value="Maa" name="subject" style="display:none;">
                    <button class="upload-btn" type="submit" onclick="uploadFile('fileMaa', 'Maa')">Upload Answer</button>
                    <% 
                    if(Maa==null){%>
                        <p class="unsuccess_Message" id="successIpa">Unsuccessfull upload</p>
                    <%}
                    else{%>
                        <p class="success_Message" id="successIpa">Successfull upload</p>
                    <%}%>
                </form>
            </div>

            <div class="assignment">
                <h2>Web programming Assignment</h2>
                <div class="file-row">
                <p>Assignment File</p>
                <a href="pt.pdf" class="download-btn" download>Download</a>
                </div>
                
                <form action="upload_data_bscit" method="post" enctype="multipart/form-data">
                    <p>Upload Answer</p>
                    <input type="file" id="mathfile" name="file">
                    <input type="text" value="Wpa" name="subject" style="display:none;">
                    <button class="upload-btn" onclick="uploadFile('fileWpa','Wpa')" name="upload" type="submit">Upload Answer</button>
                    <% 
                    if(Wpa==null){%>
                        <p class="unsuccess_Message" id="successIpa">Unsuccessfull upload</p>
                    <%}
                    else{%>
                        <p class="success_Message" id="successIpa">Successfull upload</p>
                    <%}%>
                </form>
            </div>

            <!-- Science Project -->
            <div class="assignment">
                <h2>Numerical and Statistical methods Assignment</h2>
                <div class="file-row">
                <p>Assignment File</p>
                <a href="pt.pdf" class="download-btn" download>Download</a>    
                </div>

                <form action="upload_data_bscit" method="post" enctype="multipart/form-data">
                    <p>Upload Answer</p>
                    <input type="file" id="mathfile" name="file">
                    <input type="text" value="NSma" name="subject" style="display:none;">
                    <button class="upload-btn" type="submit" onclick="uploadFile('fileNsa', 'Nsa')">Upload Answer</button>
                    <% 
                    if(NSma==null){%>
                        <p class="unsuccess_Message" id="successIpa">Unsuccessfull upload</p>
                    <%}
                    else{%>
                        <p class="success_Message" id="successIpa">Successfull upload</p>
                    <%}%>
                </form>
            </div>
            <div class="assignment">
                <h2>Green computing Assignment</h2>
                <div class="file-row">
                <p>Assignment File</p>
                <a href="pt.pdf" class="download-btn" download>Download</a>
                </div>


                <form action="upload_data_bscit" method="post" enctype="multipart/form-data">
                    <p>Upload Answer</p>
                    <input type="file" id="mathfile" name="file">
                    <input type="text" value="Gca" name="subject" style="display:none;">
                    <button class="upload-btn" onclick="uploadFile('fileGca','Gca')" name="upload" type="submit">Upload Answer</button>
                    <% 
                    if(Gca==null){%>
                        <p class="unsuccess_Message" id="successIpa">Unsuccessfull upload</p>
                    <%}
                    else{%>
                        <p class="success_Message" id="successIpa">Successfull upload</p>
                    <%}%>
                </form>
            </div>
        </div>
</div>
    <script src="fy/fy.js">
    
    </script>
</body>
</html>