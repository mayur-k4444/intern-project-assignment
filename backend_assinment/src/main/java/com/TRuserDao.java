package com;

import java.sql.SQLException;
public interface TRuserDao {

    boolean isValidUser(String TeacherId, String password,String Faculty) throws SQLException;
    String getFaculty(String TeacherId, String password) throws SQLException;
} 
