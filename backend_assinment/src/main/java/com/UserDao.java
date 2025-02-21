package com;

import java.sql.SQLException;

public interface UserDao {

	boolean isValidUser(String studentId, String password,String Course_list) throws SQLException;
    String getCourseList(String studentId, String password) throws SQLException;
     
} 
