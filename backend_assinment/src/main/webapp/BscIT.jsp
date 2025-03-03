<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bsc Ds page</title>
    <style>
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;

        }
        .contaner_bscit{
            width: 100%;
            height: 100vh;
            display: flex;
            overflow: hidden;
        }
        .nav_bar{
            width: 22%;
            height: 95vh;
            overflow-y: auto;
        }
        .display_bar{
            width: 80%;
            height: 100vh;
            overflow-y: auto;
            position: relative; 
            
        }
        .Student_profile{
            width: 100%;
            height: 100vh;
            padding: 1% 2%;
        }
        .profile-header {
            background: #4f46e5;
            height: 120px;
            position: relative;
        }

        .profile-avatar-container {
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            bottom: -50px;
        }

        .profile-avatar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            border: 4px solid white;
            background: #e5e7eb;
            cursor: pointer;
            object-fit: cover;
        }

        .avatar-upload {
            position: absolute;
            bottom: 0;
            right: 0;
            background: #4f46e5;
            border-radius: 50%;
            padding: 8px;
            cursor: pointer;
            border: 2px solid white;
        }

        .avatar-upload svg {
            width: 16px;
            height: 16px;
            color: white;
        }
        .profile-content {
            padding: 4rem 2rem 2rem 2rem;
        }

        .form-grid {
            display: grid;
            gap: 1.5rem;
            grid-template-columns: 1fr;
        }

        @media (min-width: 640px) {
            .form-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        .form-group label {
            font-size: 0.875rem;
            font-weight: 500;
            color: #374151;
        }

        .input-container {
            display: flex;
            align-items: center;
            border: 1px solid #e5e7eb;
            border-radius: 6px;
            padding: 0.5rem;
            gap: 0.5rem;
        }

        .input-container:focus-within {
            border-color: #4f46e5;
        }

        .input-container svg {
            width: 16px;
            height: 16px;
            color: #6b7280;
        }

        .input-container input {
            border: none;
            outline: none;
            width: 100%;
            font-size: 0.875rem;
        }

        .save-button {
            background: #4f46e5;
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 500;
            margin-top: 1.5rem;
            transition: background-color 0.2s;
        }

        .save-button:hover {
            background: #4338ca;
        }

        #file-input {
            display: none;
        }

        .name-fields {
            grid-column: 1 / -1;
            display: grid;
            grid-template-columns: 1fr;
            gap: 1.5rem;
        }

        @media (min-width: 640px) {
            .name-fields {
                grid-template-columns: repeat(3, 1fr);
            }
        }


        #fy_display{
            width: 100%;
            height: auto;
            padding: 1% 2%;
            display: block;
        }
    </style>
</head>
<body>
    <div class="contaner_bscit">
        <div class="nav_bar">
            <jsp:include page="/up_down.jsp"/>
        </div>
        <div class="display_bar">
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
            <div class="Student_profile">
                <div class="profile-header">
                    <center><h1>Student Profile</h1></center>
                    <div class="profile-avatar-container">
                        <img id="avatar" src="main/img.png" alt="Student profile picture" class="profile-avatar">
                        <label for="file-input" class="avatar-upload">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 9a2 2 0 012-2h.93a2 2 0 001.664-.89l.812-1.22A2 2 0 0110.07 4h3.86a2 2 0 011.664.89l.812 1.22A2 2 0 0018.07 7H19a2 2 0 012 2v9a2 2 0 01-2 2H5a2 2 0 01-2-2V9z" />
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 13a3 3 0 11-6 0 3 3 0 016 0z" />
                            </svg>
                        </label>
                        <input type="file" id="file-input" accept="image/*">
                    </div>
                </div>
                <div class="profile-content">
                    <form id="profile-form" class="form-grid" method="get">
                        <div class="name-fields">
                            <div class="form-group">
                                <label for="first-name">First Name</label>
                                <div class="input-container">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                                    </svg>
                                    <input type="text" id="first-name" value="<%= FirstName%>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="middle-name">Middle Name</label>
                                <div class="input-container">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                                    </svg>
                                    <input type="text" id="middle-name" value="<%= MiddleName%>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="last-name">Last Name</label>
                                <div class="input-container">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                                    </svg>
                                    <input type="text" id="last-name" value="<%=LastName %>">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="student-id">Student ID</label>
                            <div class="input-container">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H5a2 2 0 00-2 2v9a2 2 0 002 2h14a2 2 0 002-2V8a2 2 0 00-2-2h-5m-4 0V5a2 2 0 114 0v1m-4 0a2 2 0 104 0m-5 8a2 2 0 100-4 2 2 0 000 4zm0 0c1.306 0 2.417.835 2.83 2M9 14a3.001 3.001 0 00-2.83 2M15 11h3m-3 4h2" />
                                </svg>
                                <input type="text" id="student-id" value="<%= studentId%>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="course-name">Course Name</label>
                            <div class="input-container">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" />
                                </svg>
                                <input type="text" id="course-name" value="<%= CourseName%>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="student-email">Email</label>
                            <div class="input-container">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                                </svg>
                                <input type="email" id="student-email" value="<%= Email%>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="student-phone">Phone</label>
                            <div class="input-container">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
                                </svg>
                                <input type="tel" id="student-phone" value="<%= Phone%>">
                            </div>
                        </div>
                    </form>
                </div>

            </div>
            <div id="fy_display">
                <form action="upload" method="post" enctype="multipart/form-data">
                    <jsp:include page="/fy.jsp"/>
                </form>
            </div>
<%
        } else {
            // Redirect to the login page if the session is not valid
            response.sendRedirect("index.jsp");
        }
%>
            
        </div>

    </div>
    <script>
        // Handle profile picture upload
        const fileInput = document.getElementById('file-input');
        const avatar = document.getElementById('avatar');

        fileInput.addEventListener('change', function(e) {
            const file = e.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    avatar.src = e.target.result;
                }
                reader.readAsDataURL(file);
            }
        });
    </script>
    
</body>
</html>