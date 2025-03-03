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
  <div class="wraper">
    <div class="container">
        <h1>First Year Assignments</h1>
        <h3>SEM I</h3>


        <input type="text" value="FY" name="FirstYear" style="display:none;">
        <!-- Math Assignment -->
        <div class="assignment">
            <h2>Imperative Programming Assignment</h2>
            <div class="file-row">
            <p>Assignment File</p>
            <a href="main/pt.pdf" class="download-btn" download>Download</a>
        </div>
             
            <p>Upload Answer</p>
            <input type="file" id="mathfile" name="Ipa">
            <button class="upload-btn" onclick="uploadFile('mathfile','mathsuccess')" name="upload1" type="submit">Upload Answer</button>
            <p class="success-Message" id="mathsuccess"></p>
        </div>

        <!-- Science Project -->
        <div class="assignment">
            <h2>Digital Electronics Assignment</h2>
            <div class="file-row">
            <p>Assignment File</p>
           
            <a href="pt.pdf" class="download-btn" download>Download</a>    
            </div>
            <p>Upload Answer</p>
            <input type="file" id="mathfile" name="Dea">
            <button class="upload-btn" onclick="uploadFile('mathfile','mathsuccess')" name="upload" type="submit">Upload Answer</button>
            <p class="success-Message" id="mathFilesuccess"></p>
        </div>

        <div class="assignment">
            <h2>Operating Systems Assignment</h2>
            <div class="file-row">
            <p>Assignment File</p>
            <a href="pt.pdf" class="download-btn" download>Download</a>
        </div>
             
            <p>Upload Answer</p>
            <input type="file" id="mathfile" name="Osa">
            <button class="upload-btn" onclick="uploadFile('mathfile','mathsuccess')">Upload Answer</button>
            <p class="success-Message" id="mathsuccess"></p>
        </div>

        <!-- Science Project -->
        <div class="assignment">
            <h2>Discrete Mathematics Assignment</h2>
            <div class="file-row">
            <p>Assignment File</p>
           
            <a href="pt.pdf" class="download-btn" download>Download</a>    
            </div>
            <p>Upload Answer</p>
            <input type="file" id="mathfile" name="Dma">
            <button class="upload-btn" onclick="uploadFile('sciencefile','mathsuccess')">Upload Answer</button>
            <p class="success-Message" id="mathFilesuccess"></p>
        </div>
        <div class="assignment">
            <h2>Communication skills Assignment</h2>
            <div class="file-row">
            <p>Assignment File</p>
            <a href="pt.pdf" class="download-btn" download>Download</a>
        </div>
             
            <p>Upload Answer</p>
            <input type="file" id="mathfile" name="Csa">
            <button class="upload-btn" onclick="uploadFile('mathfile','mathsuccess')">Upload Answer</button>
            <p class="success-Message" id="mathsuccess"></p>
        </div>
    </div>



  <!-- sem II -->

    <div class="container">
        
        <h3>SEM II</h3>

        <!-- Math Assignment -->
        <div class="assignment">
            <h2>Object Oriented Programming Assignment</h2>
            <div class="file-row">
            <p>Assignment File</p>
            <a href="pt.pdf" class="download-btn" download>Download</a>
        </div>
             
            <p>Upload Answer</p>
            <input type="file" id="mathfile" name="Oopa">
            <button class="upload-btn" onclick="uploadFile('mathfile','mathsuccess')">Upload Answer</button>
            <p class="success-Message" id="mathsuccess"></p>
        </div>

        <!-- Science Project -->
        <div class="assignment">
            <h2>Microprocessor architecture Assignment</h2>
            <div class="file-row">
            <p>Assignment File</p>
           
            <a href="pt.pdf" class="download-btn" download>Download</a>    
            </div>
            <p>Upload Answer</p>
            <input type="file" id="mathfile" name="Maa">
            <button class="upload-btn" onclick="uploadFile('mathfile','mathsuccess')">Upload Answer</button>
            <p class="success-Message" id="mathFilesuccess"></p>
        </div>

        <div class="assignment">
            <h2>Web programming Assignment</h2>
            <div class="file-row">
            <p>Assignment File</p>
            <a href="pt.pdf" class="download-btn" download>Download</a>
        </div>
             
            <p>Upload Answer</p>
            <input type="file" id="mathfile" name="Wpa">
            <button class="upload-btn" onclick="uploadFile('mathfile','mathsuccess')">Upload Answer</button>
            <p class="success-Message" id="mathsuccess"></p>
        </div>

        <!-- Science Project -->
        <div class="assignment">
            <h2>Numerical and Statistical methods Assignment</h2>
            <div class="file-row">
            <p>Assignment File</p>
           
            <a href="pt.pdf" class="download-btn" download>Download</a>    
            </div>
            <p>Upload Answer</p>
            <input type="file" id="mathfile" name="NSma">
            <button class="upload-btn" onclick="uploadFile('sciencefile','mathsuccess')">Upload Answer</button>
            <p class="success-Message" id="mathFilesuccess"></p>
        </div>
        <div class="assignment">
            <h2>Green computing Assignment</h2>
            <div class="file-row">
            <p>Assignment File</p>
            <a href="pt.pdf" class="download-btn" download>Download</a>
        </div>
             
            <p>Upload Answer</p>
            <input type="file" id="mathfile" name="Gca">
            <button class="upload-btn" onclick="uploadFile('mathfile','mathsuccess')">Upload Answer</button>
            <p class="success-Message" id="mathsuccess"></p>
        </div>
    </div>
</div>
    <script src="fy/fy.js">
    
    </script>
</body>
</html>