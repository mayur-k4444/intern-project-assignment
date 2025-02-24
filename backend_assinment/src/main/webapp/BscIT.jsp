<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
            width: auto;
            height: 100vh;
            overflow-y: auto;
        }
        .display_bar{
            width: 83%;
            height: 100vh;
            overflow-y: auto;
            position: relative; 
            
        }
        .Student_profile{
            width: 100%;
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
            ring: 2px solid #4f46e5;
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

        .button-container {
            display: flex;
            justify-content: flex-end;
        }


    </style>
</head>
<body>
    <div class="contaner_bscit">
        <div class="nav_bar">
            <%@ include file="up_down.html" %>
        </div>
        <div class="display_bar">
            <div class="Student_profile">
                <div class="profile-header">
                    <center><h1>Student Profile</h1></center>
                    <div class="profile-avatar-container">
                        <img id="avatar" src="https://via.placeholder.com/100" alt="Student profile picture" class="profile-avatar">
                        <label for="file-input" class="avatar-upload">
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 9a2 2 0 012-2h.93a2 2 0 001.664-.89l.812-1.22A2 2 0 0110.07 4h3.86a2 2 0 011.664.89l.812 1.22A2 2 0 0018.07 7H19a2 2 0 012 2v9a2 2 0 01-2 2H5a2 2 0 01-2-2V9z" />
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 13a3 3 0 11-6 0 3 3 0 016 0z" />
                            </svg>
                        </label>
                        <input type="file" id="file-input" accept="image/*">
                    </div>
                </div>
<% String stdid = request.getParameter("studentId");
if(stdid == null || stdid.isEmpty()){
    out.println(<p>Error : Student Id is missing</p>);
    return;
}
try{
    
}
%>
                <div class="profile-content">
                    <form id="profile-form" class="form-grid" method="get">
                        <div class="form-group">
                            <label for="student-name">Full Name</label>
                            <div class="input-container">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                                </svg>
                                <input type="text" id="student-name" placeholder="Enter your full name" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="student-id">Student ID</label>
                            <div class="input-container">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H5a2 2 0 00-2 2v9a2 2 0 002 2h14a2 2 0 002-2V8a2 2 0 00-2-2h-5m-4 0V5a2 2 0 114 0v1m-4 0a2 2 0 104 0m-5 8a2 2 0 100-4 2 2 0 000 4zm0 0c1.306 0 2.417.835 2.83 2M9 14a3.001 3.001 0 00-2.83 2M15 11h3m-3 4h2" />
                                </svg>
                                <input type="text" id="student-id" placeholder="Enter your student ID" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="student-email">Email</label>
                            <div class="input-container">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                                </svg>
                                <input type="email" id="student-email" placeholder="Enter your email" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="student-phone">Phone</label>
                            <div class="input-container">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
                                </svg>
                                <input type="tel" id="student-phone" placeholder="Enter your phone number" required>
                            </div>
                        </div>
                        <div class="button-container" style="grid-column: 1 / -1;">
                            <button type="submit" class="save-button">Save Changes</button>
                        </div>
                    </form>
                </div>
            </div>
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