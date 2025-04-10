package com;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/upload_data_bscit")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, // 1MB
    maxFileSize = 1024 * 1024 * 50,  // 50MB
    maxRequestSize = 1024 * 1024 * 100 // 100MB
)
public class UploadDataMultiple extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "C:\\Assingment-project\\bscitupload";

    public UploadDataMultiple() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json"); // Set response type to JSON
        String responseMessage = "";

        try {
            HttpSession session = req.getSession();
            Object studentIdObj = session.getAttribute("studentId");
            // if (studentIdObj == null) {
            //     responseMessage = "{\"status\":\"error\", \"message\":\"Student ID not found in session.\"}";
            //     resp.getWriter().write(responseMessage);
            //     return;
            // }
            String studentId = studentIdObj.toString();

            String subject = req.getParameter("subject");
            Part filePart = req.getPart("file");

            if (filePart == null || filePart.getSize() <= 0) {
                responseMessage = "{\"status\":\"error\", \"message\":\"No file selected.\"}";
                resp.getWriter().write(responseMessage);
                return;
            }

            String fileName = getFileName(filePart);
            if (fileName == null) {
                responseMessage = "{\"status\":\"error\", \"message\":\"Invalid file name.\"}";
                resp.getWriter().write(responseMessage);
                return;
            }

            // Ensure upload directory exists
            Path uploadPath = Paths.get(UPLOAD_DIR);
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            // Save file
            Path filePath = uploadPath.resolve(studentId + "_" + fileName);
            filePart.write(filePath.toString());

            // Save file path to database
            saveFilePathToDatabase(subject, filePath.toString(), studentId);
            resp.sendRedirect("BscIT.jsp");

            // responseMessage = "{\"status\":\"success\", \"message\":\"File uploaded successfully.\"}";
        } catch (Exception e) {
            responseMessage = "{\"status\":\"error\", \"message\":\"Error uploading file: " + e.getMessage() + "\"}";
            System.out.println("Error: " + e);
        }

        resp.getWriter().write(responseMessage);
    }

    private void saveFilePathToDatabase(String subject, String filePath, String studentId) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignmentupdow","root","");
            PreparedStatement ps = con.prepareStatement("UPDATE bscit SET " + subject + " = ? WHERE studentId = ?");
            ps.setString(1, filePath);
            ps.setString(2, studentId);
            ps.executeUpdate();
            System.out.println("File path saved to database.");
            
        } catch (Exception e) {
            System.out.println("Error saving to database: " + e);
        }
    }

    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return null;
        
    }
}
