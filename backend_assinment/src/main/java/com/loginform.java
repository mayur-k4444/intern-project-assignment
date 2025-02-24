package com;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/loginform")
public class loginform extends HttpServlet{
    public static UserDao userDao = new UserDaoImp();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        String studentId = req.getParameter("studentId");
        String password = req.getParameter("password");

        try{
            String Course_list = userDao.getCourseList(studentId,password);

            if (userDao.isValidUser(studentId,password,Course_list)) {
                HttpSession session = req.getSession();
                session.setAttribute("studenId",studentId);
                session.setAttribute("password", password);
                session.setAttribute("Course_list", Course_list);

                if (Course_list.equals("BscIT")) {
                    
                    resp.sendRedirect("BscIT.jsp");
                }
                req.getRequestDispatcher("loginindex.jsp");
                // resp.sendRedirect("");
                // System.out.println("login hade succesfolly");
            }else {
                resp.sendRedirect("loginindex.jsp?error=1");
                System.out.println("user is wrong"); 
            }
        }catch(Exception e){
            System.out.println("Error :"+e.getMessage());
        }
    }

}
