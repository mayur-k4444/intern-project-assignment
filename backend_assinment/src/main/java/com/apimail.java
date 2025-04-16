package com;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/apimail")
public class apimail extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String message = req.getParameter("message");
        String subject = req.getParameter("subject");
        String to = req.getParameter("to");
        String from = req.getParameter("from");

        HttpSession session = req.getSession();
        session.setAttribute("message", message);
        session.setAttribute("subject", subject);
        session.setAttribute("to", to);
        session.setAttribute("from", from);

        SendEmail(message, subject, to, from);
    }
    public static void main(String[] args) {
        
    }
        
    // this is responsible ro send email
    private void SendEmail(String message, String subject, String to, String from) {
        
        // Set the host smtp address
        String host = "smtp.gmail.com";

        //get the system properties
        Properties properties = System.getProperties();
        System.out.println("PROPERTIES: " + properties);

        //Setting importent information ro properties information

        //host set
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");

        //Step 1 : to get session object..
        Session session5 = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("studentassignmentxyzschool@gmail.com","#Student2004");

            }
        });
        session5.setDebug(true);

        //Step 2 : compose the message
        MimeMessage stmMessage = new MimeMessage(session5);

        try {
            //from email
            stmMessage.setFrom(from);

            //adding reciipient to message
            stmMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            //adding subject to message
            stmMessage.setSubject(subject);

            //adding text to message
            stmMessage.setText(message);

            //send
            //Step 3 : send the message using Transport class
            Transport.send(stmMessage);

            System.out.println("Sent successfull email....");
        } catch (Exception e) {
            e.printStackTrace();
        }



    }


}
