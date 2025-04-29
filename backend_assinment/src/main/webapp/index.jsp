<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>main page</title>
    <style>
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Fira Sans', sans-serif;
        }
        .title_image{
            width: 100%;
            height: 100vh;
            background-image: linear-gradient(rgba(0,0,0,0.70), rgba(0,0,0,0.70)), url(image/campus-6841791_1920.jpg);
            background-size: cover;
            background-position: center;
            color: white;
            padding: 20% 28%;
            font-size: 35px;
        }
        .title_image button{
            width: 150px;
            height: 40px;
            background-color: #eb0f0f;
            border: none;
            color: white;
            cursor: pointer;   
            transition-duration: 0.4s; 
        }
        .title_image button:hover{
            background-color: white;
            color: #eb0f0f;
        }
        /* Responsive Design */
        @media (max-width: 768px) {
            .title_image h1 {
                font-size: 2rem;
            }
            .button-group a button {
                width: 130px;
                height: 40px;
                font-size: 0.9rem;
            }
        }
        @media (max-width: 480px) {
            .title_image h1 {
                font-size: 1.5rem;
            }
            .button-group {
                flex-direction: column;
                gap: 1rem;
            }
            .button-group a button {
                width: 100%;
                max-width: 250px;
            }
        }
    </style>
</head>
<body>
    <!-- <jsp:include page="/loginindex.jsp"/> -->
    <div class="title_image">
        Application for Assingment Are now open <br>
        <a href="loginindex.jsp"><button>Student Login</button></a>
        <a href="TeacherLogin.jsp"><button>Teacher Login</button></a>
    </div>
</body>
</html>