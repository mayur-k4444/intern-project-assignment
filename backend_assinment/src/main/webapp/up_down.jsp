<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
    <link rel="stylesheet" href="main/up_down.css">
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-solid-rounded/css/uicons-solid-rounded.css'>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    
    <link rel="stylesheet" href="main/up_down.css">
</head>
<body>
    <% HttpSession session1 = request.getSession(false);

String FirstName=null;
String MiddleName=null;
String LastName=null;
String CourseName=null;
String Email=null;
String Phone=null;
// Check if the session is not null and the username attribute is set
if (session1 != null && session1.getAttribute("studentId") != null) {
    // Get the username from the session
    String studentId = (String) session1.getAttribute("studentId");

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignmentupdow","root","");
        PreparedStatement pr = con.prepareStatement("SELECT * FROM registration WHERE studentId = ?");
        pr.setString(1,studentId);
        ResultSet rs = pr.executeQuery();

        if(rs.next()){
            FirstName = rs.getString("firstName");
            MiddleName = rs.getString("middleName");
            LastName = rs.getString("lastName");
            CourseName = rs.getString("Course_list");
            Email = rs.getString("email");
            Phone = rs.getString("contact");
        }

    }catch(ClassNotFoundException | SQLException e){
        System.out.println("Error :"+e.getMessage());
    }
%>
    <div class="mobile-header">
        <div class="hamburger-menu" onclick="toggleSidebar()">
            <div class="bar"></div>
            <div class="bar"></div>
            <div class="bar"></div>
        </div>
        <h2>Dashboard</h2>
    </div>
    <div class="container_mean_nava">
    <div class="container_bar">
        <div class="sidebar" id="sidebar">
            <div class="close-sidebar" onclick="toggleSidebar()">×</div>
            <h2>Bsc IT</h2>
            <div class="profile-section">
                <div class="profile-img-wrapper">
                    <img src="main/img.png" alt="Student Profile" class="profile-img" id="profileImage">
                    <div class="image-options">
                        <label for="imageInput" class="change-photo-label">
                            <span class="material-icons"><img src="main/image.png" width="20" height="20"></span>
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
                 <p id="studentName"><%= FirstName %></p>
                <p id="studentId">Student ID:<%= studentId%></p>
                <!-- <button class="edit-profile-btn" onclick="openModal()">
                    <i class="fas fa-edit"></i> Edit Profile
                </button> -->
            </div>
            <a href="BscIT.jsp"><i class="fas fa-home"></i>Student Profile</a>
            <a href="#wraper" class="First_Year"><i class="fas fa-user-graduate"></i> Download Assignment</a>
            <a href="#secondwraper"><i class="fas fa-user-graduate"></i> Upload Assignment</a>
            <!-- <a href="#Thirdwraper"><i class="fas fa-user-graduate"></i> Third Year</a> -->
            <a href="logout" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>

        <!-- <div class="main-content">
            <div class="dashboard-header">
                <h1>Welcome, Roshni sharma!</h1>
                <p>Student Dashboard</p>
            </div>
        </div> -->
    </div>
    </div>

    <%
        } else {
            // Redirect to the login page if the session is not valid
            response.sendRedirect("index.jsp");
        }
%>
    <!-- Modal -->
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

    <script src="main/script.js"></script>
    <script src="https://kit.fontawesome.com/your-font-awesome-kit.js" crossorigin="anonymous"></script>
</body>
</html>