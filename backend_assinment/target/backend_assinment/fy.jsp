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
  <div class="wraper" id="wraper">
        <div class="container_subject">
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
                
                <form action="upload_data_bscit" method="post" enctype="multipart/form-data">
                    <p>Upload Answer</p>
                    <input type="file"  name="file">
                    <input type="text" value="Ipa" name="subject" style="display:none;">
                    <button class="upload-btn" type="submit" onclick="uploadFile('fileIpa', 'Ipa')">Upload Answer</button>
                    <p class="success-Message" id="successIpa" ></p>
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
                    <p class="success-Message" id="successDea"></p>
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
                    <p class="success-Message" id="successOsa"></p>
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
                    <p class="success-Message" id="successDma"></p>
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
                    <p class="success-Message" id="successCsa"></p>
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
                <p class="success-Message" id="successOopa"></p>
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
                    <p class="success-Message" id="successMaa"></p>
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
                    <p class="success-Message" id="successWpa"></p>
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
                    <p class="success-Message" id="successNsa"></p>
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
                    <p class="success-Message" id="successGca"></p>
                </form>
            </div>
        </div>
</div>
    <script src="fy/fy.js">
    
    </script>
</body>
</html>