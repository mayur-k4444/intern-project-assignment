<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>teacher Dashboard</title>
    <link rel="stylesheet" href="teacher.css">
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css'>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    
    <!-- <link rel="stylesheet" href="up_down.css"> -->
</head>
<body>
    <% HttpSession session1 = request.getSession(false);

    String FirstName=null;
    String MiddleName=null;
    String LastName=null;
    String Faculty=null;
    String Email=null;
    String Phone=null;
    if (session1 != null && session1.getAttribute("TeacherId") != null) {
       
        String TeacherId = (String) session1.getAttribute("TeacherId");

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignmentupdow","root","");
            PreparedStatement pr = con.prepareStatement("SELECT * FROM teacherregistration WHERE TeacherId = ?");
            pr.setString(1,TeacherId);
            ResultSet rs = pr.executeQuery();

            if(rs.next()){
                FirstName = rs.getString("firstName");
                MiddleName = rs.getString("middleName");
                LastName = rs.getString("lastName");
                Faculty = rs.getString("Faculty");
                Email = rs.getString("email");
                Phone = rs.getString("Contact");
            }

        }catch(Exception e){
            e.printStackTrace();
        }
        
     %>
    <div class="teacher-header">
        <div class="teacher-manu" onclick="toggleSidebar()">
            <div class="bar"></div>
            <div class="bar"></div>
            <div class="bar"></div>
        </div>
        <h2>Dashboard</h2>
    </div>

    <div class="container">
        <div class="sidebar" id="sidebar">
            <div class="close-sidebar" onclick="toggleSidebar()">×</div>
            <h2>Bsc IT</h2>
            <div class="profile-section">
                <div class="profile-img-wrapper">
                    <img src="teacher_page/img.png" alt="Student Profile" class="profile-img" id="profileImage">
                    <div class="image-options">
                        <label for="imageInput" class="change-photo-label">
                            <span class="material-icons"><img src="teacher_page/image.png" width="20" height="20"></span>
                        </label>
                        <div class="dropdown-menu" id="imageDropdown">
                            <div class="dropdown-item" onclick="openFileInput()">
                                <i class="fas fa-file-upload"></i> Upload File
                            </div>
                            <div class="dropdown-item" onclick="useDefaultImage()">
                                <i class="fas fa-image"></i> Use Default
                            </div>
                        </div>
                    </div>
                    <input type="file" id="imageInput" accept="image/*" style="display: none" onchange="changeProfilePic(event)">
                </div>
                <!-- <h3 id="studentName">Roshni sharma</h3> -->
                 <p id="studentName"><%= FirstName%> <%= LastName%></p>
                <p id="studentId">Teacher ID: <%= TeacherId%></p>
                <!-- <button class="edit-profile-btn" onclick="openModal()">
                    <i class="fas fa-edit"></i> Edit Profile
                </button> -->
            </div>
            <a href="../home page/index.html"><i class="fas fa-home"></i> Profile</a>
            <a href="http://127.0.0.1:3000/up_down%20page/fysyty/fy.html" class="First_Year"><i class="fas fa-user-graduate"></i>Add Assignment</a>
            <a href="#"><i class="fas fa-user-graduate"></i> Show Assignment</a>
            <!-- <a href="#"><i class="fas fa-user-graduate"></i> Third Year</a> -->
            <a href="#" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
<%
    } else {
        // Redirect to the login page if the session is not valid
        response.sendRedirect("index.jsp");
    }
%>

        <!-- <div class="main-content"> 
            <div class="dashboard-header">
                <h1>Welcome, Roshni sharma!</h1>
                <p>Student Dashboard</p>


                <p id="contentArea"> </p>
            </div>-->
            <!-- <div class="content"> -->

                <!-- <iframe src="home.html"></iframe> -->
                <!-- <iframe src="fy/fy.html"></iframe> -->
                <!-- <iframe src="sy/sy.html"></iframe>
                <iframe src="ty/ty.html"></iframe> 
               
            

            
        </div>
    </div>-->

    <!---
    <div class="modal" id="editProfileModal">
        <div class="modal-content">
            <span class="close-btn" onclick="closeModal()">&times;</span>
            <h2>Edit Profile</h2>
            <form id="profileForm" onsubmit="saveProfile(event)">
                <div class="form-group">
                    <label for="name">Full Name</label>
                    <input type="text" id="name" required>
                </div>
                <div class="form-group">
                    <label for="studentIdInput">Student ID</label>
                    <input type="text" id="studentIdInput" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" required>
                </div>
                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="tel" id="phone" required>
                </div>
                <button type="submit" class="save-btn">Save Changes</button>
            </form>
        </div>
    </div>
-->
</div>
    <script src="teacher.js"></script>
    <!-- <script src="https://kit.fontawesome.com/your-font-awesome-kit.js" crossorigin="anonymous"></script> -->
</body>
</html>