package com;

import java.io.IOException;
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
// import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/addsubject")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, // 1MB
    maxFileSize = 1024 * 1024 * 50,  // 50MB
    maxRequestSize = 1024 * 1024 * 100 // 100MB
)
public class addsubject extends HttpServlet{
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "C:\\Assingment-project\\BsitSuject";

    public addsubject() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // HttpSession session = req.getSession();
            String subject = req.getParameter("subject");
            Part filePart = req.getPart("file");

            String fileName = getFileName(filePart);

            Path uploadPath = Paths.get(UPLOAD_DIR);
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }
            // Save file
            Path filePath = uploadPath.resolve(fileName);
            filePart.write(filePath.toString());

            // Save file path to database
            saveFilePathToDatabase(subject, filePath.toString());
            resp.sendRedirect(".jsp");
                        
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
    private void saveFilePathToDatabase(String subject, String filePath) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignmentupdow","root","");
            PreparedStatement pr = con.prepareStatement("insert into subjectdatabase (Subject, filename) values (?, ?)");
            pr.setString(1, subject);
            pr.setString(2, filePath);
            pr.executeUpdate();
            System.out.println("File path saved to database successfully.");
            pr.close();
            
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
