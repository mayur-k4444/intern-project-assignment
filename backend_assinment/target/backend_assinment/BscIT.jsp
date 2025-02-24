<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    </style>
</head>
<body>
    <div class="contaner_bscit">
        <div class="nav_bar">
            <%@ include file="up_down.html" %>
        </div>
        <div class="display_bar">
         <div class="Student_profile">
            Welcome bsc it
         </div>
        </div>

    </div>
    
    
</body>
</html>