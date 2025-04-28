package com;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/TeacherLoginform")
public class TeacherLoginform extends HttpServlet{
    public static TRuserDao TRuserDao = new TRuserDaoImp();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        String TeacherId = req.getParameter("TeacherId");
        String password = req.getParameter("password");
        HttpSession session3 = req.getSession();
        session3.setAttribute("TeacherId", "someTeacherId");


        try{
            String Faculty = TRuserDao.getFaculty(TeacherId,password);

            if (TRuserDao.isValidUser(TeacherId,password,Faculty)) {
                HttpSession session = req.getSession();
                session.setAttribute("TeacherId",TeacherId);
                session.setAttribute("password", password);
                session.setAttribute("Faculty", Faculty);

                if (Faculty.equals("BscIT")) {
                    
                    resp.sendRedirect("TRBscIT.jsp");
                }
                req.getRequestDispatcher("loginindex.jsp");
                
            }
          
        }catch(Exception e){
            System.out.println("Error :"+e.getMessage());
        }
    }

}
