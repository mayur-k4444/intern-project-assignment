<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Assignment page</title>
    <link rel="stylesheet" href="add_assign.css">
</head>
<body>
<form action="addsubject" method="post" enctype="multipart/form-data">
<div class="assignment-container">
      <h1>Add Assignment</h1>
      <div class="form-row">
        <input type="text" id="taskInput" name="subject" placeholder="Enter a new Assignment..." />
        <input type="file" id="assign" name="file" />
        <button name="submit" type="submit">Add</button>
      </div>
      <ul id="taskList"></ul>
  </div>
</form>
  <script src="add_assign.js"></script>
</body>
</html>

