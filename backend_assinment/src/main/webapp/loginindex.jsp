<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <link rel="stylesheet" href="loginstyle.css">
</head>
<body>
    <div class="contaner">
        <h1>Student Login</h1>
        <form action="loginform" method="post" name="Login_form" onsubmit=" return loginalert()">
            <div class="input-group">
                <label for="studentId">Student ID</label>
                <input type="text" id="studentId" name="studentId" >
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" name="password" id="password">
            </div>
            <button type="submit" name="submit">Submit</button>
            <a href="registrationindex.html">Student Registration</a>
            <label for="error" id="error" name="error"></label>
            <% String error = request.getParameter("error");
            if(error != null && error.equals("1")){ %>
                <p style="color: red;">Invalid studentId and password. Please try again.</p>
        <% } %>
        </form>
    </div>
    <script src="loginscript.js"></script>
</body>
</html>